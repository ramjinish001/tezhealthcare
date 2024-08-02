import 'package:flutter/material.dart';
import 'package:tezhealthcare/Constant/Color.dart';
import 'package:tezhealthcare/Globle_Widget/CustomBackScreenIcon.dart';

class CustomHeaderWithBackButtonAndTitle extends StatelessWidget {
  final String title;
  final IconData? icon;
  final VoidCallback? onIconPressed;

  const CustomHeaderWithBackButtonAndTitle({
    super.key,
    required this.title,
    this.icon,
    this.onIconPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Primary,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          CustomBackScreenIcon(), // Assuming CustomBackScreenIcon is defined elsewhere
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              overflow: TextOverflow.ellipsis, // Ensures text doesn't overflow
            ),
          ),
          if (icon != null) // Only display if icon is provided
            IconButton(
              icon: Icon(icon, color: Colors.white),
              onPressed: onIconPressed,
              splashColor: Colors.transparent, // Removes splash color
              highlightColor: Colors.transparent, // Removes highlight color
              padding: EdgeInsets.zero, // Removes padding around the icon
              constraints: BoxConstraints(), // Removes default constraints
            ),
        ],
      ),
    );
  }
}
