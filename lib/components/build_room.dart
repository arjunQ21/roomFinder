import "package:flutter/material.dart";
import '../classes/room.dart';

class BuildRoom extends StatefulWidget {
  final Room room;
  BuildRoom({Key key, @required this.room}) : super(key: key);
  @override
  _BuildRoomState createState() => _BuildRoomState();
}

class _BuildRoomState extends State<BuildRoom> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/room_details', arguments: widget.room);
      },
      child: Container(
        // constraints: BoxConstraints(maxWidth: 100),
        clipBehavior: Clip.hardEdge,
        width: double.infinity,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Color(0x44000000), blurRadius: 4),
          ],
        ),
        child: Column(
          children: [
            Container(
              height: 180,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: widget.room.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text(
                            widget.room.name,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xff777777),
                            ),
                          ),
                        ),
                        // ),
                        Text("Price"),
                        Text(
                          "NRs. " + widget.room.price.toStringAsFixed(0),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color(0xff777777),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        widget.room.bhk.toString() + " BHK",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Color(0xff999999),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(widget.room.type),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        // ),
      ),
    );
  }
}

class Rooms extends StatefulWidget {
  final List<Room> rooms;
  Rooms({@required this.rooms, Key key}) : super(key: key);
  @override
  _RoomsState createState() => _RoomsState();
}

class _RoomsState extends State<Rooms> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.rooms.map((e) => BuildRoom(room: e)).toList(),
    );
  }
}
