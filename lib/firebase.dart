import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:my_app/HomePage.dart';

import 'data.dart';
class Firebase extends StatelessWidget{
   Firebase( this.status, this.homepage, {super.key});
  // final Data data;
  final HomePage homepage;
  final databaseref = FirebaseDatabase.instance.ref('All_machines/Generator');
  var boardid;
  late final String status;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
          child: FirebaseAnimatedList(
              query: databaseref
                  .orderByChild('Chassis_Id')
                  .equalTo('$homepage.array'),
              defaultChild: Text('Loading'),
              itemBuilder: (context, snapshot, animation, index){
                boardid = [snapshot.key.toString()];
                status = snapshot.child('status').value.toString();
                return SizedBox(
                  // height: 100,
                  // color: Colors.amberAccent,SingleChildScrollView

                ) ;
              })
      ),
    );
  }

}
