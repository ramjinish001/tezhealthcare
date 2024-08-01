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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            const CustomBackScreenIcon(),
            const SizedBox(width: 20),
            Text(
              title,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: Colors.white),
            ),
            if (icon != null)
              const Spacer(), // This will push the icon to the right end

            if (icon != null) // Check if an icon is provided
              Container(
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Primary),
                child: IconButton(
                  icon: Icon(icon, color: Colors.white),
                  onPressed: onIconPressed,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
