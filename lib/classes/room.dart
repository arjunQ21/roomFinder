import "package:flutter/material.dart";

class Room {
  String name;
  int bhk;
  String description;
  ImageProvider image;
  double price;
  String type;
  String location;
  int roomsCount;

  Room(
      {String name,
      int bhk,
      String description,
      ImageProvider image,
      double price,
      String type,
      String location,
      int roomsCount}) {
    this.name = name ?? 'Room Name';
    this.bhk = bhk ?? 1;
    this.description = description ?? '';
    this.image = image ?? AssetImage('assets/images/room_1.jpg');
    this.price = price ?? 500.0;
    this.type = type ?? "Room";
    this.location = location ?? "Pokhara";
    this.roomsCount = roomsCount ?? 1;
  }
}
