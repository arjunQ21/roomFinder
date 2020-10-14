import "package:flutter/material.dart";

class Room {
  String name;
  int bhk;
  String description;
  Image image;
  double price;
  String type;

  Room(
      {String name,
      int bhk,
      String description,
      Image image,
      double price,
      String type}) {
    this.name = name ?? 'Room Name';
    this.bhk = bhk ?? 1;
    this.description = description ?? 'Room Description';
    this.image = image ?? Image.asset('assets/images/room_1.jpg');
    this.price = price ?? 500.0;
    this.type = type ?? "Room";
  }
}
