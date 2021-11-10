import "package:flutter/material.dart";

import 'filter.dart';

class Room {
  static String apiEndpoint = 'http://localhost';

  String name;
  int bhk;
  String description;
  ImageProvider image;
  double price;
  String type;
  String address;
  int roomsCount;
  int id;
  String ownerName;
  String ownerContact;
  String ownerAddress;
  Room(
      {String name,
      int bhk,
      String description,
      ImageProvider image,
      double price,
      String type,
      int id,
      String address,
      this.ownerName,
      this.ownerContact,
      this.ownerAddress,
      int roomsCount}) {
    this.name = name ?? 'Room Name';
    this.bhk = bhk ?? 1;
    this.description = description ?? '';
    this.image = image ?? AssetImage('assets/images/room_1.jpg');
    this.price = price ?? 500.0;
    this.type = type ?? "Room";
    this.address = address ?? "Pokhara";
    this.roomsCount = roomsCount ?? 1;
  }

  bool matches(Filter filter) {
    bool noFiltersYet = true;
    bool matches = false;

    if (filter.keyword != null && filter.keyword.length > 0) {
      final keyword = filter.keyword.toLowerCase().trim();
      final matchingFields = [
        name,
        description,
        address,
        ownerName,
        ownerAddress
      ];

      matchingFields.forEach((element) {
        if (element.toLowerCase().contains(keyword)) matches = true;
      });
      noFiltersYet = false;
    } else if (noFiltersYet) matches = true;
    if (filter.minPrice != null && filter.minPrice > 0) {
      matches = this.price >= filter.minPrice;
      noFiltersYet = false;
    } else if (noFiltersYet) matches = true;
    if (filter.maxPrice != null) {
      matches = matches && this.price <= filter.maxPrice;
      noFiltersYet = false;
    } else if (noFiltersYet) matches = true;
    if (filter.locations != null && filter.locations.length > 0) {
      matches = filter.locations.contains(address.toLowerCase());
      noFiltersYet = false;
    } else if (noFiltersYet) matches = true;
    return matches;
  }

  Room.fromJson(Map<String, dynamic> rawRoom) {
    if (!rawRoom.containsKey('id'))
      throw Exception("Id not found in raw payload.");
    id = int.parse(rawRoom['id']);
    name = rawRoom['name'] ?? "Room name";
    bhk = int.parse(rawRoom['bhk'] ?? '0');
    address = rawRoom['address'] ?? null;

    description = rawRoom['description'] ?? '';
    image = rawRoom.containsKey('image')
        ? NetworkImage(rawRoom['image'])
        : AssetImage("assets/images/room_2.jpg");
    price = double.parse(rawRoom['price'] ?? '0.0');
    ownerAddress = rawRoom['ownerAddress'] ?? 'Unknown';
    ownerName = rawRoom['ownerName'] ?? 'Unknown';
    ownerContact = rawRoom['ownerContact'];
    roomsCount = int.parse(rawRoom['roomsCount'] ?? '1');
  }
}
