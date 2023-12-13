
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/bottom_navigation_bar.dart';
import 'package:my_app/waterPage.dart';
import 'CompPage.dart';
import 'DewPoint.dart';
import 'MachineInfo.dart';
import 'main.dart';

// class MachinePage extends StatelessWidget {
//   var machine;
//   var nickname;
//   var Version;
//   var Comp;
//   var Comp_Status;
//   var arh;
//   var adp;
//   var temp;
//   var status;
//   MachinePage(
//       this.machine,
//       this.nickname,
//       );
//   var machine_id;
//   bool loading = false;
//   // final databaseref = FirebaseDatabase.instance.ref('All_Chassis');
//   Widget build(BuildContext context){
//     // var Comp1 = Comp();
//     return Scaffold(
//       backgroundColor: Colors.blueGrey,
//       appBar: AppBar(
//           backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//           title: Text('Machine Status'),
//           actions: <Widget>[
//             IconButton(
//               icon: Icon(
//                 Icons.logout,
//                 color: Colors.white,
//               ),
//               onPressed: () {
//                 Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => MyHomePage(title: 'Flutter Demo Home Page',))
//                 );
//               },
//             )
//           ]
//       ),
//       body: Center(
//           child: Column(
//             children: [
//               Text("Machine Id :  $machine", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700,)),
//               Text("Nick Name : $nickname", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700,)),
//               Image(image:  new AssetImage("assets/images/mstatus.png")),
//             ],
//           // ),
//         ),
//       )
//       // Column(
//       //   children: [
//       //     Container(
//       //         decoration: new BoxDecoration(
//       //           image: new DecorationImage(image: new AssetImage("assets/images/b1.png"), fit: BoxFit.cover,),
//       //         ),
//       //         child: Padding(
//       //           padding: const EdgeInsets.only(left:26.0,top:60.0,right:25.0,bottom: 20.0),
//       //           child: Text("Machine Number: $machine", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700,color: Colors.indigo[600],)),
//       //         )
//       //     ),
//       //     Expanded(
//       //       // flex: 2,
//       //         child: FirebaseAnimatedList(
//       //         query: FirebaseDatabase.instance
//       //             .ref('All_Chassis')
//       //             .orderByKey()
//       //         .equalTo('$machine'),
//       //         defaultChild: Text('Loading'),
//       //         itemBuilder: (context, snapshot, animation, index){
//       //             // color: Colors.amberAccent,
//       //           machine_id = snapshot.child('Board_id').value.toString();
//       //               return Container(
//       //
//       //                 decoration: new BoxDecoration(
//       //                   image: new DecorationImage(image: new AssetImage("assets/images/b2.png"), fit: BoxFit.cover,),
//       //                 ),
//       //                 child: Column(
//       //                   children: [
//       //                     Text("Board Id :  $machine_id", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700,)),
//       //                     Text("Nick Name : " + snapshot.child('NickName').value.toString(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700,)),
//       //                   ],
//       //
//       //                 ),
//       //               );
//       //         })
//       //     ),
//       //     Expanded(
//       //       flex: 10,
//       //         child: FirebaseAnimatedList(
//       //         query: FirebaseDatabase.instance
//       //             .ref('All_machines/Generator')
//       //             .orderByChild('Chassis_Id')
//       //             .equalTo('$machine'),
//       //         defaultChild: Text('Loading'),
//       //         itemBuilder: (context, snapshot, animation, index){
//       //           // color: Colors.amberAccent,
//       //           Version = snapshot.child('BoardID').value.toString();
//       //           Comp = snapshot.child('comp').value.toString();
//       //           // if(Comp == 3){
//       //           //   return "OFF-Lp/Hp Triped";
//       //           // }
//       //           // if(Comp == 0){
//       //           //   return('OFF');
//       //           // }
//       //           if(Comp == 0){
//       //             Comp_Status = 9;
//       //           }
//       //           arh = snapshot.child('ambRH').value.toString();
//       //           adp = snapshot.child('ambDP').value.toString();
//       //           temp = snapshot.child('ambT').value.toString();
//       //           status = snapshot.child('status').value.toString();
//       //           return Column(
//       //               children: [
//       //               Text("Version :  $Version", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700,)),
//       //               Row(
//       //                 children: [
//       //                   Padding(
//       //                     padding: const EdgeInsets.all(8.0),
//       //                     child: InkWell(
//       //                       onTap: () {
//       //                         // Navigator.push(context, MaterialPageRoute(builder: (context) {
//       //                         //   return MachinePage(snapshot.key.toString());
//       //                         // } ,));
//       //                       }, // Handle your callback
//       //                       child: Ink(
//       //                         width: 180.0,
//       //                         height: 150.0,
//       //                         color: Colors.blue,
//       //                         padding: EdgeInsets.all(15),
//       //
//       //                         // margin: EdgeInsets.all(20),
//       //                         // alignment: Alignment.bottomRight,
//       //                         child: Column(
//       //                           children: [
//       //                             Row(
//       //                               children: [
//       //                                 CircleAvatar(
//       //                                   // radius: 56, //radius of avatar
//       //                                   // backgroundColor: Colors.green, //color
//       //                                   // child: Padding(
//       //                                   //   padding: const EdgeInsets.all(8), // Border radius
//       //                                   child: ClipOval(child:
//       //                                   Image.asset('assets/images/mstatus.png',
//       //                                     width: 100,
//       //                                     height: 100,
//       //                                   ),),
//       //                                   // ),
//       //                                 ),
//       //
//       //                                 Padding(
//       //                                   padding: const EdgeInsets.only(left: 55.0),
//       //                                   child: Text("$status", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700,)),
//       //                                 ),
//       //                               ],
//       //                             ),
//       //                             Column(
//       //                               children: [
//       //                                 Padding(
//       //                                   padding: const EdgeInsets.only(top: 14.0),
//       //                                   child: Text("Machine", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700,)),
//       //                                 ),
//       //
//       //                                 Text("Status", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700,)),
//       //
//       //                                 Text("For More Details click the box.*", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700,)),
//       //                               ],
//       //                             ),
//       //                           ],
//       //                         ),
//       //                       ),
//       //                     ),
//       //                   ),
//       //                   Padding(
//       //                     padding: const EdgeInsets.all(8.0),
//       //                     child: InkWell(
//       //                       onTap: () {
//       //                         Navigator.push(context, MaterialPageRoute(builder: (context) {
//       //                           return CompPage();
//       //                         } ,));
//       //                       }, // Handle your callback
//       //                       child: Ink(
//       //                         width: 180.0,
//       //                         height: 150.0,
//       //                         color: Colors.blue,
//       //                         padding: EdgeInsets.all(15),
//       //
//       //                         // margin: EdgeInsets.all(20),
//       //                         // alignment: Alignment.bottomRight,
//       //                         child: Column(
//       //                           children: [
//       //                             Row(
//       //                               children: [
//       //                                 CircleAvatar(
//       //                                   // radius: 56, //radius of avatar
//       //                                   // backgroundColor: Colors.green, //color
//       //                                   // child: Padding(
//       //                                   //   padding: const EdgeInsets.all(8), // Border radius
//       //                                   child: ClipOval(child:
//       //                                   Image.asset('assets/images/comp.png',
//       //                                     width: 100,
//       //                                     height: 100,
//       //                                   ),),
//       //                                   // ),
//       //                                 ),
//       //
//       //                                 Padding(
//       //                                   padding: const EdgeInsets.only(left: 80.0),
//       //                                   child: Text("$Comp", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700,)),
//       //                                 ),
//       //                               ],
//       //                             ),
//       //                             Column(
//       //                               children: [
//       //                                 Padding(
//       //                                   padding: const EdgeInsets.only(top: 14.0),
//       //                                   child: Text("Compressure", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700,)),
//       //                                 ),
//       //
//       //                                 Text("Status", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700,)),
//       //
//       //                                 Text("For More Details click the box.*", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700,)),
//       //                               ],
//       //                             ),
//       //                           ],
//       //                         ),
//       //                       ),
//       //                     ),
//       //                   ),
//       //
//       //                   // Padding(
//       //                   //   padding: const EdgeInsets.all(8.0),
//       //                   //   child: Container(
//       //                   //     height: 150,
//       //                   //     color: Colors.blue[200],
//       //                   //
//       //                   //     child: Padding(
//       //                   //       padding: const EdgeInsets.only(left:45.0,top:8.0,right:45.0,bottom: 8.0),
//       //                   //       child: Column(
//       //                   //         children: [
//       //                   //           Text("Dew Point:",style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500,color: Colors.indigo,),),
//       //                   //           Padding(
//       //                   //             padding: const EdgeInsets.all(8.0),
//       //                   //             child:
//       //                   //             // Comp == 2?
//       //                   //             // Text("OFF"):Text("OFF-Lp/Hp Triped")
//       //                   //             Text("$Comp",style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700,color: Colors.indigo,),),
//       //                   //           ),
//       //                   //         ],
//       //                   //       ),
//       //                   //     ),
//       //                   //   ),
//       //                   // ),
//       //                 ],
//       //               ),
//       //                 Row(
//       //                   children: [
//       //                     Padding(
//       //                       padding: const EdgeInsets.all(8.0),
//       //                       child: InkWell(
//       //                         onTap: () {
//       //                           // Navigator.push(context, MaterialPageRoute(builder: (context) {
//       //                           //   return MachinePage(snapshot.key.toString());
//       //                           // } ,));
//       //                         }, // Handle your callback
//       //                         child: Ink(
//       //                           width: 180.0,
//       //                           height: 150.0,
//       //                           color: Colors.blue,
//       //                           padding: EdgeInsets.all(15),
//       //
//       //                           // margin: EdgeInsets.all(20),
//       //                           // alignment: Alignment.bottomRight,
//       //                           child: Column(
//       //                             children: [
//       //                               Row(
//       //                                 children: [
//       //                                   CircleAvatar(
//       //                                     // radius: 56, //radius of avatar
//       //                                     // backgroundColor: Colors.green, //color
//       //                                     // child: Padding(
//       //                                     //   padding: const EdgeInsets.all(8), // Border radius
//       //                                     child: ClipOval(child:
//       //                                     Image.asset('assets/images/dew.png',
//       //                                       width: 100,
//       //                                       height: 100,
//       //                                     ),),
//       //                                     // ),
//       //                                   ),
//       //
//       //                                   Padding(
//       //                                     padding: const EdgeInsets.only(left: 55.0),
//       //                                     child: Text("$adp", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700,)),
//       //                                   ),
//       //                                 ],
//       //                               ),
//       //                               Column(
//       //                                 children: [
//       //                                   Padding(
//       //                                     padding: const EdgeInsets.only(top: 14.0),
//       //                                     child: Text("Dew", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700,)),
//       //                                   ),
//       //
//       //                                   Text("Point", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700,)),
//       //
//       //                                   Text("For More Details click the box.*", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700,)),
//       //                                 ],
//       //                               ),
//       //                             ],
//       //                           ),
//       //                         ),
//       //                       ),
//       //                     ),
//       //                     Padding(
//       //                       padding: const EdgeInsets.all(8.0),
//       //                       child: InkWell(
//       //                         onTap: () {
//       //                           // Navigator.push(context, MaterialPageRoute(builder: (context) {
//       //                           //   return MachinePage(snapshot.key.toString());
//       //                           // } ,));
//       //                         }, // Handle your callback
//       //                         child: Ink(
//       //                           width: 180.0,
//       //                           height: 150.0,
//       //                           color: Colors.blue,
//       //                           padding: EdgeInsets.all(15),
//       //
//       //                           // margin: EdgeInsets.all(20),
//       //                           // alignment: Alignment.bottomRight,
//       //                           child: Column(
//       //                             children: [
//       //                               Row(
//       //                                 children: [
//       //                                   CircleAvatar(
//       //                                     // radius: 56, //radius of avatar
//       //                                     // backgroundColor: Colors.green, //color
//       //                                     // child: Padding(
//       //                                     //   padding: const EdgeInsets.all(8), // Border radius
//       //                                     child: ClipOval(child:
//       //                                     Image.asset('assets/images/awg.png',
//       //                                       width: 100,
//       //                                       height: 100,
//       //                                     ),),
//       //                                     // ),
//       //                                   ),
//       //
//       //                                   Padding(
//       //                                     padding: const EdgeInsets.only(left: 55.0),
//       //                                     child: Text("$adp", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700,)),
//       //                                   ),
//       //                                 ],
//       //                               ),
//       //                               Column(
//       //                                 children: [
//       //                                   Padding(
//       //                                     padding: const EdgeInsets.only(top: 14.0),
//       //                                     child: Text("AWG Run", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700,)),
//       //                                   ),
//       //
//       //                                   Text("Time", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700,)),
//       //
//       //                                   Text("For More Details click the box.*", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700,)),
//       //                                 ],
//       //                               ),
//       //                             ],
//       //                           ),
//       //                         ),
//       //                       ),
//       //                     ),
//       //                   ],
//       //                 ),
//       //                 // Container(
//       //                 //   width: 200.0,
//       //                 //   height: 100.0,
//       //                 //   color: Colors.green,
//       //                 //   padding: EdgeInsets.all(35),
//       //                 //   margin: EdgeInsets.all(20),
//       //                 //   alignment: Alignment.bottomRight,
//       //                 //   child: Text("Hello! I am in the container widget", style: TextStyle(fontSize: 25)),
//       //                 // ),
//       //
//       //               // Text("Relative Humidity:  $arh"),
//       //               // Text("Tempareture:  $temp"),
//       //               // Text("Dew Point:  $adp"),
//       //               ]
//       //           );
//       //         })
//       //     ),
//       //   ],
//       // ),
//     );
//   }
// }
class MachineStatusPage extends StatelessWidget {
  const MachineStatusPage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MachinePage(
        // machine: 0011,
        // nickname: "Home"
      // home: Nav(),
      // Intropage(),
      // const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
class MachinePage extends StatefulWidget {
  // const MachinePage({super.key});
  var machine;
  var nickname;
  MachinePage({Key? mykey, this.machine, this.nickname}) : super(key: mykey);
  @override
  State<MachinePage> createState() {
    return _MachinePageState();
  }

}
class _MachinePageState extends State<MachinePage> {
  // var machine;
  // var nickname;
  var Version;
  var Comp;
  var Comp_Status;
  var arh;
  var adp;
  var temp;
  var status;
    // _MachinePageState(
    //   this.machine,
    //   this.nickname,
    //   );
  // int myCurrentIndex = 0;
  // List pages = [
  //   MachineStatusPage(),
  //   WaterGenaratePage(),
  //   DewPoinPage(),
  //   MachineInformationPage(),
  //   // MachinePage(),
  //   // WaterPage(),
  //   // DewPoint(),
  //   // MachineInfo(),
  // ];
  var machine_id;
  bool loading = false;
  // final databaseref = FirebaseDatabase.instance.ref('All_Chassis');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(220, 50, 99, 125),
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text('Machine Status'),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyHomePage(title: 'Flutter Demo Home Page',))
                );
              },
            )
          ]
      ),
      // bottomNavigationBar: Nav(),
      body: Column(
        children: [
          Container(
              child: Center(
                child: Column(
                  children: [
                    // SizedBox(height: 40,),
                    Text("Machine Id :  ${widget.machine}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700,color: Colors.white, )),
                    // SizedBox(height: 10,),
                    Text("Nick Name : ${widget.nickname}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700,color: Colors.white,)),
                    // Image(image:  new AssetImage("assets/images/mstatus.png")),
                    // SizedBox(height: 80,),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('ON', style: TextStyle(color: Colors.white, fontSize: 20,)),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(80),
                        backgroundColor: Colors.blue, // <-- Button color
                        foregroundColor: Colors.red, // <-- Splash color
                      ),
                    ),

                  ],
                  // ),
                ),
              ),
            ),
          // Nav(),
        ],
      ),
      // bottomNavigationBar: Nav(),
      //   ),
      // ),
    );
  }

}
void Comp(){
  String comp;
  if(Comp == 0){
    comp = "off";
  }
  // setStatus(());
}
