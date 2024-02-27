import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '/backend/schema/structs/index.dart';

import '/backend/supabase/supabase.dart';
import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? NavBarPage() : LoginWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? NavBarPage() : LoginWidget(),
        ),
        FFRoute(
          name: 'orai',
          path: '/orai',
          builder: (context, params) =>
              params.isEmpty ? NavBarPage(initialPage: 'orai') : OraiWidget(),
        ),
        FFRoute(
          name: 'pin',
          path: '/pin',
          builder: (context, params) => PinWidget(),
        ),
        FFRoute(
          name: 'tarpin',
          path: '/tarpin',
          builder: (context, params) => TarpinWidget(),
        ),
        FFRoute(
          name: 'Items',
          path: '/items',
          builder: (context, params) => ItemsWidget(),
        ),
        FFRoute(
          name: 'itemdetails',
          path: '/itemdetails',
          builder: (context, params) => ItemdetailsWidget(),
        ),
        FFRoute(
          name: 'AddItem',
          path: '/addItem',
          builder: (context, params) => AddItemWidget(),
        ),
        FFRoute(
          name: 'tarhome',
          path: '/tarhome',
          builder: (context, params) => TarhomeWidget(),
        ),
        FFRoute(
          name: 'ItemGroup',
          path: '/itemGroup',
          builder: (context, params) => ItemGroupWidget(),
        ),
        FFRoute(
          name: 'settings',
          path: '/settings',
          builder: (context, params) => SettingsWidget(),
        ),
        FFRoute(
          name: 'login',
          path: '/login',
          builder: (context, params) => LoginWidget(
            name: params.getParam('name', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'storedetails',
          path: '/storedetails',
          builder: (context, params) => StoredetailsWidget(),
        ),
        FFRoute(
          name: 'Tables',
          path: '/tables',
          builder: (context, params) => TablesWidget(),
        ),
        FFRoute(
          name: 'convos',
          path: '/convos',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'convos')
              : ConvosWidget(),
        ),
        FFRoute(
          name: 'tar',
          path: '/tar',
          builder: (context, params) => TarWidget(),
        ),
        FFRoute(
          name: 'tarmenu',
          path: '/tarmenu',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'tarmenu')
              : TarmenuWidget(),
        ),
        FFRoute(
          name: 'par',
          path: '/par',
          builder: (context, params) => ParWidget(),
        ),
        FFRoute(
          name: 't1',
          path: '/t1',
          builder: (context, params) => T1Widget(),
        ),
        FFRoute(
          name: 'itemspage2',
          path: '/itemspage2',
          builder: (context, params) => Itemspage2Widget(
            tableno: params.getParam('tableno', ParamType.int),
            gu: params.getParam('gu', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'cartpage',
          path: '/cartpage',
          builder: (context, params) => CartpageWidget(
            table: params.getParam('table', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'a-people',
          path: '/aaa',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: APeopleWidget(
              userid: params.getParam('userid', ParamType.String),
            ),
          ),
        ),
        FFRoute(
          name: 'convo',
          path: '/convo',
          builder: (context, params) => ConvoWidget(
            name: params.getParam('name', ParamType.String),
            convoid: params.getParam('convoid', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'a-all',
          path: '/aAll',
          builder: (context, params) => AAllWidget(),
        ),
        FFRoute(
          name: 'cmslist',
          path: '/cmslist',
          builder: (context, params) => CmslistWidget(),
        ),
        FFRoute(
          name: 'parplans',
          path: '/parplans',
          builder: (context, params) => ParplansWidget(),
        ),
        FFRoute(
          name: 'path',
          path: '/path',
          builder: (context, params) => PathWidget(),
        ),
        FFRoute(
          name: 'post',
          path: '/post',
          builder: (context, params) => PostWidget(
            content: params.getParam('content', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'md',
          path: '/md',
          builder: (context, params) => MdWidget(
            content: params.getParam('content', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'paraisync',
          path: '/paraisync',
          builder: (context, params) => ParaisyncWidget(),
        ),
        FFRoute(
          name: 'dbset',
          path: '/dbset',
          builder: (context, params) => DbsetWidget(),
        ),
        FFRoute(
          name: 'a-convos',
          path: '/aConvos',
          builder: (context, params) => AConvosWidget(),
        ),
        FFRoute(
          name: 'parcollab',
          path: '/parcollab',
          builder: (context, params) => ParcollabWidget(),
        ),
        FFRoute(
          name: 'parmenu',
          path: '/parmenu',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: ParmenuWidget(),
          ),
        ),
        FFRoute(
          name: 'menu',
          path: '/menu',
          builder: (context, params) => MenuWidget(),
        ),
        FFRoute(
          name: 'convod1',
          path: '/convod1',
          builder: (context, params) => Convod1Widget(
            name: params.getParam('name', ParamType.String),
            convoid: params.getParam('convoid', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'a-stores',
          path: '/aa',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: AStoresWidget(
              userid: params.getParam('userid', ParamType.String),
            ),
          ),
        ),
        FFRoute(
          name: 'a-search',
          path: '/aSearch',
          builder: (context, params) => ASearchWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/login';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Center(
                    child: Image.asset(
                      'assets/images/Group_7.png',
                      width: 100.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(
        hasTransition: true,
        transitionType: PageTransitionType.fade,
        duration: Duration(milliseconds: 0),
      );
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouter.of(context).location;
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}
