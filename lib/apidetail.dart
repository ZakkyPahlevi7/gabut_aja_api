// INI BUAT DETAIL YANG MEMANGGIL APO

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latihanapi/home.dart';

class DetailPAGE extends StatefulWidget {
  final String strleague;
  DetailPAGE({super.key, required this.strleague});

  @override
  State<DetailPAGE> createState() => _DetailPAGEState();
}

class _DetailPAGEState extends State<DetailPAGE> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                child: Center(
                  child: ListTile(
                    leading: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      },
                      child: Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        child: Icon(
                          Icons.home,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    title: Text(widget.strleague),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
