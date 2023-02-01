import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:latihanapi/urlconfig.dart';

import 'model.dart';





class jeneretepiei {
  Future<Sportmobile> getapi () async{
    final rest = await http.get(Uri.parse(UrlConfig.besturl));
    if(rest.statusCode == 200){
      return Sportmobile.fromJson(jsonDecode(rest.body));
    } else {
      print(rest.statusCode);
      throw HttpException('ERROR COK');
    }
  }
}