// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:latihanapi/apidetail.dart';
import 'package:latihanapi/jeneretepiai.dart';
import 'package:latihanapi/model.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isloading = false;
  List<League> terserah = [];

  Future getApi() async {
    setState(() {
      isloading = true;
    });
    Sportmobile apa = await jeneretepiei().getapi();
    setState(() {
      terserah = apa.leagues;
      isloading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getApi();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: isloading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: terserah.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailPAGE(
                                  strleague: terserah[index].strLeague)));
                    },
                    child: Card(
                      child: ListTile(
                        title: Text(
                          terserah[index].strSport,
                          style: GoogleFonts.poppins(),
                        ),
                        subtitle: Text(
                          terserah[index].strLeagueAlternate,
                          style: GoogleFonts.poppins(),
                        ),
                        trailing: Text(terserah[index].idLeague),
                        leading: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.yellow,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          child: Icon(
                            Icons.sports_soccer,
                            size: 32,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  );
                  // return Card(
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Row(
                  //         children: [
                  //           Container(
                  //               decoration: BoxDecoration(
                  //                   color: Colors.yellow,
                  //                   borderRadius:
                  //                       BorderRadius.all(Radius.circular(8))),
                  //               margin: EdgeInsets.all(8),
                  //               padding: EdgeInsets.all(8),
                  //               child: Icon(Icons.sports_soccer)),
                  //           Column(
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             children: [
                  //               Row(
                  //                 children: [
                  //                   Text(
                  //                     terserah[index].strSport,
                  //                     style: GoogleFonts.poppins(
                  //                         fontSize: 14,
                  //                         fontWeight: FontWeight.w600),
                  //                   ),
                  //                   SizedBox(
                  //                     width: 210,
                  //                   ),
                  //                   Text(
                  //                     terserah[index].idLeague,
                  //                     style: GoogleFonts.poppins(
                  //                       fontSize: 10,
                  //                     ),
                  //                   ),
                  //                 ],
                  //               ),
                  //               Text(
                  //                 terserah[index].strLeagueAlternate,
                  //                 style: GoogleFonts.poppins(
                  //                     fontSize: 12,
                  //                     fontWeight: FontWeight.w400,
                  //                     letterSpacing: 0.8),
                  //               ),
                  //             ],
                  //           ),
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // );
                },
              ),
      ),
    );
  }
}
