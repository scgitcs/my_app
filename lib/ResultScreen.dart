import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen(this.result, );
  var result;
  final databaseref = FirebaseDatabase.instance.ref('All_Chassis');
  var machine;
  var text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "QR Scanner",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text('Scanner Result',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),),
            SizedBox(
              height: 10,
            ),
            Text('RESULT: $result',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 16,
                letterSpacing: 1,
              ),),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              child: Expanded(
                child: FirebaseAnimatedList(
                    query: databaseref
                        .orderByKey()
                        .equalTo('$result'),
                    // defaultChild: Text('Loading'),
                    itemBuilder: (context, snapshot, animation, index){
                      machine = snapshot.key.toString();


                      return SizedBox(
                        // height: 100,
                        // color: Colors.amberAccent,SingleChildScrollView
                          child: (result != machine) ? Text('The Machine Number is invalid.') : Text('The Machine Number is Valid.'),
                      ) ;
                    }),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width-100,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue
                ),
                  onPressed: () {},
                  child: Text('Copy',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),),
              ),
            )
          ],
        ),
      ),
    );
  }
}