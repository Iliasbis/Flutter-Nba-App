import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:nba_app/class/Teams.dart';

class TeamsPage extends StatelessWidget {
  TeamsPage({super.key});

  List<Team> teams = [];
  Future getTeams() async {
    var reponse = await http.get(Uri.https("balldontlie.io", "api/v1/teams"));
    var jsonData = jsonDecode(reponse.body);

    for (var eachTeam in jsonData['data']) {
      var team = Team(
          abbreviation: eachTeam["abbreviation"],
          city: eachTeam["city"],
          name: eachTeam["name"]);
      teams.add(team);
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: FutureBuilder(
        future: getTeams(),
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
                              "Teams Page",
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
                        itemCount: teams.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              padding: const EdgeInsets.all(13),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13),
                                color: Colors.deepPurple.shade50,
                              ),
                              child: ListTile(
                                title: Text(
                                  teams[index].name,
                                  style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.blueGrey),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      teams[index].city,
                                      style: const TextStyle(
                                          fontSize: 18, color: Colors.blueGrey),
                                    ),
                                    Text(
                                      teams[index].abbreviation,
                                      style: const TextStyle(
                                          fontSize: 18, color: Colors.blueGrey),
                                    ),
                                  ],
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
