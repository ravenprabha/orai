import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'backend/supabase/supabase.dart';
import '/backend/sqlite/sqlite_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _navOpen = prefs.getBool('ff_navOpen') ?? _navOpen;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_aa')) {
        try {
          final serializedData = prefs.getString('ff_aa') ?? '{}';
          _aa = AaStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _Categories = prefs.getStringList('ff_Categories') ?? _Categories;
    });
    _safeInit(() {
      _Items = prefs
              .getStringList('ff_Items')
              ?.map((x) {
                try {
                  return ItemsStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _Items;
    });
    _safeInit(() {
      _t1 = prefs
              .getStringList('ff_t1')
              ?.map((x) {
                try {
                  return ItemsStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _t1;
    });
    _safeInit(() {
      _t2 = prefs
              .getStringList('ff_t2')
              ?.map((x) {
                try {
                  return ItemsStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _t2;
    });
    _safeInit(() {
      _t3 = prefs
              .getStringList('ff_t3')
              ?.map((x) {
                try {
                  return ItemsStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _t3;
    });
    _safeInit(() {
      _uuid = prefs.getString('ff_uuid') ?? _uuid;
    });
    _safeInit(() {
      _date = prefs.getString('ff_date') ?? _date;
    });
    _safeInit(() {
      _text = prefs.getString('ff_text') ?? _text;
    });
    _safeInit(() {
      _itemslist = prefs.getStringList('ff_itemslist') ?? _itemslist;
    });
    _safeInit(() {
      _phone = prefs.getInt('ff_phone') ?? _phone;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_paraisync')) {
        try {
          final serializedData = prefs.getString('ff_paraisync') ?? '{}';
          _paraisync =
              ParaisyncStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _searchdata = prefs.getStringList('ff_searchdata')?.map((x) {
            try {
              return jsonDecode(x);
            } catch (e) {
              print("Can't decode persisted json. Error: $e.");
              return {};
            }
          }).toList() ??
          _searchdata;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _navOpen = false;
  bool get navOpen => _navOpen;
  set navOpen(bool _value) {
    _navOpen = _value;
    prefs.setBool('ff_navOpen', _value);
  }

  AaStruct _aa = AaStruct.fromSerializableMap(jsonDecode('{}'));
  AaStruct get aa => _aa;
  set aa(AaStruct _value) {
    _aa = _value;
    prefs.setString('ff_aa', _value.serialize());
  }

  void updateAaStruct(Function(AaStruct) updateFn) {
    updateFn(_aa);
    prefs.setString('ff_aa', _aa.serialize());
  }

  List<String> _Categories = [];
  List<String> get Categories => _Categories;
  set Categories(List<String> _value) {
    _Categories = _value;
    prefs.setStringList('ff_Categories', _value);
  }

  void addToCategories(String _value) {
    _Categories.add(_value);
    prefs.setStringList('ff_Categories', _Categories);
  }

  void removeFromCategories(String _value) {
    _Categories.remove(_value);
    prefs.setStringList('ff_Categories', _Categories);
  }

  void removeAtIndexFromCategories(int _index) {
    _Categories.removeAt(_index);
    prefs.setStringList('ff_Categories', _Categories);
  }

  void updateCategoriesAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _Categories[_index] = updateFn(_Categories[_index]);
    prefs.setStringList('ff_Categories', _Categories);
  }

  void insertAtIndexInCategories(int _index, String _value) {
    _Categories.insert(_index, _value);
    prefs.setStringList('ff_Categories', _Categories);
  }

  List<ItemsStruct> _Items = [
    ItemsStruct.fromSerializableMap(jsonDecode(
        '{\"GU\":\"Pizza\",\"Item\":\"Mexican Pizza\",\"price\":\"2\",\"type\":\"2\"}')),
    ItemsStruct.fromSerializableMap(jsonDecode(
        '{\"GU\":\"Mexican Pizza\",\"Item\":\"Chicken Mexican Pizza\",\"price\":\"250\",\"type\":\"2\"}')),
    ItemsStruct.fromSerializableMap(jsonDecode(
        '{\"GU\":\"Mexican Pizza\",\"Item\":\"Beef Mexican Pizza\",\"price\":\"280\",\"type\":\"2\"}')),
    ItemsStruct.fromSerializableMap(jsonDecode(
        '{\"GU\":\"Pizza\",\"Item\":\"Italian Pizza\",\"price\":\"1\",\"type\":\"2\"}')),
    ItemsStruct.fromSerializableMap(jsonDecode(
        '{\"GU\":\"Italian Pizza\",\"Item\":\"Corn Italian Pizza\",\"price\":\"260\",\"type\":\"2\"}')),
    ItemsStruct.fromSerializableMap(jsonDecode(
        '{\"GU\":\"Pizza\",\"Item\":\"BBQ Chicken Pizza\",\"price\":\"320\",\"type\":\"1\"}'))
  ];
  List<ItemsStruct> get Items => _Items;
  set Items(List<ItemsStruct> _value) {
    _Items = _value;
    prefs.setStringList('ff_Items', _value.map((x) => x.serialize()).toList());
  }

  void addToItems(ItemsStruct _value) {
    _Items.add(_value);
    prefs.setStringList('ff_Items', _Items.map((x) => x.serialize()).toList());
  }

  void removeFromItems(ItemsStruct _value) {
    _Items.remove(_value);
    prefs.setStringList('ff_Items', _Items.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromItems(int _index) {
    _Items.removeAt(_index);
    prefs.setStringList('ff_Items', _Items.map((x) => x.serialize()).toList());
  }

  void updateItemsAtIndex(
    int _index,
    ItemsStruct Function(ItemsStruct) updateFn,
  ) {
    _Items[_index] = updateFn(_Items[_index]);
    prefs.setStringList('ff_Items', _Items.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInItems(int _index, ItemsStruct _value) {
    _Items.insert(_index, _value);
    prefs.setStringList('ff_Items', _Items.map((x) => x.serialize()).toList());
  }

  List<ItemsStruct> _t1 = [];
  List<ItemsStruct> get t1 => _t1;
  set t1(List<ItemsStruct> _value) {
    _t1 = _value;
    prefs.setStringList('ff_t1', _value.map((x) => x.serialize()).toList());
  }

  void addToT1(ItemsStruct _value) {
    _t1.add(_value);
    prefs.setStringList('ff_t1', _t1.map((x) => x.serialize()).toList());
  }

  void removeFromT1(ItemsStruct _value) {
    _t1.remove(_value);
    prefs.setStringList('ff_t1', _t1.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromT1(int _index) {
    _t1.removeAt(_index);
    prefs.setStringList('ff_t1', _t1.map((x) => x.serialize()).toList());
  }

  void updateT1AtIndex(
    int _index,
    ItemsStruct Function(ItemsStruct) updateFn,
  ) {
    _t1[_index] = updateFn(_t1[_index]);
    prefs.setStringList('ff_t1', _t1.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInT1(int _index, ItemsStruct _value) {
    _t1.insert(_index, _value);
    prefs.setStringList('ff_t1', _t1.map((x) => x.serialize()).toList());
  }

  List<ItemsStruct> _t2 = [];
  List<ItemsStruct> get t2 => _t2;
  set t2(List<ItemsStruct> _value) {
    _t2 = _value;
    prefs.setStringList('ff_t2', _value.map((x) => x.serialize()).toList());
  }

  void addToT2(ItemsStruct _value) {
    _t2.add(_value);
    prefs.setStringList('ff_t2', _t2.map((x) => x.serialize()).toList());
  }

  void removeFromT2(ItemsStruct _value) {
    _t2.remove(_value);
    prefs.setStringList('ff_t2', _t2.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromT2(int _index) {
    _t2.removeAt(_index);
    prefs.setStringList('ff_t2', _t2.map((x) => x.serialize()).toList());
  }

  void updateT2AtIndex(
    int _index,
    ItemsStruct Function(ItemsStruct) updateFn,
  ) {
    _t2[_index] = updateFn(_t2[_index]);
    prefs.setStringList('ff_t2', _t2.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInT2(int _index, ItemsStruct _value) {
    _t2.insert(_index, _value);
    prefs.setStringList('ff_t2', _t2.map((x) => x.serialize()).toList());
  }

  List<ItemsStruct> _t3 = [];
  List<ItemsStruct> get t3 => _t3;
  set t3(List<ItemsStruct> _value) {
    _t3 = _value;
    prefs.setStringList('ff_t3', _value.map((x) => x.serialize()).toList());
  }

  void addToT3(ItemsStruct _value) {
    _t3.add(_value);
    prefs.setStringList('ff_t3', _t3.map((x) => x.serialize()).toList());
  }

  void removeFromT3(ItemsStruct _value) {
    _t3.remove(_value);
    prefs.setStringList('ff_t3', _t3.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromT3(int _index) {
    _t3.removeAt(_index);
    prefs.setStringList('ff_t3', _t3.map((x) => x.serialize()).toList());
  }

  void updateT3AtIndex(
    int _index,
    ItemsStruct Function(ItemsStruct) updateFn,
  ) {
    _t3[_index] = updateFn(_t3[_index]);
    prefs.setStringList('ff_t3', _t3.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInT3(int _index, ItemsStruct _value) {
    _t3.insert(_index, _value);
    prefs.setStringList('ff_t3', _t3.map((x) => x.serialize()).toList());
  }

  String _uuid = '72773b25-0aae-45de-966b-fa6d1b484fec';
  String get uuid => _uuid;
  set uuid(String _value) {
    _uuid = _value;
    prefs.setString('ff_uuid', _value);
  }

  String _date = '';
  String get date => _date;
  set date(String _value) {
    _date = _value;
    prefs.setString('ff_date', _value);
  }

  String _text = 'write';
  String get text => _text;
  set text(String _value) {
    _text = _value;
    prefs.setString('ff_text', _value);
  }

  List<String> _itemslist = [];
  List<String> get itemslist => _itemslist;
  set itemslist(List<String> _value) {
    _itemslist = _value;
    prefs.setStringList('ff_itemslist', _value);
  }

  void addToItemslist(String _value) {
    _itemslist.add(_value);
    prefs.setStringList('ff_itemslist', _itemslist);
  }

  void removeFromItemslist(String _value) {
    _itemslist.remove(_value);
    prefs.setStringList('ff_itemslist', _itemslist);
  }

  void removeAtIndexFromItemslist(int _index) {
    _itemslist.removeAt(_index);
    prefs.setStringList('ff_itemslist', _itemslist);
  }

  void updateItemslistAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _itemslist[_index] = updateFn(_itemslist[_index]);
    prefs.setStringList('ff_itemslist', _itemslist);
  }

  void insertAtIndexInItemslist(int _index, String _value) {
    _itemslist.insert(_index, _value);
    prefs.setStringList('ff_itemslist', _itemslist);
  }

  int _phone = 0;
  int get phone => _phone;
  set phone(int _value) {
    _phone = _value;
    prefs.setInt('ff_phone', _value);
  }

  ParaisyncStruct _paraisync = ParaisyncStruct();
  ParaisyncStruct get paraisync => _paraisync;
  set paraisync(ParaisyncStruct _value) {
    _paraisync = _value;
    prefs.setString('ff_paraisync', _value.serialize());
  }

  void updateParaisyncStruct(Function(ParaisyncStruct) updateFn) {
    updateFn(_paraisync);
    prefs.setString('ff_paraisync', _paraisync.serialize());
  }

  List<dynamic> _searchdata = [];
  List<dynamic> get searchdata => _searchdata;
  set searchdata(List<dynamic> _value) {
    _searchdata = _value;
    prefs.setStringList(
        'ff_searchdata', _value.map((x) => jsonEncode(x)).toList());
  }

  void addToSearchdata(dynamic _value) {
    _searchdata.add(_value);
    prefs.setStringList(
        'ff_searchdata', _searchdata.map((x) => jsonEncode(x)).toList());
  }

  void removeFromSearchdata(dynamic _value) {
    _searchdata.remove(_value);
    prefs.setStringList(
        'ff_searchdata', _searchdata.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromSearchdata(int _index) {
    _searchdata.removeAt(_index);
    prefs.setStringList(
        'ff_searchdata', _searchdata.map((x) => jsonEncode(x)).toList());
  }

  void updateSearchdataAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _searchdata[_index] = updateFn(_searchdata[_index]);
    prefs.setStringList(
        'ff_searchdata', _searchdata.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInSearchdata(int _index, dynamic _value) {
    _searchdata.insert(_index, _value);
    prefs.setStringList(
        'ff_searchdata', _searchdata.map((x) => jsonEncode(x)).toList());
  }

  bool _connected = false;
  bool get connected => _connected;
  set connected(bool _value) {
    _connected = _value;
  }

  final _categoryManager = FutureRequestManager<List<PCategoryRow>>();
  Future<List<PCategoryRow>> category({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<PCategoryRow>> Function() requestFn,
  }) =>
      _categoryManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCategoryCache() => _categoryManager.clear();
  void clearCategoryCacheKey(String? uniqueKey) =>
      _categoryManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
