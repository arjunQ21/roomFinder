import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:room_finder/classes/filter.dart';
import 'package:room_finder/classes/roomsLoader.dart';
import 'package:room_finder/components/locationButtion.dart';
import '../components/build_room.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showingFilterControls = true;
  Filter filter = Filter();
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
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
          child: SmartRefresher(
            controller: _refreshController,
            enablePullDown: true,
            onRefresh: () async {
              await RoomsLoader.instance.getAll(force: true);
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text("Loaded fresh data.")));
              setState(() {
                filter = Filter();
                _showingFilterControls = true;
              });
              _refreshController.refreshCompleted();
            },
            child: ListView(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color(0xffcccccc),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              filter = Filter();
                              _showingFilterControls = true;
                            });
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            child: Image.asset("assets/images/logo.png"),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            height: 40,
                            child: TextField(
                              onChanged: (String value) {
                                setState(() {
                                  filter.keyword = value;
                                });
                              },
                              decoration: InputDecoration(
                                hintText:
                                    "Enter locations, features, owner name, ...",
                                contentPadding: EdgeInsets.all(7),
                                focusColor: Colors.green,
                                fillColor: Colors.red,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(),
                                ),
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                _showingFilterControls =
                                    !_showingFilterControls;
                                filter = Filter();
                              });
                            },
                            icon: Icon(Icons.filter_alt_outlined)),
                      ],
                    ),
                  ),
                ),
                Consumer<RoomsLoader>(
                  builder: (context, roomsLoader, child) {
                    var matchingRooms = roomsLoader.all
                        .where((room) => room.matches(filter))
                        .toList();
                    return Column(children: [
                      if (_showingFilterControls)
                        Container(
                          color: Colors.purple[700].withOpacity(0.4),
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Adjust Filters",
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              Row(
                                children: [
                                  Text("Min Price:"),
                                  Expanded(
                                      child: TextFormField(
                                    initialValue:
                                        (filter.minPrice ?? "").toString(),
                                    keyboardType: TextInputType.number,
                                    onChanged: (v) {
                                      if (v == null) {
                                        setState(() {
                                          filter.minPrice = null;
                                        });
                                      } else
                                        setState(() {
                                          filter.minPrice =
                                              int.parse(v.toString().trim());
                                        });
                                    },
                                  )),
                                  Text("Max Price:"),
                                  Expanded(
                                      child: TextFormField(
                                    initialValue:
                                        (filter.maxPrice ?? "").toString(),
                                    keyboardType: TextInputType.number,
                                    onChanged: (v) {
                                      if (v == null)
                                        setState(() {
                                          filter.maxPrice = null;
                                        });
                                      else
                                        setState(() {
                                          filter.maxPrice =
                                              int.parse(v.toString().trim());
                                        });
                                    },
                                  )),
                                ],
                              ),
                              SizedBox(height: 10),
                              LocationButtons(
                                locationTexts: roomsLoader.getLocations(),
                                onToggle: (newLocations) {
                                  setState(() {
                                    filter.locations = newLocations;
                                  });
                                },
                                selectedTexts: filter.locations,
                              ),
                            ],
                          ),
                        ),
                      if (filter.isNotEmpty)
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 15, left: 15),
                              child:
                                  Text("${matchingRooms.length} Results Found"),
                            ),
                          ],
                        ),
                      Rooms(
                        rooms: matchingRooms,
                      ),
                    ]);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
