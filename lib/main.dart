import "package:flutter/material.dart";
import 'package:room_finder/classes/room.dart';
import 'package:room_finder/screens/room_details.dart';
import "screens/home_page.dart";
import "screens/login_page.dart";

void main() {
  Room.apiEndpoint = 'http://192.168.98.3:8080/api/allRooms.php';
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) {
        return HomePage();
      },
      '/login_page': (context) {
        return LoginPage();
      },
      '/room_details': (context) {
        return RoomDetailsPage();
      }
    },
  ));
}
