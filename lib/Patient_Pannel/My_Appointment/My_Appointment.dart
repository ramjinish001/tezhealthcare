import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tezhealthcare/Constant/Color.dart';
import 'package:tezhealthcare/Globle_Widget/CustomHeaderWithBackButtonAndTitle.dart';

class MyAppointment extends StatefulWidget {
  const MyAppointment({super.key});

  @override
  State<MyAppointment> createState() => _MyAppointmentState();
}

class _MyAppointmentState extends State<MyAppointment>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CustomHeaderWithBackButtonAndTitle(title: 'My Appointments'),
            Padding(
              padding: const EdgeInsets.only(
                right: 8.0,
                left: 8,
              ),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: Colors.blueGrey[50],
                child: TabBar(
                  controller: _tabController,
                  indicatorColor: Primary,
                  indicatorWeight: 4.0,
                  labelColor: Primary,
                  dividerColor: Colors.transparent,
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  unselectedLabelStyle: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                  ),
                  tabs: const [
                    Tab(text: 'Upcoming'),
                    Tab(text: 'Past'),
                    Tab(text: 'Cancelled'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // Upcoming Appointments
                  AppointmentList(
                    title: 'Upcoming Appointments',
                    cardColor: Colors.white,
                  ),

                  // Past Appointments
                  AppointmentList(
                    title: 'Past Appointments',
                    cardColor: Colors.white,
                  ),

                  // Cancelled Appointments
                  AppointmentList(
                    title: 'Cancelled Appointments',
                    cardColor: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppointmentList extends StatefulWidget {
  final String title;
  final Color cardColor;

  const AppointmentList({
    required this.title,
    required this.cardColor,
    super.key,
  });

  @override
  State<AppointmentList> createState() => _AppointmentListState();
}

class _AppointmentListState extends State<AppointmentList> {
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
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(8),
                scrollDirection: Axis.vertical,
                children: [
                  _AppointmentCard(
                    assetPath:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0PQRbK_KIX8Y8Og8wnxgrIecqx-kprZZ2IA&s',
                    doctorName: 'Dr. Ramjinish Kushwaha',
                    specialization: 'Cardiology || Anesthesiology',
                    qualification: 'BSC || BDS || FAGE',
                    appointmentDate: '2052-25-35',
                    patientName: 'Ramjinish Kushwaha',
                    appointmentTime: '10:30 AM',
                    Genderanddob: 'Male, 2057-01-02',
                    cardColor: widget.cardColor,
                    onTap: () {},
                  ),
                  _AppointmentCard(
                    assetPath:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0PQRbK_KIX8Y8Og8wnxgrIecqx-kprZZ2IA&s',
                    doctorName: 'Dr. Ramjinish Kushwaha',
                    specialization: 'Cardiology || Anesthesiology',
                    qualification: 'BSC || BDS || FAGE',
                    appointmentDate: '2052-25-35',
                    patientName: 'Ramjinish Kushwaha',
                    appointmentTime: '10:30 AM',
                    Genderanddob: 'Male, 2057-01-02',
                    cardColor: widget.cardColor,
                    onTap: () {},
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

  Widget _AppointmentCard({
    required String assetPath,
    required String doctorName,
    required String specialization,
    required String qualification,
    required String patientName,
    required String appointmentDate,
    required String appointmentTime,
    required String Genderanddob,
    required Color cardColor,
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
          color: cardColor,
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
