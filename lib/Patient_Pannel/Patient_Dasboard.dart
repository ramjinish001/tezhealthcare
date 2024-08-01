import 'package:flutter/material.dart';
import 'package:tezhealthcare/Constant/Color.dart';
import 'package:tezhealthcare/Constant/Mediaquery.dart';
import 'package:tezhealthcare/Globle_Widget/BottomNavigationBar.dart';
import 'package:tezhealthcare/Patient_Pannel/All_Doctor_list/All_Doctor_List.dart';
import 'package:tezhealthcare/Patient_Pannel/Service&Modualelist/All_Servicemoduale.dart';
import 'package:tezhealthcare/Patient_Pannel/Transaction/Transaction.dart';
import 'package:tezhealthcare/Patient_Pannel/Upcoming_Appointment/All_UpcomingAppointmentlist.dart';

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
                        SizedBox(
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
                                // Handle bell icon tap
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
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
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
                              children: [
                                Text(
                                  'Ramjinish Kushwaha ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Primary,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Patient Id: 25',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Primary,
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
                                        color: Primary,
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
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
                                Text(
                                  'Total Dues ',
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
                                      builder: (context) =>
                                          AllUpcomingappointmentlist()),
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
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              AllUpcomingappointmentlist()),
                                    );
                                  }),
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
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => OPDScreen()),
                                    );
                                  }),
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
                height: height / 4 +
                    45, // Adjust the height to accommodate the title
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
                          child: GridView(
                            padding: const EdgeInsets.all(8),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 8,
                              childAspectRatio: 1,
                            ),
                            children: [
                              _buildGridItem(
                                "assets/Service_icon/payment (1).png",
                                "Transaction",
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Transaction(),
                                    ),
                                  );
                                },
                              ),
                              _buildGridItem(
                                "assets/Service_icon/hospital (6).png",
                                "Ipd",
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const AllUpcomingappointmentlist(),
                                    ),
                                  );
                                },
                              ),
                              _buildGridItem(
                                "assets/Service_icon/microscope.png",
                                "Report",
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const AllUpcomingappointmentlist(),
                                    ),
                                  );
                                },
                              ),
                              _buildGridItem(
                                "assets/Service_icon/pharmacy.png",
                                "Pharmacy",
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const AllUpcomingappointmentlist(),
                                    ),
                                  );
                                },
                              ),
                              _buildGridItem(
                                "assets/Service_icon/certificate.png",
                                "Certificate",
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const AllUpcomingappointmentlist(),
                                    ),
                                  );
                                },
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
                height: height / 25,
                width: width / 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Primary.withOpacity(0.1),
                ),
                child: Center(
                  child: Image.asset(
                    assetPath,
                    scale: 8,
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
          color: Colors.white70,
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
