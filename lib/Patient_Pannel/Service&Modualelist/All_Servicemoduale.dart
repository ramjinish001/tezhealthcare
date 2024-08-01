import 'package:flutter/material.dart';
import 'package:tezhealthcare/Constant/Color.dart';
import 'package:tezhealthcare/Globle_Widget/CustomHeaderWithBackButtonAndTitle.dart';
import 'package:tezhealthcare/Patient_Pannel/Upcoming_Appointment/All_UpcomingAppointmentlist.dart';

class AllServicemoduale extends StatefulWidget {
  const AllServicemoduale({super.key});
  @override
  State<AllServicemoduale> createState() => _AllServicemodualeState();
}

class _AllServicemodualeState extends State<AllServicemoduale> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> _services = [];
  List<Map<String, String>> _filteredServices = [];
  @override
  void initState() {
    super.initState();
    _services = [
      {"icon": "assets/Service_icon/payment (1).png", "label": "Transaction"},
      {"icon": "assets/Service_icon/hospital (6).png", "label": "Ipd"},
      {"icon": "assets/Service_icon/microscope.png", "label": "Report"},
      {"icon": "assets/Service_icon/pharmacy.png", "label": "Pharmacy"},
      {"icon": "assets/Service_icon/blood-bank.png", "label": "OPD History"},
      {"icon": "assets/Service_icon/certificate.png", "label": "Certificate"},
    ];
    _filteredServices = List.from(_services);
  }

  void _filterServices(String query) {
    if (query.isEmpty) {
      setState(() {
        _filteredServices = List.from(_services);
      });
    } else {
      setState(() {
        _filteredServices = _services
            .where((service) =>
                service['label']!.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Light background
      body: SafeArea(
        child: Column(
          children: [
            const CustomHeaderWithBackButtonAndTitle(
              title: 'Services & Module',
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: _searchController,
                onChanged: _filterServices,
                decoration: InputDecoration(
                  hintText: "Search Services...",
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
            const SizedBox(height: 16.0),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: GridView.builder(
                  itemCount: _filteredServices.length,
                  padding: const EdgeInsets.all(8),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 0.8,
                  ),
                  itemBuilder: (context, index) {
                    final service = _filteredServices[index];
                    return _buildGridItem(
                      service["icon"]!,
                      service["label"]!,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const AllUpcomingappointmentlist(),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
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
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
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
              const SizedBox(height: 8.0),
              Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 10,
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
}
