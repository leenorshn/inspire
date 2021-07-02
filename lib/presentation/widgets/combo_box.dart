import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ComboBox extends StatefulWidget {
  const ComboBox(
      {Key? key,
      required this.items,
      required this.label,
      required this.onChange})
      : super(key: key);
  final List<String> items;
  final String label;
  final Function(String?) onChange;

  @override
  _ComboBoxState createState() => _ComboBoxState();
}

class _ComboBoxState extends State<ComboBox> {
  String dropdownValue = "";
  @override
  Widget build(BuildContext context) {
    dropdownValue = widget.items[0];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            "${widget.label}",
            style: TextStyle(color: Colors.white),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 8),
          padding: EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 16,
          ),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.grey,
              )),
          child: DropdownButton<String>(
            value: widget.items[0],
            icon: const Icon(CupertinoIcons.arrowtriangle_down_circle),
            iconSize: 24,
            elevation: 16,
            isExpanded: true,
            style: const TextStyle(color: Colors.blueGrey),
            underline: Container(
              height: 2,
              color: Colors.white,
            ),
            onChanged: widget.onChange,
            items: widget.items.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
