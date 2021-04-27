import "package:flutter/material.dart";
import 'package:room_finder/classes/room.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class RoomDetailsPage extends StatefulWidget {
  @override
  _RoomDetailsPageState createState() => _RoomDetailsPageState();
}

class _RoomDetailsPageState extends State<RoomDetailsPage> {
  Room _room;

  @override
  Widget build(BuildContext context) {
    _room = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Room Details",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xff222222),
          ),
        ),
        backgroundColor: Color(0xffffffff),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Color(0xff222222),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          Text(""),
        ],
      ),
      body: SafeArea(
        child: Container(
          // padding: EdgeInsets.symmetric(horizontal: 10),
          child: ListView(
            children: [
              Container(
                height: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: _room.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                // color: Colors.black.withOpacity(0.03),
                child: Column(
                  children: [
                    Text(
                      _room.name,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    SizedBox(height: 15),
                    _showRow('Location', _room.location),
                    _showRow('Rooms', _room.roomsCount.toString()),
                    _showRow('Price', "NRs. " + _room.price.toStringAsFixed(0)),
                    _showRow('BHK', _room.bhk.toString()),
                    SizedBox(height: 15),
                    Text(
                      _room.description,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Color(0xff888888),
                      ),
                    ),
                    SizedBox(height: 15),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Owner Information",
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                    _showRow("Name", "Shyam Lal"),
                    _showRow("Address", "Lamachaur"),
                    _showRow("Phone", "9866008814"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 60,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: RaisedButton(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(100))),
                  onPressed: () {
                    UrlLauncher.launch("tel:9866008814");
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.phone,
                        color: Colors.white,
                        size: 23,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Talk to Owner',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        // ),
      ),
    );
  }

  Widget _showRow(String key, String value) {
    return Container(
      padding: EdgeInsets.all(5),
      color: Colors.black.withOpacity(0.01),
      // color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            key,
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: Color(0xff666666),
              fontSize: 15,
            ),
          )
        ],
      ),
    );
  }
}
//     );
//   }
// }
