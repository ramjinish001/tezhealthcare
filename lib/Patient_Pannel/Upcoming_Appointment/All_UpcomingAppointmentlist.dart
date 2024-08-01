import 'package:flutter/material.dart';
import 'package:tezhealthcare/Constant/Color.dart';
import 'package:tezhealthcare/Globle_Widget/CustomHeaderWithBackButtonAndTitle.dart';

class AllUpcomingappointmentlist extends StatefulWidget {
  const AllUpcomingappointmentlist({super.key});

  @override
  State<AllUpcomingappointmentlist> createState() =>
      _AllUpcomingappointmentlistState();
}

class _AllUpcomingappointmentlistState
    extends State<AllUpcomingappointmentlist> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CustomHeaderWithBackButtonAndTitle(
                title: 'Upcoming Appointment'),
            Expanded( // Wrapping ListView with Expanded
              child: ListView(
                padding: const EdgeInsets.all(8),
                scrollDirection: Axis.vertical,
                children: [
                  _UpcomingAppointmentcard(
                    assetPath:
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0PQRbK_KIX8Y8Og8wnxgrIecqx-kprZZ2IA&s',
                    doctorName: 'Dr. Ramjinish Kushwaha',
                    specialization: 'Cardiology || Anesthesiology',
                    qualification: 'BSC || BDS || FAGE',
                    appointmentDate: '2052-25-35',
                    patientName: 'Ramjinish Kushwaha',
                    appointmentTime: '10:30 AM',
                    Genderanddob: 'Male, 2057-01-02',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                            const AllUpcomingappointmentlist()),
                      );
                    },
                  ),
                  _UpcomingAppointmentcard(
                    assetPath:
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0PQRbK_KIX8Y8Og8wnxgrIecqx-kprZZ2IA&s',
                    doctorName: 'Dr. Ramjinish Kushwaha',
                    specialization: 'Cardiology || Anesthesiology',
                    qualification: 'BSC || BDS || FAGE',
                    appointmentDate: '2052-25-35',
                    patientName: 'Ramjinish Kushwaha',
                    appointmentTime: '10:30 AM',
                    Genderanddob: 'Male, 2057-01-02',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                            const AllUpcomingappointmentlist()),
                      );
                    },
                  ),
                  // Add more items here as needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

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
        width: MediaQuery.of(context).size.width / 1.2,
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
