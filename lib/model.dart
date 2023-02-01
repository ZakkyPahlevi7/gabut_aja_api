// To parse this JSON data, do
//
//     final sportmobile = sportmobileFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators

import 'package:meta/meta.dart';
import 'dart:convert';

Sportmobile sportmobileFromJson(String str) =>
    Sportmobile.fromJson(json.decode(str));

String sportmobileToJson(Sportmobile data) => json.encode(data.toJson());

class Sportmobile {
  Sportmobile({
    required this.leagues,
  });

  List<League> leagues;

  factory Sportmobile.fromJson(Map<String, dynamic> json) => Sportmobile(
        leagues:
            List<League>.from(json["leagues"].map((x) => League.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "leagues": List<dynamic>.from(leagues.map((x) => x.toJson())),
      };
}

class League {
  League({
    required this.idLeague,
    required this.strLeague,
    required this.strSport,
    required this.strLeagueAlternate,
  });

  String idLeague;
  String strLeague;
  String strSport;
  String strLeagueAlternate;

  factory League.fromJson(Map<String, dynamic> json) => League(
        idLeague: json["idLeague"],
        strLeague: json["strLeague"],
        strSport: json["strSport"],
        strLeagueAlternate: json["strLeagueAlternate"] == null
            ? ''
            : json["strLeagueAlternate"],
      );

  Map<String, dynamic> toJson() => {
        "idLeague": idLeague,
        "strLeague": strLeague,
        "strSport": strSport,
        "strLeagueAlternate":
            strLeagueAlternate == null ? '' : strLeagueAlternate,
      };
}
