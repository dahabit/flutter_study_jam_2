import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:studyjam5/models/photo.dart';
import 'package:studyjam5/models/photo_list.dart';
import 'package:studyjam5/widgets/menu.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text('Second Screen title'),
      ),
      body: Center(
        child: FutureBuilder(
          future: fetchPhotos(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return Center(
              child: snapshot.hasData
                  ? PhotoList(photos: snapshot.data)
                  : CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}

Future<List<Photo>> fetchPhotos() async {
  final response = await http.get('http://jsonplaceholder.typicode.com/photos');
  final reponseBody = response.body;

  return compute(parsePhoto, reponseBody);
}

List<Photo> parsePhoto(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
}
