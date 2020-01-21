import 'package:flutter/material.dart';

import 'my_menu_items.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: Container(
        color: Theme.of(context).primaryColor,
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountEmail: Text('Dahabit@gmail.com'),
              accountName: Text('Ahmed Abu Eldahab'),
              currentAccountPicture: Image.asset('assets/images/ahmed.png'),
            ),
            SizedBox(
              height: 5,
            ),
            Divider(
              color: Colors.white,
            ),
            MyMenuItems(),
          ],
        ),
      ),
    );
  }
}
