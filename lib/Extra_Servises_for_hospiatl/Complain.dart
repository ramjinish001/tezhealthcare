import 'dart:math';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:tezhealthcare/Constant/Color.dart';
import 'package:tezhealthcare/Constant/Mediaquery.dart';
import 'package:tezhealthcare/Globle_Widget/CustomHeaderWithBackButtonAndTitle.dart';

class complaint extends StatefulWidget {
  const complaint({Key? key}) : super(key: key);
  @override
  State<complaint> createState() => _complaintState();
}

class _complaintState extends State<complaint> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _patientAddressController =
      TextEditingController();
  final TextEditingController _complainttController = TextEditingController();
  List<PlatformFile>? _selectedFiles;
  String randomString = "";
  bool isVerified = false;
  TextEditingController _captchaController = TextEditingController();
  String message = '';

  void _onSubmit() {
    if (_formKey.currentState!.validate()) {
      if (isVerified) {
        // Handle the form submission
        setState(() {
          message = 'Captcha verified. Submitting complaint...';
        });
        // Simulating submission delay (replace with actual submission logic)
        Future.delayed(Duration(seconds: 2), () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('complaint submitted successfully'),
              backgroundColor: Colors.green,
            ),
          );
          setState(() {
            message = ''; // Clear message after submission
          });
        });
      } else {
        setState(() {
          message = 'Please verify the captcha';
        });
      }
    }
  }

  Future<void> _pickFiles() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      setState(() {
        _selectedFiles = result.files;
      });
    }
  }

  void _removeFile(PlatformFile file) {
    setState(() {
      _selectedFiles?.remove(file);
    });
  }

  // Logic for generating Captcha
  void buildCaptcha() {
    const letters =
        "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
    const length = 6; // Length of Captcha to be generated
    final random = Random();

    randomString = String.fromCharCodes(
      List.generate(length,
          (index) => letters.codeUnitAt(random.nextInt(letters.length))),
    );

    setState(() {});
    print("Generated Captcha: $randomString");
  }

  @override
  void initState() {
    super.initState();
    buildCaptcha(); // Generate initial Captcha
  }

  // Refresh Captcha
  void refreshCaptcha() {
    buildCaptcha();
    _captchaController.text = ""; // Clear the captcha text field on refresh
    setState(() {
      isVerified = false; // Reset verification status
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomHeaderWithBackButtonAndTitle(title: 'Complaint'),
              Stack(
                children: [
                  Container(
                    height: height / 6,
                    decoration: BoxDecoration(
                      color: Primary,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: _formKey,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildRichText('Full Name', true),
                              const SizedBox(height: 5),
                              _buildTextFormField(
                                  _fullNameController, 'Enter Full Name'),
                              const SizedBox(height: 20),
                              _buildRichText('Phone Number', true),
                              const SizedBox(height: 5),
                              _buildTextFormField(
                                  _phoneNumberController, 'Enter Phone Number',
                                  keyboardType: TextInputType.phone,
                                  isPhoneNumber: true),
                              const SizedBox(height: 20),
                              _buildRichText('Email', false),
                              const SizedBox(height: 5),
                              _buildTextFormField(
                                  _emailController, 'Enter Email',
                                  isEmail: true),
                              const SizedBox(height: 20),
                              _buildRichText('Patient Address', true),
                              const SizedBox(height: 5),
                              _buildTextFormField(_patientAddressController,
                                  'Enter Your Address'),
                              const SizedBox(height: 20),
                              _buildRichText('complaintt', true),
                              const SizedBox(height: 5),
                              TextFormField(
                                controller: _complainttController,
                                maxLines: null,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'This field is required';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: 'Enter your complaint',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              _buildRichText('Attachments', false),
                              const SizedBox(height: 5),
                              InkWell(
                                onTap: _pickFiles,
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.grey),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(Icons.attach_file, color: Primary),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Text(
                                          _selectedFiles != null
                                              ? _selectedFiles!
                                                  .map((file) => file.name)
                                                  .join(', ')
                                              : 'No files selected',
                                          style: const TextStyle(
                                              color: Colors.black54),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              if (_selectedFiles != null) ...[
                                const SizedBox(height: 10),
                                Wrap(
                                  spacing: 8.0,
                                  runSpacing: 4.0,
                                  children: _selectedFiles!.map((file) {
                                    return Chip(
                                      label: Text(file.name),
                                      deleteIcon: const Icon(Icons.cancel),
                                      onDeleted: () => _removeFile(file),
                                    );
                                  }).toList(),
                                ),
                              ],
                              const SizedBox(height: 20),
                              // Captcha Section
                              _buildRichText('Captcha', true),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: Colors.grey),
                                      ),
                                      child: Center(
                                        child: Text(
                                          randomString, // Display Captcha here
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  ElevatedButton.icon(
                                    onPressed: refreshCaptcha,
                                    icon: const Icon(Icons.refresh),
                                    label: const Text('Refresh'),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      controller: _captchaController,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        hintText: 'Enter Captcha',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter the captcha';
                                        }
                                        if (value != randomString) {
                                          return 'Incorrect captcha';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        isVerified = _captchaController.text ==
                                            randomString;
                                        if (isVerified) {
                                          message = 'Captcha verified';
                                        } else {
                                          message =
                                              'Incorrect captcha. Please try again.';
                                        }
                                      });
                                    },
                                    child: const Text('Verify'),
                                  ),
                                ],
                              ),
                              if (message.isNotEmpty)
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text(
                                    message,
                                    style: TextStyle(
                                      color: isVerified
                                          ? Colors.green
                                          : Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              const SizedBox(height: 20),
                              Container(
                                width: double.infinity,
                                height: 50,
                                child: ElevatedButton(
                                  onPressed: _onSubmit,
                                  child: const Text('Submit'),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Secondary),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRichText(String label, bool isRequired) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '$label ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          if (isRequired)
            const TextSpan(
              text: '*',
              style: TextStyle(
                color: Colors.red,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildTextFormField(TextEditingController controller, String hintText,
      {bool isEmail = false,
      bool isPhoneNumber = false,
      TextInputType keyboardType = TextInputType.text}) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: (value) {
        if (!isEmail && !isPhoneNumber && value!.isEmpty) {
          return 'This field is required';
        }
        if (isEmail &&
            value!.isNotEmpty &&
            !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
          return 'Enter a valid email';
        }
        if (isPhoneNumber &&
            (value!.length != 10 || !RegExp(r'^[0-9]{10}$').hasMatch(value))) {
          return 'Enter a valid 10-digit phone number';
        }
        return null;
      },
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
