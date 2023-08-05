import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:nba_app/class/Players.dart';
import 'package:nba_app/class/Teams.dart';

class playersPage extends StatelessWidget {
  playersPage({super.key});

  List<Players> players = [];
  Future getPlayer() async {
    var reponse = await http.get(Uri.https("balldontlie.io", "api/v1/players"));
    var jsonData = jsonDecode(reponse.body);

    for (var eachPlayer in jsonData['data']) {
      var player = Players(
          firstName: eachPlayer["first_name"],
          lastName: eachPlayer["last_name"],
          teamsName: eachPlayer["team"]["name"]);
      players.add(player);
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: FutureBuilder(
        future: getPlayer(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return SafeArea(
              child: Column(
                children: [
                  SizedBox(height: height * 0.02),
                  Row(
                    children: [
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14.0),
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13),
                            color: Colors.deepPurple.shade400,
                          ),
                          child: Center(
                            child: Text(
                              "Players Page",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.rubik(
                                fontSize: 39,
                              ),
                            ),
                          ),
                        ),
                      ))
                    ],
                  ),
                  SizedBox(height: height * 0.02),
                  Expanded(
                    child: Container(
                      width: double.maxFinite,
                      child: ListView.builder(
                        itemCount: players.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              padding: const EdgeInsets.all(13),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13),
                                color: Colors.grey.shade200,
                              ),
                              child: ListTile(
                                title: Text(
                                  players[index].firstName +
                                      " " +
                                      players[index].lastName,
                                  style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.blueGrey),
                                ),
                                subtitle: Text(
                                  players[index].teamsName,
                                  style: const TextStyle(
                                      fontSize: 18, color: Colors.blueGrey),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
