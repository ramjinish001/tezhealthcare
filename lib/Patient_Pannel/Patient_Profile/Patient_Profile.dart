import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tezhealthcare/Constant/Color.dart';
import 'package:tezhealthcare/Globle_Widget/CustomHeaderWithBackButtonAndTitle.dart';

class Patient_Profile extends StatefulWidget {
  const Patient_Profile({super.key});

  @override
  State<Patient_Profile> createState() => _PatientProfileState();
}

class _PatientProfileState extends State<Patient_Profile> {
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
                  title: 'Available Doctor'),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Primary,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(30.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: Offset(0, 6),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 50.0,
                      backgroundImage: NetworkImage(
                        "https://freelance.ca/upload/images/profiles/vbpr5heauddf.jpeg",
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'John Doe',
                          style: TextStyle(
                            fontSize: 26.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        const Text(
                          'Patient ID: 123456',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListTile(IconData icon, String title,
      {Color textColor = Colors.black}) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: ListTile(
        leading: Icon(icon, color: Colors.teal),
        title: Text(title, style: TextStyle(color: textColor, fontSize: 16.0)),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        tileColor: Colors.white,
        trailing: Icon(Icons.arrow_forward_ios, size: 16.0, color: Colors.grey),
        onTap: () {
          // Handle tap
        },
      ),
    );
  }
}
