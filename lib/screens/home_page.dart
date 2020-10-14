import "package:flutter/material.dart";
import "../components/room_filter.dart";
import '../components/build_room.dart';
import "../classes/room.dart";

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            RoomFilter(),
            Rooms(
              rooms: [
                Room(
                  name: "Appartment at Lamachaur",
                  price: 1699,
                  bhk: 3,
                  type: "Appartment",
                ),
                Room(
                  name: "Rental Room, Hemja",
                  price: 1999,
                  bhk: 1,
                  image: Image.asset("assets/images/room_3.webp"),
                ),
                Room(
                  name: "Flat for sale",
                  price: 9999,
                  bhk: 6,
                  type: "Flat",
                  image: Image.asset("assets/images/room_2.jpg"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
