import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CompPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(

      ),
        body: Column(
          children: [
            Container(
                child: Text('Compressure Status',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500),)
            ),
            Image(image:  new AssetImage("assets/images/mstatus.png")),

          ],
        ),
    );
  }

}