// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:nba_app/pages/PlayersPage.dart';
import 'package:nba_app/pages/mainPage.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 227, 220, 240),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 100),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                ),
              ),
              child: Text(
                "Your NBA Teams And Players",
                textAlign: TextAlign.center,
                style: GoogleFonts.nerkoOne(
                  fontSize: 54,
                  color: Colors.grey.shade900,
                  fontWeight: FontWeight.normal,
                ),
              ),
            )),
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                  ),
                ),
                child: LottieBuilder.asset("lib/image/basketball.json"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return mainPage();
                          },
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(13),
                      decoration: BoxDecoration(
                          color: Colors.deepPurple.shade100,
                          borderRadius: BorderRadius.circular(16)),
                      child: Row(
                        children: [
                          Text(
                            "Next",
                            style: GoogleFonts.rubik(
                                fontSize: 22, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 27,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
