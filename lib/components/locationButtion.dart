import 'package:flutter/material.dart';

class LocationButtons extends StatefulWidget {
  final List<String> locationTexts;
  final List<String> selectedTexts;
  final Function(List<String>) onToggle;
  const LocationButtons(
      {@required this.locationTexts,
      @required this.onToggle,
      @required this.selectedTexts});

  @override
  _LocationButtonState createState() => _LocationButtonState();
}

class _LocationButtonState extends State<LocationButtons> {
  List<String> _selectedTexts;

  @override
  void initState() {
    _selectedTexts = widget.selectedTexts ?? [];
    super.initState();
  }

  bool isSelected(String text) => _selectedTexts.contains(text);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (var text in widget.locationTexts)
            GestureDetector(
              onTap: () {
                if (isSelected(text))
                  _selectedTexts.remove(text);
                else
                  _selectedTexts.add(text);
                widget.onToggle(_selectedTexts);
              },
              child: Container(
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: isSelected(text)
                      ? Colors.green.withOpacity(0.6)
                      : Colors.orange[100].withOpacity(0.7),
                ),
                child: Text(text),
              ),
            ),
        ],
      ),
    );
  }
}
