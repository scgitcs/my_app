import 'package:flutter/material.dart';
import 'package:my_app/ScanQR.dart';

class AddMachine extends StatefulWidget {
  // var result;
  //
  // AddMachine(this.result);

  @override
  State<AddMachine> createState() {
    return _AddMachineState();
  }
}

class _AddMachineState extends State<AddMachine> {
  var Machine = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Add Machine'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Text('Here You Can Add Your Machine.',style: TextStyle(fontSize: 20),),
            SizedBox(height: 30,),
            Text('You Can Add Your Machine as manually or',style: TextStyle(fontSize: 16),),
            Text("scan your Machine's QR Code",style: TextStyle(fontSize: 16),),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
              child: TextFormField(
                controller: Machine,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter Chassis Id',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                        width: 2,
                      ),
                    ),
                    prefixIcon: Icon(Icons.create, color: Colors.deepPurple),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Reenter the Chassis Id',
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.green,
                      width: 2,
                    ),
                  ),
                  prefixIcon: Icon(Icons.create, color: Colors.deepPurple),
                ),
              ),
            ),
            // Checkbox(
            //   side: const BorderSide(
            //     // set border color here
            //     color: Colors.red,
            //   ),
            //   // value: isChecked,
            //   onChanged: (bool? value) {},
            // ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 100),
                child: Row(
                  children: [
                    ElevatedButton(onPressed: (){


                    }, child: Text(
                        'Add Machine'
                    )),
          ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ScanQR();
              } ,));
                      // setState(() {
                      //   Machine = widget.result;
                      // });
                      }, child: Text(
                          'Scan QR Code'
                      )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}