import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:tezhealthcare/Constant/Color.dart';
import 'package:tezhealthcare/Constant/Mediaquery.dart';
import 'package:tezhealthcare/Globle_Widget/CustomHeaderWithBackButtonAndTitle.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  final List<String> _images = [
    'https://akm-img-a-in.tosshub.com/businesstoday/images/story/202402/65deddb9425ff-rat-menace-at-a-kanpur-hospital-102147394-16x9.jpg?size=1200:675',
    'https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg',
    'https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg',
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomHeaderWithBackButtonAndTitle(title: 'About Us'),
              SizedBox(height: 0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height / 5,
                    autoPlay: true,
                    enlargeCenterPage: false,
                    viewportFraction: 1.0,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                  items: _images.map((imagePath) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 4.0), // Reduced margin
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                            image: DecorationImage(
                              image: NetworkImage(imagePath),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 8), // Space between slider and indicators
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _images.asMap().entries.map((entry) {
                  int index = entry.key;
                  bool isActive = _currentIndex == index;
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    width: isActive ? 16.0 : 12.0,
                    height: 6.0,
                    margin:
                        EdgeInsets.symmetric(horizontal: 2.0), // Reduced margin
                    decoration: BoxDecoration(
                      color: isActive ? Primary : Secondary,
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: isActive
                          ? [
                              BoxShadow(
                                color: Colors.blue.withOpacity(0.5),
                                blurRadius: 6,
                                offset: Offset(0, 4),
                              ),
                            ]
                          : [],
                    ),
                  );
                }).toList(),
              ),
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Primary.withOpacity(0.13),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Provincial Hospital Kathmandu',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Primary,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Committed to providing the highest quality healthcare services. Our state-of-the-art facilities, experienced staff, and compassionate care ensure that every patient receives the best possible treatment.',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                              height: 1.5,
                            ),
                          ),
                          Divider(
                            height: 30,
                            color: Primary,
                            thickness: 1.5,
                          ),
                          _buildInfoRow(Icons.email, 'Email',
                              'contact@tezhealthcare.com'),
                          const SizedBox(height: 10),
                          _buildInfoRow(Icons.phone, 'Phone', '+9779855014612'),
                          const SizedBox(height: 10),
                          _buildInfoRow(
                              Icons.location_on, 'Location', 'Kathmandu'),
                          const SizedBox(height: 10),
                          _buildInfoRow(Icons.access_time, 'Working Hours',
                              'Mon - Fri: 9 AM - 6 PM'),
                          Divider(
                            height: 30,
                            color: Primary,
                            thickness: 1.5,
                          ),
                          _buildInfoSection('Mission',
                              'Our mission is to improve the health and well-being of the communities we serve through excellence in medical care, research, and education.'),
                          const SizedBox(height: 20),
                          _buildInfoSection('Vision',
                              'To be the leading healthcare provider in the region, known for our innovative approach to patient care and our commitment to the community.'),
                          const SizedBox(height: 20),
                          _buildInfoSection('Values',
                              'Compassion, Excellence, Integrity, Respect, Innovation'),
                        ],
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

  Widget _buildInfoRow(IconData icon, String title, String content) {
    return Row(
      children: [
        Icon(icon, color: Primary),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Primary,
                ),
              ),
              Text(
                content,
                style: const TextStyle(fontSize: 16, color: Colors.black87),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInfoSection(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Primary,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          content,
          style: const TextStyle(
            fontSize: 16,
            height: 1.5,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
