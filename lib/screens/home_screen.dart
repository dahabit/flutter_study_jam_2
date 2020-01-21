import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:studyjam5/models/photo.dart';
import 'package:studyjam5/widgets/menu.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> myList = [];
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text('Home Screen title'),
      ),
      body: Center(
        child: myList.length > 0
            ? Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: ListView.builder(
                  itemCount: myList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _buildMyList(myList[index]);
                  },
                ),
              )
            : CircularProgressIndicator(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _addPhoto(),
      ),
    );
  }

  Widget _buildMyList(String img) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: Card(
        elevation: 5,
        child: Image.network(img),
      ),
    );
  }

  _addPhoto() async {
    final num = Random().nextInt(1000);
    final response =
        await http.get('http://jsonplaceholder.typicode.com/photos/$num');
    final parsedResponse = jsonDecode(response.body);
    final photo = Photo(
      id: parsedResponse['id'],
      albumId: parsedResponse['albumId'],
      title: parsedResponse['title'],
      url: parsedResponse['url'],
      thumbnailUrl: parsedResponse['thumbnailUrl'],
    );

    print(photo.url);
    setState(() {
      myList.add(photo.url);
    });
  }
}
