// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:nba_app/pages/PlayersPage.dart';
import 'package:nba_app/pages/TeamsPage.dart';

class mainPage extends StatefulWidget {
  const mainPage({super.key});

  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  int selectedIndex = 0;
  List<Widget> pages = [
    TeamsPage(),
    playersPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.deepPurple.shade100,
                  ),
                  child: BottomNavigationBar(
                    currentIndex: selectedIndex,
                    onTap: ((value) {
                      setState(() {
                        selectedIndex = value;
                      });
                    }),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    showSelectedLabels: true,
                    showUnselectedLabels: false,
                    unselectedItemColor: Colors.grey.shade700,
                    selectedItemColor: Colors.deepPurple,
                    selectedLabelStyle: TextStyle(
                        fontSize: 20, color: Colors.deepPurple.shade600),
                    items: [
                      BottomNavigationBarItem(
                          icon: Icon(
                            Icons.sports_basketball_outlined,
                            size: 32,
                          ),
                          label: "Teams"),
                      BottomNavigationBarItem(
                        icon: Icon(
                          Icons.person_outline,
                          size: 32,
                        ),
                        label: "Players",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: pages[selectedIndex],
    );
  }
}
