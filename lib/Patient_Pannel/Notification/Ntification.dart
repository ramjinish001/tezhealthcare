import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tezhealthcare/Constant/Color.dart';
import 'package:tezhealthcare/Globle_Widget/CustomHeaderWithBackButtonAndTitle.dart';
import 'package:intl/intl.dart';

class Notification_Page extends StatefulWidget {
  const Notification_Page({super.key});
  @override
  State<Notification_Page> createState() => _Notification_PageState();
}

class _Notification_PageState extends State<Notification_Page> {
  final List<Map<String, dynamic>> notifications = [
    {
      'title': 'New Message from Doctor',
      'subtitle': 'You have a new message regarding your appointment.',
      'description': 'Please check your inbox for the detailed message.',
      'date': DateTime.now().subtract(const Duration(minutes: 5)),
      'icon': Icons.message,
    },
    {
      'title': 'Appointment Reminder',
      'subtitle': 'Your appointment is scheduled for tomorrow at 10:00 AM.',
      'description':
          'Make sure to arrive 10 minutes early to complete the registration.',
      'date': DateTime.now().subtract(const Duration(hours: 1)),
      'icon': Icons.calendar_today,
    },
    {
      'title': 'Health Tips',
      'subtitle': 'Check out our latest health tips to stay healthy.',
      'description':
          'Explore the best practices to maintain your health and wellness.',
      'date': DateTime.now().subtract(const Duration(hours: 3)),
      'icon': Icons.health_and_safety,
    },
  ];

  String formatDate(DateTime date) {
    return DateFormat('MMM dd, yyyy • hh:mm a').format(date);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Primary,
      systemNavigationBarColor: Colors.transparent,
    ));
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CustomHeaderWithBackButtonAndTitle(title: 'Notifications'),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  final notification = notifications[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12.0),
                    elevation: 3.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(16.0),
                      onTap: () {
                        // Handle notification tap
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 24.0,
                              backgroundColor: Primary.withOpacity(0.5),
                              child: Icon(
                                notification['icon'],
                                color: Primary,
                                size: 28.0,
                              ),
                            ),
                            const SizedBox(width: 16.0),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    notification['title'],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  const SizedBox(height: 8.0),
                                  Text(
                                    notification['subtitle'],
                                    style: const TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  const SizedBox(height: 8.0),
                                  Text(
                                    notification['description'],
                                    style: const TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  const SizedBox(height: 12.0),
                                  Text(
                                    formatDate(notification['date']),
                                    style: TextStyle(
                                      fontSize: 11.0,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
