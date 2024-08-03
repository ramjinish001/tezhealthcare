import 'package:flutter/material.dart';
import 'package:tezhealthcare/Constant/Color.dart';
import 'package:tezhealthcare/Constant/Mediaquery.dart';
import 'package:tezhealthcare/Globle_Widget/CustomHeaderWithBackButtonAndTitle.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpCenter extends StatefulWidget {
  const HelpCenter({super.key});
  @override
  State<HelpCenter> createState() => _HelpCenterState();
}

class _HelpCenterState extends State<HelpCenter> {
  void launchWebsite(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not launch $url')),
      );
    }
  }

  void launchEmailClient(String email) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
    );

    if (await canLaunch(emailLaunchUri.toString())) {
      await launch(emailLaunchUri.toString());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not launch $email')),
      );
    }
  }

  void makePhoneCall(String phoneNumber) async {
    final url = 'tel:$phoneNumber';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not launch $url')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomHeaderWithBackButtonAndTitle(title: 'Help Center'),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/Image/Tezash.png', // Replace with your logo file path
                            width: width,
                            height: height / 10,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildHelpOption(
                      icon: Icons.phone,
                      title: 'Call Support',
                      description:
                          'Speak directly with our support team for immediate assistance. Available from 9 AM to 6 PM, Monday to Friday.',
                      onTap: () {
                        makePhoneCall(
                            '1234567890'); // Replace with your support phone number
                      },
                    ),
                    _buildHelpOption(
                      icon: Icons.language,
                      title: 'Visit Our Website',
                      description:
                          'Find detailed information, user guides, and more on our official website.',
                      onTap: () {
                        launchWebsite(
                            'https://www.tezashtech.com'); // Replace with your website URL
                      },
                    ),
                    _buildHelpOption(
                      icon: Icons.email,
                      title: 'Email Us',
                      description:
                          'Send us an email for non-urgent inquiries and support. We aim to respond within 24 hours.',
                      onTap: () {
                        launchEmailClient(
                            'support@tezashtech.com'); // Replace with your support email
                      },
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Frequently Asked Questions',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Primary),
                    ),
                    const SizedBox(height: 10),
                    _buildFAQSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHelpOption(
      {required IconData icon,
      required String title,
      required String description,
      required VoidCallback onTap}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 5.0,
      child: ListTile(
        leading: Icon(icon, color: Primary, size: 28),
        title: Text(title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        subtitle: Text(description),
        onTap: onTap,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
      ),
    );
  }

  Widget _buildFAQSection() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildFAQItem(
              question: 'How can I reset my password?',
              answer:
                  'To reset your password, visit the "Forgot Password" section on the login page.'),
          _buildFAQItem(
              question: 'Where can I find user guides?',
              answer:
                  'User guides are available in the "Help" section of our website.'),
          _buildFAQItem(
              question: 'What should I do if I encounter a technical issue?',
              answer:
                  'If you encounter a technical issue, contact our support team through the options above.'),
        ],
      ),
    );
  }

  Widget _buildFAQItem({required String question, required String answer}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 4),
          Text(answer, style: TextStyle(color: Colors.grey[700])),
        ],
      ),
    );
  }
}
