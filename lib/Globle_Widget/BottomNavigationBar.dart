import 'package:flutter/material.dart';
import 'package:tezhealthcare/Constant/Color.dart';
import 'package:tezhealthcare/Patient_Pannel/Patient_Profile/Patient_Profile.dart';
import 'package:tezhealthcare/Patient_Pannel/Report/Report.dart';
import 'package:tezhealthcare/Patient_Pannel/Transaction/Transaction.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavigationBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: (index) {
        onItemTapped(index);

        if (index == 1) {
          // Transaction tab
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Transaction()),
          );
        }
        if (index == 3) {
          // Transaction ab
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PatientProfile()),
          );
        }
        if (index == 2) {
          // Transaction ab
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Report()),
          );
        }
        // Add similar navigation for other tabs if needed
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.backup_table_sharp),
          label: 'Transaction',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.report),
          label: 'Report',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Profile',
        ),
      ],
      selectedItemColor: Colors.white, // Color for selected item
      unselectedItemColor: Colors.white60, // Color for unselected items
      backgroundColor: Primary, // Background color of the navigation bar
      elevation: 8, // Elevation of the navigation bar
      type: BottomNavigationBarType.fixed, // Ensures fixed number of items
    );
  }
}
