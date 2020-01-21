import 'package:flutter/material.dart';
import 'package:studyjam5/widgets/menu.dart';

class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text('Third Screen title'),
      ),
      body: Center(
        child: Text('Third Screen'),
      ),
    );
  }
}
