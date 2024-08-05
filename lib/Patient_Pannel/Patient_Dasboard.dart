import 'package:flutter/material.dart';
import 'package:tezhealthcare/Constant/Color.dart';
import 'package:tezhealthcare/Constant/Mediaquery.dart';
import 'package:tezhealthcare/Globle_Widget/BottomNavigationBar.dart';
import 'package:tezhealthcare/Patient_Pannel/All_Doctor_list/All_Doctor_List.dart';
import 'package:tezhealthcare/Patient_Pannel/My_Appointment/My_Appointment.dart';
import 'package:tezhealthcare/Patient_Pannel/Notification/Ntification.dart';
import 'package:tezhealthcare/Patient_Pannel/Patient_Profile/About_Us.dart';
import 'package:tezhealthcare/Patient_Pannel/Search_Page/Search_Page.dart';
import 'package:tezhealthcare/Patient_Pannel/Service&Modualelist/All_Servicemoduale.dart';

class PatientDashboard extends StatefulWidget {
  const PatientDashboard({super.key});

  @override
  State<PatientDashboard> createState() => _PatientDashboardState();
}

class _PatientDashboardState extends State<PatientDashboard> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Handle navigation logic here
  }

  // Generic navigation method
  void _navigateTo(Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  final List<Map<String, String>> _services = [
    {"icon": "assets/Service_icon/blood-bank.png", "label": "HEPATOLOGY"},
    {"icon": "assets/Service_icon/blood-bank.png", "label": "GYNAECOLOGY"},
    {"icon": "assets/Service_icon/blood-bank.png", "label": "DERMATOLOGY"},
    {"icon": "assets/Service_icon/blood-bank.png", "label": "CARDIOLOGY"},
    {"icon": "assets/Service_icon/blood-bank.png", "label": "HEPATOLOGY"},
    {"icon": "assets/Service_icon/blood-bank.png", "label": "ENDOCRINOLOGY"},
    {"icon": "assets/Service_icon/blood-bank.png", "label": "DENTAL"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height / 5 + 10,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Primary.withOpacity(0.9), Primary],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: Offset(0, 4), // changes position of shadow
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Positioned(
                    bottom: -50,
                    left: -50,
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.10),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -0,
                    left: -50,
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.10),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 40,
                    left: 10,
                    right: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Logo section with network image in a circle and white background
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AboutUs()),
                            );
                          },
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Secondary,
                                  width: 2,
                                ),
                                shape: BoxShape.circle,
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    spreadRadius: 1,
                                    blurRadius: 4,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: ClipOval(
                                child: Padding(
                                  padding: const EdgeInsets.all(7.0),
                                  child: Image.network(
                                    'https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/Emblem_of_Nepal.svg/1200px-Emblem_of_Nepal.svg.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        // Text section
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 4),
                              Text(
                                'Provincial Hospital Kathmandu',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        // Icon section
                        SizedBox(
                          width: 50,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Secondary,
                                width: 1,
                              ),
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: IconButton(
                              icon: Icon(
                                Icons.notifications,
                                color: Primary,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Notification_Page()),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Search container inside the background container
                  Positioned(
                    top: height / 5 - 40,
                    left: 20,
                    right: 20,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Search_Page()),
                        );
                      },
                      child: Container(
                        height: height / 19,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Secondary,
                            width: 1,
                          ),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 8,
                            ),
                          ],
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(1.0),
                          child: Row(
                            children: [
                              SizedBox(width: 10),
                              Icon(Icons.search, color: Colors.grey, size: 20),
                              SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  "Search...",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Primary.withOpacity(1),
                child: Container(
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: -10,
                        right: -10,
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withOpacity(0.10),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 20,
                        right: -8,
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withOpacity(0.10),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 7.5, 0),
                              child: CircleAvatar(
                                radius: 32,
                                backgroundColor: Secondary, // Red border color
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundImage: NetworkImage(
                                      'https://freelance.ca/upload/images/profiles/vbpr5heauddf.jpeg'), // Replace with actual image URL
                                  backgroundColor:
                                      Colors.white, // Fallback color
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.fromLTRB(0, 18, 0, 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Ramjinish Kushwaha ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Patient Id: 25',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'HIS No: 25',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Colors.white,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 5.1, 0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFFF5C585),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Container(
                              width: 4,
                              height: height / 30,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.fromLTRB(0, 18, 0, 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: _showSettingsOptions,
                                  child: Text(
                                    'Total Dues ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Primary,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.fromLTRB(0, 18, 0, 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Rs. 50000/-',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Primary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10)),
                          padding: EdgeInsets.fromLTRB(11, 7, 5, 7),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 5, 1),
                                child: Text(
                                  'Pay Now',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            ////////////////////// Upcoming Appointment

            // Static GridView
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: height / 4 +
                    90, // Adjust the height to accommodate the title
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(
                        8.0), // Add padding around the content
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 5.1, 0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFF5C585),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Container(
                                  width: 4,
                                  height: height / 30,
                                ),
                              ),
                            ),
                            Text(
                              "Upcoming Appointment", // Title for the services
                              style: TextStyle(
                                color: Primary,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(), // This pushes the button to the right side
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyAppointment()),
                                );
                              },
                              child: Text(
                                "Show All",
                                style: TextStyle(
                                  color:
                                      Secondary, // You can customize the color
                                  fontSize: 15.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                            height: 0.0), // Space between title and GridView
                        Expanded(
                          child: ListView(
                            padding: const EdgeInsets.all(8),
                            scrollDirection:
                                Axis.horizontal, // Enable horizontal scroll
                            children: [
                              _UpcomingAppointmentcard(
                                  assetPath:
                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0PQRbK_KIX8Y8Og8wnxgrIecqx-kprZZ2IA&s',
                                  doctorName: 'Dr.Ramjinish  Kushwaha ',
                                  specialization:
                                      'Cardiology || Anesthesiology',
                                  qualification: 'BSC || BDS || FAGE',
                                  appointmentDate: '2052-25-35',
                                  patientName: 'Ramjinish Kushwaha',
                                  appointmentTime: '10:30 AM',
                                  Genderanddob: 'Male , 2057-01-02',
                                  onTap: () {}),
                              _UpcomingAppointmentcard(
                                  assetPath:
                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0PQRbK_KIX8Y8Og8wnxgrIecqx-kprZZ2IA&s',
                                  doctorName: 'Dr.Ramjinish  Kushwaha ',
                                  specialization:
                                      'Cardiology || Anesthesiology',
                                  qualification: 'BSC || BDS || FAGE',
                                  appointmentDate: '2052-25-35',
                                  patientName: 'Ramjinish Kushwaha',
                                  appointmentTime: '10:30 AM',
                                  Genderanddob: 'Male , 2057-01-02',
                                  onTap: () {}),
                              // Add more items here as needed
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            ////////////////////////////////////////////////

            // Static GridView
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: height / 3 +
                    60, // Adjust the height to accommodate the title
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(
                        8.0), // Add padding around the content
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 5.1, 0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFF5C585),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Container(
                                  width: 4,
                                  height: height / 30,
                                ),
                              ),
                            ),
                            Text(
                              "Services & Module", // Title for the services
                              style: TextStyle(
                                color: Primary,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(), // This pushes the button to the right side
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          AllServicemoduale()),
                                );
                              },
                              child: Text(
                                "Show All",
                                style: TextStyle(
                                  color:
                                      Secondary, // You can customize the color
                                  fontSize: 15.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                            height: 0.0), // Space between title and GridView
                        Expanded(
                            child: GridView.builder(
                          itemCount: _services.length,
                          padding: const EdgeInsets.all(8),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                            childAspectRatio: 0.8,
                          ),
                          itemBuilder: (context, index) {
                            final service = _services[index];
                            return _buildGridItem(
                              service["icon"]!,
                              service["label"]!,
                              onTap: () {
                                {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          All_Doctor_List(), // Replace with your actual screen
                                    ),
                                  );
                                }
                              },
                            );
                          },
                        )),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Static GridView
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: height / 5 +
                    54, // Adjust the height to accommodate the title
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(
                        8.0), // Add padding around the content
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 5.1, 0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFFF5C585),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Container(
                                  width: 4,
                                  height: height / 30,
                                ),
                              ),
                            ),
                            Text(
                              "Available Doctor", // Title for the services
                              style: TextStyle(
                                color: Primary,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(), // This pushes the button to the right side
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const All_Doctor_List(),
                                  ),
                                );
                              },
                              child: Text(
                                "Show All",
                                style: TextStyle(
                                  color:
                                      Secondary, // You can customize the color
                                  fontSize: 15.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                            height: 0.0), // Space between title and GridView
                        Expanded(
                          child: ListView(
                            padding: const EdgeInsets.all(8),
                            scrollDirection:
                                Axis.horizontal, // Enable horizontal scrolling
                            children: [
                              _Doctorgrid(
                                "assets/Service_icon/payment (1).png",
                                "Ramjinish Kushwaha",
                                "Cardiology || Anesthesiology",
                                "BSC || BDS || FAGE",
                                () => _navigateTo(OPDScreen()),
                              ),
                              _Doctorgrid(
                                "assets/Service_icon/payment (1).png",
                                "Dr. Shyam Chaudhary",
                                "General Surgery",
                                "General Surgery",
                                () => _navigateTo(OPDScreen()),
                              ),
                              // Add more items here as needed
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  Widget _buildGridItem(String assetPath, String label,
      {required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Primary.withOpacity(0.1),
                ),
                child: Center(
                  child: Image.asset(
                    assetPath,
                    scale: 3,
                  ),
                ),
              ),
              const SizedBox(height: 2.0),
              Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 8,
                  fontWeight: FontWeight.bold,
                  color: Primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _Doctorgrid(String assetPath, String Name, String specialization,
      String Qualification, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width / 1.2,
        child: Card(
          color: Colors.white,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 7.5, 0),
                    child: CircleAvatar(
                      radius: 32,
                      backgroundColor: Secondary, // Red border color
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                            'https://freelance.ca/upload/images/profiles/vbpr5heauddf.jpeg'), // Replace with actual image URL
                        backgroundColor: Colors.white, // Fallback color
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 18, 0, 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            Name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Primary,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                specialization,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Secondary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                Qualification,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Secondary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

/////////////////////////////////////  For  upcoming Appointment

  Widget _UpcomingAppointmentcard({
    required String assetPath,
    required String doctorName,
    required String specialization,
    required String qualification,
    required String patientName,
    required String appointmentDate,
    required String appointmentTime,
    required String Genderanddob,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width / 1.2,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: Colors.white,
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Secondary,
                      child: CircleAvatar(
                        radius: 28,
                        backgroundImage: NetworkImage(assetPath),
                        backgroundColor: Colors.white,
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            doctorName,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Primary,
                            ),
                          ),
                          Text(
                            specialization,
                            style: TextStyle(
                              fontSize: 14,
                              color: Secondary,
                            ),
                          ),
                          Text(
                            qualification,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.grey[300],
                  thickness: 1,
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Patient:',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Primary,
                          ),
                        ),
                        Text(
                          patientName,
                          style: TextStyle(
                            fontSize: 14,
                            color: Secondary,
                          ),
                        ),
                        Text(
                          Genderanddob,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Appointment Date:',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Primary,
                          ),
                        ),
                        Text(
                          appointmentDate,
                          style: TextStyle(
                            fontSize: 14,
                            color: Secondary,
                          ),
                        ),
                        Text(
                          appointmentTime,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showSettingsOptions() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16.0),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(16.0),
            ),
          ),
          child: SizedBox(
            height: height * 0.6, // Adjusted height for simplicity
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Info Icon
                      IconButton(
                        icon:
                            Icon(Icons.info_outline, color: Colors.blueAccent),
                        onPressed: () {
                          // Add your info action here
                        },
                      ),
                      Text(
                        'Billing Details',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      // Close Icon
                      IconButton(
                        icon: Icon(Icons.close, color: Colors.redAccent),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 16.0),

                // Dues Summary
                Expanded(
                  child: ListView.builder(
                    itemCount: duesList.length,
                    itemBuilder: (context, index) {
                      final due = duesList[index];
                      return Card(
                        margin: EdgeInsets.symmetric(vertical: 8.0),
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.receipt_long, color: Primary),
                                  SizedBox(width: 8.0),
                                  Text(
                                    due['title'],
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8.0),
                              _buildDetailRow(
                                  'Total:', 'Rs.${due['total']}', Colors.black),
                              _buildDetailRow('Advance:',
                                  'Rs.${due['advance']}', Colors.green),
                              _buildDetailRow('Discount:',
                                  'Rs.${due['discount']}', Colors.orange),
                              _buildDetailRow(
                                  'Due:', 'Rs.${due['due']}', Colors.red),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // Total Summary
                Divider(height: 1.0, color: Colors.grey.shade300),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Due:',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Rs.${_calculateTotalDue()}',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(height: 1.0, color: Colors.grey.shade300),
              ],
            ),
          ),
        );
      },
    );
  }

// Widget to build detail row
  Widget _buildDetailRow(String label, String value, Color valueColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
              color: valueColor,
            ),
          ),
        ],
      ),
    );
  }

// Sample data for duesList
  final List<Map<String, dynamic>> duesList = [
    {
      'title': 'Hospital Bill',
      'advance': 150,
      'total': 600,
      'due': 450,
      'discount': 50
    },
    {
      'title': 'Pharmacy Bill',
      'advance': 80,
      'total': 300,
      'due': 220,
      'discount': 20
    },    {
      'title': 'Pharmacy Bill',
      'advance': 80,
      'total': 300,
      'due': 220,
      'discount': 20
    },
  ];

// Calculate total due
  double _calculateTotalDue() {
    double totalDue = 0.0;
    for (var due in duesList) {
      totalDue += due['due'];
    }
    return totalDue;
  }
}

class OPDScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("OPD")),
      body: Center(child: Text("OPD Screen")),
    );
  }
}
