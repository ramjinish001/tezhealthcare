import 'package:flutter/material.dart';
import 'package:tezhealthcare/Constant/Color.dart';
import 'package:tezhealthcare/Globle_Widget/CustomHeaderWithBackButtonAndTitle.dart';

class Transaction extends StatefulWidget {
  const Transaction({super.key});

  @override
  State<Transaction> createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
  // Sample data for demonstration
  final List<Map<String, String>> transactions = [
    {"TID": "001", "Section": "OPD", "Bill No.": "1001", "Amount": "\$200"},
    {"TID": "002", "Section": "IPD", "Bill No.": "1002", "Amount": "\$450"},
    {"TID": "003", "Section": "Lab", "Bill No.": "1003", "Amount": "\$120"},
    {"TID": "003", "Section": "Lab", "Bill No.": "1003", "Amount": "\$120"},
    {"TID": "003", "Section": "Lab", "Bill No.": "1003", "Amount": "\$120"},
    {"TID": "003", "Section": "Lab", "Bill No.": "1003", "Amount": "\$120"},
    {"TID": "003", "Section": "Lab", "Bill No.": "1003", "Amount": "\$120"},
    {"TID": "003", "Section": "Lab", "Bill No.": "1003", "Amount": "\$120"},
    {"TID": "003", "Section": "Lab", "Bill No.": "1003", "Amount": "\$120"},
    {"TID": "003", "Section": "Lab", "Bill No.": "1003", "Amount": "\$120"},
    {"TID": "003", "Section": "Lab", "Bill No.": "1003", "Amount": "\$120"},
    {"TID": "003", "Section": "Lab", "Bill No.": "1003", "Amount": "\$120"},
    {"TID": "003", "Section": "Lab", "Bill No.": "1003", "Amount": "\$120"},
    {
      "TID": "004",
      "Section": "Pharmacy",
      "Bill No.": "1004",
      "Amount": "\$350"
    },
  ];

  List<Map<String, String>> filteredTransactions = [];
  bool isSearching = false; // To control the visibility of the search bar

  @override
  void initState() {
    super.initState();
    filteredTransactions = transactions; // Initialize with full list
  }

  void _filterTransactions(String query) {
    setState(() {
      filteredTransactions = transactions
          .where((transaction) => transaction.values.any(
              (value) => value.toLowerCase().contains(query.toLowerCase())))
          .toList();
    });
  }

  void _toggleSearch() {
    setState(() {
      isSearching = !isSearching;
      if (!isSearching) {
        filteredTransactions =
            transactions; // Reset the list when search is closed
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header with a Search button
            Stack(
              children: [
                const CustomHeaderWithBackButtonAndTitle(title: 'Transaction'),
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
            // Search bar visible only when searching
            if (isSearching)
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search Transactions...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Primary.withOpacity(0.5),
                        width: 0,
                      ),
                    ),
                    filled: true,
                    fillColor: const Color(0xFFF5F5F5),
                  ),
                  onChanged: _filterTransactions,
                ),
              ),
            // Table Header
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color(0xFF433D63),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 11, horizontal: 10),
                  child: Row(
                    children: const [
                      Expanded(
                        flex: 1,
                        child: Text(
                          'TID',
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
                          'Bill No.',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Amount',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // List of Transactions
            Expanded(
              child: filteredTransactions.isNotEmpty
                  ? ListView.builder(
                      itemCount: filteredTransactions.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 10),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: index % 2 == 0
                                ? Primary
                                :Secondary
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  filteredTransactions[index]["TID"]!,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  filteredTransactions[index]["Section"]!,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  filteredTransactions[index]["Bill No."]!,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  filteredTransactions[index]["Amount"]!,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    )
                  : const Center(
                      child: Text(
                        'No transactions found',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
