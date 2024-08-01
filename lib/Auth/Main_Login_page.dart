import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:tezhealthcare/Auth/Login_Page.dart';
import 'package:tezhealthcare/Constant/Color.dart';
import 'package:tezhealthcare/Constant/Mediaquery.dart';

class MainLoginPage extends StatefulWidget {
  const MainLoginPage({super.key});

  @override
  State<MainLoginPage> createState() => _MainLoginPageState();
}

class _MainLoginPageState extends State<MainLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Primary,
      body: SafeArea(
        child: DefaultTabController(
          length: 1,
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ButtonsTabBar(
                  height: 50,
                  backgroundColor: Secondary,
                  labelStyle: const TextStyle(
                      wordSpacing: 5,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  tabs: [
                    Tab(
                      child: InkWell(
                        child: Container(
                          width: width / 1.2,
                          child: Center(
                            child: const Text(
                              "OPD Ticket",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  LoginPage(),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 5,
                ),
                child: Text(
                  '©${DateTime.now().year} Tez Health Care. All Right Reserved',
                  style: TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.bold,
                      color: Secondary),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
