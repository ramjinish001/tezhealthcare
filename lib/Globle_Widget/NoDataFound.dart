import 'package:flutter/material.dart';
import 'package:tezhealthcare/Constant/Color.dart';

class NoDataFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.sentiment_dissatisfied,
                        size: 60.0,
                        color: Primary,
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'Oops!',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Secondary,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'No data found',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Primary
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'Sorry, there are no data available.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color:Primary),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
