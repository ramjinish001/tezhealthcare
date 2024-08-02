import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tezhealthcare/Constant/Color.dart';
import 'package:tezhealthcare/Globle_Widget/CustomHeaderWithBackButtonAndTitle.dart';

class Transaction extends StatefulWidget {
  const Transaction({super.key});

  @override
  State<Transaction> createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
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
    {"TID": "003", "Section": "Lab", "Bill No.": "1003", "Amount": "\$120"},
    {"TID": "003", "Section": "Lab", "Bill No.": "1003", "Amount": "\$120"},
    {"TID": "003", "Section": "Lab", "Bill No.": "1003", "Amount": "\$120"},
    // more items...
    {
      "TID": "004",
      "Section": "Pharmacy",
      "Bill No.": "1004",
      "Amount": "\$350"
    },
  ];

  List<Map<String, String>> filteredTransactions = [];
  bool isSearching = false;
  bool showTotal = false; // Control the visibility of the total amount

  @override
  void initState() {
    super.initState();
    filteredTransactions = transactions;
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
        filteredTransactions = transactions;
      }
    });
  }

  String _calculateTotalAmount() {
    double total = 0;
    for (var transaction in filteredTransactions) {
      total +=
          double.tryParse(transaction["Amount"]!.replaceAll('\$', '')) ?? 0;
    }
    return '\$${total.toStringAsFixed(2)}';
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
                    const CustomHeaderWithBackButtonAndTitle(
                        title: 'Transaction'),
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
                        hintText: 'Search Transactions...',
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
                      onChanged: _filterTransactions,
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
                Expanded(
                  child: NotificationListener<ScrollNotification>(
                    onNotification: (scrollNotification) {
                      if (scrollNotification is ScrollUpdateNotification) {
                        if (scrollNotification.scrollDelta! > 0) {
                          // Scrolling down
                          setState(() {
                            showTotal = false;
                          });
                        } else if (scrollNotification.scrollDelta! < 0 &&
                            filteredTransactions.length >= 10) {
                          // Scrolling up and list has at least 10 items
                          setState(() {
                            showTotal = true;
                          });
                        }
                      }
                      return true;
                    },
                    child: ListView.builder(
                      itemCount: filteredTransactions.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 10),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: index % 2 == 0 ? Primary : Secondary,
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
                    ),
                  ),
                ),
              ],
            ),
            if (showTotal)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  color: const Color(0xFF433D63),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total Amount:',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        _calculateTotalAmount(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
