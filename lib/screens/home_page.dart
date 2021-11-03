import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:room_finder/classes/roomsLoader.dart';
import "../components/room_filter.dart";
import '../components/build_room.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      print("hi\n Done building...");
      await RoomsLoader.instance.getAll();
      print("Loaded data from server");
      print(RoomsLoader.instance.all);
    });
    return ChangeNotifierProvider(
      create: (context) => RoomsLoader.instance,
      child: Scaffold(
        body: SafeArea(
          child: ListView(
            children: [
              // RoomFilter(),
              Consumer<RoomsLoader>(
                builder: (context, roomsLoader, child) {
                  // roomsLoader.getAll();
                  // return roomsLoader.all.length > 0
                  //     ? Rooms(
                  //         rooms: roomsLoader.all,
                  //       )
                  //     : Center(
                  //         child: Text("Loading Rooms..."),
                  //       );
                  return Rooms(
                    rooms: roomsLoader.all,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
