import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tezhealthcare/Constant/Color.dart';
import 'package:tezhealthcare/Patient_Pannel/Patient_Dasboard.dart';

class DoctorBookSuccess extends StatefulWidget {
  const DoctorBookSuccess({super.key});
  @override
  State<DoctorBookSuccess> createState() => _DoctorBookSuccessState();
}

class _DoctorBookSuccessState extends State<DoctorBookSuccess> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ));
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => PatientDashboard()),
          (Route<dynamic> route) => false,
        );
        return true; // Return true to allow the back action
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.green.shade400,
                                Colors.green.shade700
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            shape: BoxShape.circle,
                          ),
                          padding: const EdgeInsets.all(20),
                          child: Icon(
                            Icons.check_circle_outline,
                            color: Colors.white,
                            size: 50,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Appointment Confirmed!',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 5),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'Your appointment with ',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black54,
                          ),
                          children: [
                            TextSpan(
                              text: 'Dr. Ramjinish Kushwaha',
                              style: TextStyle(
                                fontWeight:
                                    FontWeight.bold, // Make this part bold
                              ),
                            ),
                            TextSpan(
                              text: ' has been successfully booked.',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildAppointmentDetailRow(
                              label: 'Doctor',
                              value: 'Dr. Ramjinish Kushwaha',
                            ),
                            const Divider(),
                            _buildAppointmentDetailRow(
                              label: 'Specialization',
                              value: 'Cardiologist',
                            ),
                            const Divider(),
                            _buildAppointmentDetailRow(
                              label: 'Patient',
                              value: 'Ramjinish Kushwaha',
                            ),
                            const Divider(),
                            _buildAppointmentDetailRow(
                              label: 'Date',
                              value: 'August 10, 2024',
                            ),
                            const Divider(),
                            _buildAppointmentDetailRow(
                              label: 'Time',
                              value: '10:00 AM',
                            ),
                            const Divider(),
                            _buildAppointmentDetailRow(
                              label: 'Appointment ID',
                              value: '#AP123456789',
                            ),
                            const Divider(),
                            _buildAppointmentDetailRow(
                              label: 'Appointment Charge',
                              value: 'Rs.150',
                            ),
                            const SizedBox(height: 10),
                            Text(
                              '* Please arrive 10 minutes early to complete any paperwork.',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.redAccent,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 7.0, vertical: 10),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Secondary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 10),
                          ),
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PatientDashboard()),
                              (Route<dynamic> route) => false,
                            );
                          },
                          child: Center(
                            child: const Text(
                              'Back to Home',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
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
    );
  }

  Widget _buildAppointmentDetailRow(
      {required String label, required String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
