import "package:flutter/material.dart";

class RoomFilter extends StatefulWidget {
  @override
  _RoomFilterState createState() => _RoomFilterState();
}

class _RoomFilterState extends State<RoomFilter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xffcccccc),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  Icons.edit_location,
                  color: Color(0xff555555),
                ),
                Text(
                  "   Choose address",
                  style: TextStyle(
                    color: Color(0xff555555),
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: Color(0xff555555),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  Icons.sort,
                  color: Color(0xff555555),
                ),
                Text(
                  "   Sort",
                  style: TextStyle(
                    color: Color(0xff555555),
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: Color(0xff555555),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
