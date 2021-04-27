import "package:flutter/material.dart";
import 'package:room_finder/screens/room_details.dart';
import "screens/home_page.dart";
import "screens/login_page.dart";

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    // initialRoute: '/room_details',
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
