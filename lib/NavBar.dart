import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AddMachine.dart';
import 'HomePage.dart';

class NavBar extends StatelessWidget{
  const NavBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
              accountName: Text('name',style: TextStyle(color: Colors.black,fontSize: 20),),
              accountEmail: Text('email',style: TextStyle(color: Colors.black,fontSize: 18),),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.deepPurpleAccent,
              child: ClipOval(child: Text('S',style: TextStyle(color: Colors.black),),),
            ),
            decoration: BoxDecoration(
              color: Colors.white10,
              // image: DecorationImage(image: AssetImage('assets/images/img.png'), fit: BoxFit.cover),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person_rounded),
            title: Text('Profile'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.add),
            title: Text('Add Machine'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return AddMachine();
              } ,));
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {},
          )
        ],
      ),
    );
  }

}