import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditTextUtils extends StatelessWidget {

  final String hintText;
  // final String labelText;

  EditTextUtils({required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(5.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(5.5),
        ),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.black12),
        filled: true,
        fillColor: Colors.blue[50],
      ),
    );
  }
  Widget roundedRectBorderWidget() {
    return SizedBox(
      height: 45,
      child: DottedBorder(
        borderType: BorderType.RRect,
        color: Colors.grey.shade600,
        strokeWidth: 2,
        radius: Radius.circular(5),
        padding: EdgeInsets.all(0),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          child: Container(
            color: Colors.blue.shade50,
            child: Center(
              child: Text(
                "click to browse",
                style: TextStyle(fontSize: 15, color: Colors.grey.shade700),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
