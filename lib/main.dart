import "package:flutter/material.dart";
import "screens/home_page.dart";
import "screens/login_page.dart";

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/login_page',
    routes: {
      '/': (context) {
        return HomePage();
      },
      '/login_page': (context) {
        return LoginPage();
      },
    },
  ));
}

class RoomFinder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
