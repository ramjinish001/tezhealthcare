import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tezhealthcare/Constant/Color.dart';
import 'package:tezhealthcare/Globle_Widget/CustomHeaderWithBackButtonAndTitle.dart';
import 'package:tezhealthcare/Globle_Widget/NoDataFound.dart';

class Report extends StatefulWidget {
  const Report({super.key});

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  final List<Map<String, String>> reports = [
    {
      "RID": "001",
      "Section": "Pathology",
      "Report No.": "R1001",
      "Status": "Processing"
    },
    {
      "RID": "002",
      "Section": "Radiology",
      "Report No.": "R1002",
      "Status": "Printed"
    },
    {
      "RID": "003",
      "Section": "Radiology",
      "Report No.": "R1003",
      "Status": "Pending"
    },
    {
      "RID": "004",
      "Section": "Pathology",
      "Report No.": "R1004",
      "Status": "Processing"
    },
    // More items...
  ];

  List<Map<String, String>> filteredReports = [];
  bool isSearching = false;

  @override
  void initState() {
    super.initState();
    filteredReports = reports;
  }

  void _filterReports(String query) {
    setState(() {
      filteredReports = reports
          .where((report) => report.values.any(
              (value) => value.toLowerCase().contains(query.toLowerCase())))
          .toList();
    });
  }

  void _toggleSearch() {
    setState(() {
      isSearching = !isSearching;
      if (!isSearching) {
        filteredReports = reports;
      }
    });
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case "Processing":
        return Colors.orange;
      case "Printed":
        return Colors.green;
      case "Pending":
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  IconData _getStatusIcon(String status) {
    switch (status) {
      case "Processing":
        return Icons.hourglass_top;
      case "Printed":
        return Icons.check_circle;
      case "Pending":
        return Icons.pending_actions;
      default:
        return Icons.info;
    }
  }

  Gradient _getStatusGradient(String status) {
    switch (status) {
      case "Processing":
        return LinearGradient(colors: [Colors.orangeAccent, Colors.deepOrange]);
      case "Printed":
        return LinearGradient(colors: [Colors.lightGreen, Colors.green]);
      case "Pending":
        return LinearGradient(colors: [Colors.redAccent, Colors.red]);
      default:
        return LinearGradient(colors: [Colors.grey, Colors.black]);
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor:Primary,
      systemNavigationBarColor: Colors.transparent,
    ));
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    const CustomHeaderWithBackButtonAndTitle(title: 'Report'),
                    Positioned(
                      right: 10,
                      top: 10,
                      child: IconButton(
                        icon: Icon(
                          isSearching ? Icons.close : Icons.search,
                          color: Colors.white,
                        ),
                        onPressed: _toggleSearch,
                      ),
                    ),
                  ],
                ),
                if (isSearching)
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search Reports...',
                        prefixIcon: const Icon(Icons.search),
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
                        filled: true,
                        fillColor: const Color(0xFFF5F5F5),
                      ),
                      onChanged: _filterReports,
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color(0xFF433D63),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 11, horizontal: 10),
                      child: Row(
                        children: const [
                          Expanded(
                            flex: 2,
                            child: Text(
                              'Report No.',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              'Section',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              'Status',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child:  filteredReports.isEmpty && filteredReports.isEmpty
                      ? NoDataFound() // Display NoDataFound widget when both lists are empty
                      :ListView.builder(
                    itemCount: filteredReports.length,
                    itemBuilder: (context, index) {
                      final report = filteredReports[index];
                      final status = report["Status"]!;
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: index % 2 == 0 ? Primary : Secondary,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              offset: Offset(0, 3),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Text(
                                report["Report No."]!,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                report["Section"]!,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 8),
                                decoration: BoxDecoration(
                                  gradient: _getStatusGradient(status),
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      offset: Offset(0, 2),
                                      blurRadius: 4,
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      _getStatusIcon(status),
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      status,
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 12),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
