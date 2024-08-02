import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tezhealthcare/Constant/Color.dart';
import 'package:tezhealthcare/Globle_Widget/CustomHeaderWithBackButtonAndTitle.dart';

class PatientProfile extends StatefulWidget {
  const PatientProfile({super.key});
  @override
  State<PatientProfile> createState() => _PatientProfileState();
}

class _PatientProfileState extends State<PatientProfile> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Primary,
      systemNavigationBarColor: Colors.transparent,
    ));
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomHeaderWithBackButtonAndTitle(
                title: 'Patient Profile',
              ),
              Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Primary,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(20.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(
                          color: Secondary, // Border color
                          width: 3, // Border width
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 6,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        radius: 27.0,
                        backgroundImage: NetworkImage(
                          "https://freelance.ca/upload/images/profiles/vbpr5heauddf.jpeg",
                        ),
                      ),
                    ),
                    const SizedBox(width: 12.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Ramjinish Kushwaha',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 2.0),
                        const Text(
                          'Patient ID: 123456',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 2.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        _buildListTile(Icons.person, 'My Information'),
                        _buildListTile(Icons.info, 'About Us'),
                        _buildListTile(Icons.update, 'Check for Updates'),
                        _buildListTile(Icons.star, 'Rate Us'),
                        _buildListTile(Icons.gavel, 'Terms and Conditions'),
                        _buildListTile(Icons.settings, 'Settings'),
                        _buildListTile(Icons.help, 'Help Center'),
                        _buildListTile(Icons.logout, 'Logout',
                            textColor: Colors.red),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListTile(IconData icon, String title,
      {Color textColor = Colors.black}) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        margin: const EdgeInsets.symmetric(
            vertical: 0.0), // Reduced vertical margin
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0), // Slightly rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(
              vertical: 0.0, horizontal: 8.0), // Compact padding
          leading: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: Primary, size: 25.0), // Compact icon size
              const SizedBox(
                  width: 5.0), // Reduced spacing between icon and line
              Container(
                height: 20.0, // Compact height of the line
                width: 2.0, // Width of the line
                color: Secondary, // Accent line color
              ),
              const SizedBox(
                  width: 2.0), // Reduced spacing between line and text
            ],
          ),
          title: Text(
            title,
            style: TextStyle(
              color: textColor,
              fontSize: 14.0, // Compact font size
              fontWeight: FontWeight.w400, // Regular font weight
            ),
          ),
          trailing: Icon(Icons.arrow_forward_ios,
              size: 16.0, color: Colors.grey.shade600), // Compact trailing icon
          onTap: () {
            // Handle tap
          },
          splashColor: Colors.grey.withOpacity(0.1), // Subtle splash effect
        ),
      ),
    );
  }
}
