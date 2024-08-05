import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoDataFound extends StatelessWidget {
  final String message;
  final String svgAssetPath;
  final double svgSize;
  final TextStyle? messageStyle;

  const NoDataFound({
    Key? key,
    this.message = "No data found",
    this.svgAssetPath = "assets/images/no_data.svg",
    this.svgSize = 120.0,
    this.messageStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            svgAssetPath,
            height: svgSize,
            width: svgSize,
            color: Colors.blueAccent.withOpacity(0.7), // Optional color overlay
          ),
          SizedBox(height: 24),
          Text(
            message,
            style: messageStyle ??
                TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.blueGrey[700],
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
