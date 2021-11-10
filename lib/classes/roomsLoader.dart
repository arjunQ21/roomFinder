import 'dart:convert';
import 'package:flutter/material.dart';
import './room.dart';
import 'package:http/http.dart' as http;

class RoomsLoader with ChangeNotifier {
  static RoomsLoader _instance;

  static RoomsLoader get instance {
    if (_instance == null) _instance = RoomsLoader();
    return _instance;
  }

  bool _loaded = false;
  List<Room> _all = [];

  List<Room> get all => _all;

  List<String> getLocations() {
    return _all.map((e) => e.address.toLowerCase()).toList().toSet().toList();
  }

  Future<void> getAll({bool force = false}) async {
    if (force) _loaded = false;
    if (!_loaded) {
      try {
        var resp = await http.get(Uri.parse(Room.apiEndpoint));
        if (resp.statusCode != 200) {
          throw Exception(
              "Error Getting data from remote server at: " + Room.apiEndpoint);
        } else {
          var data = jsonDecode(resp.body);
          if (!data.containsKey('data'))
            throw Exception('data not found in response.');
          _all = [];
          for (var rawRoom in data['data']['rooms']) {
            _all.add(Room.fromJson(rawRoom));
          }
        }
      } catch (e) {
        print(e);
      }
      _loaded = true;
    }
    notifyListeners();
  }

  Room byId(int id) {
    var room = _all.where((element) => element.id == id).toList();
    if (room.length == 1) {
      return room[0];
    } else {
      throw Exception("Room not found");
    }
  }
}
