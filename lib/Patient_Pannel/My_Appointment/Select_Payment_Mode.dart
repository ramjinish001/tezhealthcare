import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tezhealthcare/Constant/Color.dart';
import 'package:tezhealthcare/Constant/Mediaquery.dart';
import 'package:tezhealthcare/Globle_Widget/CustomHeaderWithBackButtonAndTitle.dart';

class Select_Payment_Mode extends StatefulWidget {
  const Select_Payment_Mode({super.key});

  @override
  State<Select_Payment_Mode> createState() => _Select_Payment_ModeState();
}

class _Select_Payment_ModeState extends State<Select_Payment_Mode> {
  String? selectedPaymentMethod;
  final List<String> paymentMethods = [
    'eSewa',
    'Khalti',
    'FonePay',
    'Mobile Banking',
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Primary,
      systemNavigationBarColor: Colors.transparent,
    ));
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomHeaderWithBackButtonAndTitle(
                  title: 'Select Payment Mode'),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Review Your Details',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Primary,
                        ),
                      ),
                      const SizedBox(height: 10),
                      _buildDetailRow('Patient Name:', 'Ramjinish Kushwaha'),
                      _buildDetailRow('Doctor:', 'Dr. Ramjinish Kushwaha '),
                      _buildDetailRow('Appointment Date:', '15/08/2024'),
                      _buildDetailRow('Time Slot:', '10:00 AM'),
                      _buildDetailRow('Consultation Fee:', 'Rs.100'),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Text(
                              'Select Payment Mode',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 8.0,
                          right: 8,
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: paymentMethods.length,
                          itemBuilder: (context, index) {
                            final method = paymentMethods[index];
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedPaymentMethod = method;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: selectedPaymentMethod == method
                                        ? Primary
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: selectedPaymentMethod == method
                                          ? Primary
                                          : Colors.grey[300]!,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        spreadRadius: 2,
                                        blurRadius: 6,
                                        offset: const Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.payment,
                                              color: selectedPaymentMethod ==
                                                      method
                                                  ? Colors.white
                                                  : Primary,
                                            ),
                                            const SizedBox(width: 12),
                                            Text(
                                              method,
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: selectedPaymentMethod ==
                                                        method
                                                    ? Colors.white
                                                    : Primary,
                                              ),
                                            ),
                                          ],
                                        ),
                                        if (selectedPaymentMethod == method)
                                          const Icon(
                                            Icons.check_circle,
                                            color: Colors.white,
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              // Proceed to payment button
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        selectedPaymentMethod != null ? Secondary : Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                  onPressed: selectedPaymentMethod != null
                      ? () {
                          // Proceed to payment action
                        }
                      : null,
                  child: Center(
                    child: const Text(
                      'Proceed to Payment',
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
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
