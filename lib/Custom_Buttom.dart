import 'package:flutter/material.dart';

class Custom_Button extends StatelessWidget {
  String text;
  Function onButtonClick;
  int index;
  Custom_Button(
      {required this.index, required this.text, required this.onButtonClick});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
          onPressed: () {
            onButtonClick(index);
          },
          child: Text(
            text,
            style: TextStyle(
                fontSize: 36, fontWeight: FontWeight.w500, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
