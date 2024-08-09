import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tezhealthcare/Constant/Color.dart';
import 'package:tezhealthcare/Globle_Widget/NoDataFound.dart';

class Search_Page extends StatefulWidget {
  const Search_Page({super.key});

  @override
  State<Search_Page> createState() => _Search_PageState();
}

class _Search_PageState extends State<Search_Page> {
  final List<Map<String, String>> _doctors = [
    {
      'assetPath':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0PQRbK_KIX8Y8Og8wnxgrIecqx-kprZZ2IA&s',
      'doctorName': 'Dr. Ramjinish Kushwaha',
      'specialization': 'Cardiology || Anesthesiology',
      'qualification': 'BSC || BDS || FAGE',
    },
    {
      'assetPath':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0PQRbK_KIX8Y8Og8wnxgrIecqx-kprZZ2IA&s',
      'doctorName': 'Dr. Shyam Kushwaha',
      'specialization': 'Cardiology || Anesthesiology',
      'qualification': 'BSC || BDS || FAGE',
    },   {
      'assetPath':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0PQRbK_KIX8Y8Og8wnxgrIecqx-kprZZ2IA&s',
      'doctorName': 'Dr. Shyam Kushwaha',
      'specialization': 'Cardiology || Anesthesiology',
      'qualification': 'BSC || BDS || FAGE',
    },   {
      'assetPath':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0PQRbK_KIX8Y8Og8wnxgrIecqx-kprZZ2IA&s',
      'doctorName': 'Dr. Shyam Kushwaha',
      'specialization': 'Cardiology || Anesthesiology',
      'qualification': 'BSC || BDS || FAGE',
    },   {
      'assetPath':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0PQRbK_KIX8Y8Og8wnxgrIecqx-kprZZ2IA&s',
      'doctorName': 'Dr. Shyam Kushwaha',
      'specialization': 'Cardiology || Anesthesiology',
      'qualification': 'BSC || BDS || FAGE',
    },   {
      'assetPath':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0PQRbK_KIX8Y8Og8wnxgrIecqx-kprZZ2IA&s',
      'doctorName': 'Dr. Shyam Kushwaha',
      'specialization': 'Cardiology || Anesthesiology',
      'qualification': 'BSC || BDS || FAGE',
    },   {
      'assetPath':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0PQRbK_KIX8Y8Og8wnxgrIecqx-kprZZ2IA&s',
      'doctorName': 'Dr. Shyam Kushwaha',
      'specialization': 'Cardiology || Anesthesiology',
      'qualification': 'BSC || BDS || FAGE',
    },   {
      'assetPath':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0PQRbK_KIX8Y8Og8wnxgrIecqx-kprZZ2IA&s',
      'doctorName': 'Dr. Shyam Kushwaha',
      'specialization': 'Cardiology || Anesthesiology',
      'qualification': 'BSC || BDS || FAGE',
    },
    // Add more doctors here
  ];

  final List<Map<String, String>> _services = [
    {"icon": "assets/Service_icon/blood-bank.png", "label": "Gynaecology"},
    {"icon": "assets/Service_icon/blood-bank.png", "label": "Dermatology"},
    {"icon": "assets/Service_icon/blood-bank.png", "label": "Cardiology"},
    {"icon": "assets/Service_icon/blood-bank.png", "label": "Hepatology"},
    {"icon": "assets/Service_icon/blood-bank.png", "label": "Dentistry"},
    {"icon": "assets/Service_icon/blood-bank.png", "label": "Endocrinology"},
    {"icon": "assets/Service_icon/blood-bank.png", "label": "Gastroenterology"},
    {"icon": "assets/Service_icon/blood-bank.png", "label": "Hematology"},
    {
      "icon": "assets/Service_icon/blood-bank.png",
      "label": "Laboratory Medicine"
    },
    {"icon": "assets/Service_icon/blood-bank.png", "label": "Neurology"},
    {"icon": "assets/Service_icon/blood-bank.png", "label": "Ophthalmology"},
    {"icon": "assets/Service_icon/blood-bank.png", "label": "Renal Medicine"},
    {
      "icon": "assets/Service_icon/blood-bank.png",
      "label": "Respiratory Medicine"
    },
    {"icon": "assets/Service_icon/blood-bank.png", "label": "Pediatrics"},
    {"icon": "assets/Service_icon/blood-bank.png", "label": "Psychiatry"},
    {"icon": "assets/Service_icon/blood-bank.png", "label": "Radiology"},
    {
      "icon": "assets/Service_icon/blood-bank.png",
      "label": "Rehabilitation Medicine"
    },
    {"icon": "assets/Service_icon/blood-bank.png", "label": "Rheumatology"},
    {"icon": "assets/Service_icon/blood-bank.png", "label": "Plastic Surgery"},
    {"icon": "assets/Service_icon/blood-bank.png", "label": "Pathology"},
  ];

  String _searchText = '';

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Primary,
      systemNavigationBarColor: Colors.transparent,
    ));

    final List<Map<String, String>> filteredDoctors = _doctors.where((doctor) {
      return doctor['doctorName']!
              .toLowerCase()
              .contains(_searchText.toLowerCase()) ||
          doctor['specialization']!
              .toLowerCase()
              .contains(_searchText.toLowerCase()) ||
          doctor['qualification']!
              .toLowerCase()
              .contains(_searchText.toLowerCase());
    }).toList();

    final List<Map<String, String>> filteredServices =
        _services.where((service) {
      return service['label']!
          .toLowerCase()
          .contains(_searchText.toLowerCase());
    }).toList();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Primary,
                borderRadius: BorderRadius.circular(0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white,
                    blurRadius: 2,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      _searchText = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Search...',
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
                    prefixIcon: const Icon(Icons.search),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Card(
                  child: filteredDoctors.isEmpty && filteredServices.isEmpty
                      ? NoDataFound() // Display NoDataFound widget when both lists are empty
                      : ListView(
                          children: [
                            // Display filtered services first
                            ...filteredServices.map((service) {
                              return Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                elevation: 4,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 12.0, vertical: 6.0),
                                color: Colors.blue[50],
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListTile(
                                    leading: Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        color: Colors.white,
                                      ),
                                      child: Image.asset(service['icon']!),
                                    ),
                                    title: Text(
                                      service['label']!,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),

                            // Then display filtered doctors
                            ...filteredDoctors.map((doctor) {
                              return Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                elevation: 4,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 12.0, vertical: 6.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      radius: 30,
                                      backgroundImage:
                                          NetworkImage(doctor['assetPath']!),
                                    ),
                                    title: Text(
                                      doctor['doctorName']!,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                    subtitle: Padding(
                                      padding: const EdgeInsets.only(top: 4.0),
                                      child: Text(
                                        '${doctor['specialization']}\n${doctor['qualification']}',
                                        style: TextStyle(
                                          color: Colors.grey[700],
                                          fontSize: 14.0,
                                        ),
                                      ),
                                    ),
                                    isThreeLine: true,
                                  ),
                                ),
                              );
                            }).toList(),
                          ],
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
