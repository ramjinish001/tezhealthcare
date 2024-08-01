import 'package:flutter/material.dart';
import 'package:tezhealthcare/Constant/Color.dart';

class CustomBackScreenIcon extends StatelessWidget {
  const CustomBackScreenIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border(
            top: BorderSide(color: Secondary, width: 3),
            right: BorderSide(color: Secondary, width: 3),
            bottom: BorderSide(color: Secondary, width: 3),
            left: BorderSide(color: Secondary, width: 3),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Container(
            width: 30.7,
            height: 28.98,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Icon(
              Icons.arrow_back,
              color: Primary,
            ),
          ),
        ),
      ),
    );
  }
}
