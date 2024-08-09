import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tezhealthcare/Constant/Color.dart';
import 'package:tezhealthcare/Globle_Widget/CustomHeaderWithBackButtonAndTitle.dart';
import 'package:tezhealthcare/Globle_Widget/NoDataFound.dart';
import 'package:tezhealthcare/Patient_Pannel/My_Appointment/Select_Date.dart';

class All_Doctor_List extends StatefulWidget {
  const All_Doctor_List({super.key});

  @override
  State<All_Doctor_List> createState() => _All_Doctor_ListState();
}

class _All_Doctor_ListState extends State<All_Doctor_List> {
  TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> _doctors = [
    {
      'assetPath':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0PQRbK_KIX8Y8Og8wnxgrIecqx-kprZZ2IA&s',
      'doctorName': 'Dr. Ramjinish Kushwaha',
      'specialization': 'Cardiology || Anesthesiology',
      'qualification': 'BSC || BDS || FAGE',
      'Appointment_Charge': '500',
    },
    {
      'assetPath':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0PQRbK_KIX8Y8Og8wnxgrIecqx-kprZZ2IA&s',
      'doctorName': 'Dr. Shyam Kushwaha',
      'specialization': 'Cardiology || Anesthesiology',
      'qualification': 'BSC || BDS || FAGE',
      'Appointment_Charge': '500',
    },
    {
      'assetPath':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0PQRbK_KIX8Y8Og8wnxgrIecqx-kprZZ2IA&s',
      'doctorName': 'Dr. Shyam Kushwaha',
      'specialization': 'Cardiology || Anesthesiology',
      'qualification': 'BSC || BDS || FAGE',
      'Appointment_Charge': '500',
    },
    {
      'assetPath':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0PQRbK_KIX8Y8Og8wnxgrIecqx-kprZZ2IA&s',
      'doctorName': 'Dr. Shyam Kushwaha',
      'specialization': 'Cardiology || Anesthesiology',
      'qualification': 'BSC || BDS || FAGE',
      'Appointment_Charge': '500',
    },
    {
      'assetPath':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0PQRbK_KIX8Y8Og8wnxgrIecqx-kprZZ2IA&s',
      'doctorName': 'Dr. Shyam Kushwaha',
      'specialization': 'Cardiology || Anesthesiology',
      'qualification': 'BSC || BDS || FAGE',
      'Appointment_Charge': '500',
    },
    {
      'assetPath':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0PQRbK_KIX8Y8Og8wnxgrIecqx-kprZZ2IA&s',
      'doctorName': 'Dr. Shyam Kushwaha',
      'specialization': 'Cardiology || Anesthesiology',
      'qualification': 'BSC || BDS || FAGE',
      'Appointment_Charge': '500',
    },
    {
      'assetPath':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0PQRbK_KIX8Y8Og8wnxgrIecqx-kprZZ2IA&s',
      'doctorName': 'Dr. Shyam Kushwaha',
      'specialization': 'Cardiology || Anesthesiology',
      'qualification': 'BSC || BDS || FAGE',
      'Appointment_Charge': '500',
    },
    {
      'assetPath':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0PQRbK_KIX8Y8Og8wnxgrIecqx-kprZZ2IA&s',
      'doctorName': 'Dr. Shyam Kushwaha',
      'specialization': 'Cardiology || Anesthesiology',
      'qualification': 'BSC || BDS || FAGE',
      'Appointment_Charge': '500',
    },
    {
      'assetPath':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0PQRbK_KIX8Y8Og8wnxgrIecqx-kprZZ2IA&s',
      'doctorName': 'Dr. Shyam Kushwaha',
      'specialization': 'Cardiology || Anesthesiology',
      'qualification': 'BSC || BDS || FAGE',
      'Appointment_Charge': '500',
    },
    {
      'assetPath':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0PQRbK_KIX8Y8Og8wnxgrIecqx-kprZZ2IA&s',
      'doctorName': 'Dr. Shyam Kushwaha',
      'specialization': 'Cardiology || Anesthesiology',
      'qualification': 'BSC || BDS || FAGE',
      'Appointment_Charge': '500',
    },
    // Add more doctors here
  ];

  List<Map<String, String>> _filteredDoctors = [];
  bool _isSearchVisible = false;

  @override
  void initState() {
    super.initState();
    _filteredDoctors = _doctors;
    _searchController.addListener(() {
      setState(() {
        _filteredDoctors = _doctors
            .where((doctor) => doctor['doctorName']!
                .toLowerCase()
                .contains(_searchController.text.toLowerCase()))
            .toList();
      });
    });
  }

  void _toggleSearch() {
    setState(() {
      _isSearchVisible = !_isSearchVisible;
      if (!_isSearchVisible) {
        _searchController.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Primary,
      systemNavigationBarColor: Colors.transparent,
    ));
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                const CustomHeaderWithBackButtonAndTitle(
                    title: 'Select Doctor'),
                if (_isSearchVisible)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search Doctor...',
                        prefixIcon: Icon(Icons.search, color: Primary),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 15.0,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Primary.withOpacity(0.5),
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                Expanded(
                  child: _filteredDoctors.isEmpty && _filteredDoctors.isEmpty
                      ? NoDataFound() // Display NoDataFound widget when both lists are empty
                      : ListView.builder(
                          padding: const EdgeInsets.all(8),
                          itemCount: _filteredDoctors.length,
                          itemBuilder: (context, index) {
                            return _DoctorCard(
                              assetPath: _filteredDoctors[index]['assetPath']!,
                              doctorName: _filteredDoctors[index]
                                  ['doctorName']!,
                              specialization: _filteredDoctors[index]
                                  ['specialization']!,
                              qualification: _filteredDoctors[index]
                                  ['qualification']!,
                              Appointment_Charge:
                                  "Appointment Charge: Rs.${_filteredDoctors[index]['Appointment_Charge']!}/-",
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        Select_Date(), // Replace with your actual screen
                                  ),
                                );
                              },
                            );
                          },
                        ),
                ),
              ],
            ),
            Positioned(
              right: 10,
              top: 10,
              child: IconButton(
                icon: Icon(
                  _isSearchVisible ? Icons.close : Icons.search,
                  color: Colors.white,
                ),
                onPressed: _toggleSearch,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _DoctorCard({
    required String assetPath,
    required String doctorName,
    required String specialization,
    required String qualification,
    required String Appointment_Charge,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width / 1.2,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
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
                              fontSize: 12,
                              color: Secondary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            qualification,
                            style: TextStyle(
                              fontSize: 12,
                              color: Secondary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 6),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Primary.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              Appointment_Charge,
                              style: TextStyle(
                                fontSize: 12,
                                color: Secondary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Primary, Secondary],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: ElevatedButton.icon(
                    onPressed: onTap,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14.0),
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      elevation: 0,
                    ),
                    icon: Icon(Icons.calendar_today_outlined,
                        color: Colors.white),
                    label: Text(
                      'Book Appointment',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
