import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tezhealthcare/Constant/Color.dart';
import 'package:tezhealthcare/Globle_Widget/CustomHeaderWithBackButtonAndTitle.dart';
import 'package:tezhealthcare/Patient_Pannel/Patient_Profile/About_Us.dart';

class PatientProfile extends StatefulWidget {
  const PatientProfile({super.key});
  @override
  State<PatientProfile> createState() => _PatientProfileState();
}

class _PatientProfileState extends State<PatientProfile> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Primary, // Use actual Primary color
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
                  color: Primary, // Use actual Primary color
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
                    CircleAvatar(
                      radius: 27.0,
                      backgroundImage: NetworkImage(
                        "https://freelance.ca/upload/images/profiles/vbpr5heauddf.jpeg",
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            _showPatientInfoDialog(context);
                          },
                          child: _buildListTile(Icons.person, 'My Information'),
                        ),
                        InkWell(
                          onTap: () {
                            _showPatientInfoDialog(context);
                          },
                          child:
                              _buildListTile(Icons.schedule, 'My Appointment'),
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AboutUs()),
                              );
                            },
                            child: _buildListTile(Icons.info, 'About Us')),
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
        margin: const EdgeInsets.symmetric(vertical: 0.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
          leading: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: Primary, size: 25.0),
              const SizedBox(width: 5.0),
              Container(
                height: 20.0,
                width: 2.0,
                color: Secondary,
              ),
              const SizedBox(width: 2.0),
            ],
          ),
          title: Text(
            title,
            style: TextStyle(
              color: textColor,
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          trailing: Icon(Icons.arrow_forward_ios,
              size: 16.0, color: Colors.grey.shade600),
        ),
      ),
    );
  }

  void _showPatientInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Patient Information',
              style: TextStyle(fontWeight: FontWeight.bold)),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildPatientInfoRow('Name', 'Ramjinish Kushwaha '),
                _buildPatientInfoRow('Patient ID', '123456'),
                _buildPatientInfoRow('Age', '25 Year'),
                _buildPatientInfoRow('Gender', 'Male'),
                _buildPatientInfoRow('Address', 'Koteshwor'),
                _buildPatientInfoRow('Phone', '+9779821880761'),
                // Add more information as needed
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Close', style: TextStyle(color: Primary)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildPatientInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            '$label:',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
          ),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: const TextStyle(fontSize: 16.0),
            ),
          ),
        ],
      ),
    );
  }
}
