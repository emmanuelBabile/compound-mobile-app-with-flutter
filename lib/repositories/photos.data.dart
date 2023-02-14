import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:projet1/models/photos.state.dart';

Future<List<Photos>> getPhotos(String motCle, int indicePage) async{
  final Uri url = Uri.parse('https://api.unsplash.com/search/photos/?client_id=VqS6C1PBW0mCE5wR24cMBTIjT-GXnxfV1DK8Icn3Gqk&page='+indicePage.toString()+'&query='+motCle);
  final response = await http.get(url);
  if(response.statusCode==200){
    var tab = json.decode(response.body)['results'];
    return [...tab.map((e) => Photos.fromJson(e))];
  }else{
    throw Exception("Erreur");
  }
}