import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_app/AddMachine.dart';
import 'package:my_app/MachinePage.dart';
import 'package:my_app/NavBar.dart';
import 'package:my_app/main.dart';

import 'firebase.dart';

class HomePage extends StatelessWidget {
  // var password;
  HomePage(
      this.email,
      // this.password
      );
  var email;
  bool loading = false;
  final databaseref = FirebaseDatabase.instance.ref('All_Chassis');
  var array ;
  var array1;
  static const List<bool> _usaStatesSelected = [];
  int? _selectedIndex;
  // void _openAddExpenseOverLay () {
  //   showModalBottomSheet(
  //     isScrollControlled: true,
  //     context: context,
  //     builder: (ctx) => NewMachine(onAddExpense: _addMachine),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Your Register Machine'),
          actions: <Widget>[
            // IconButton(
            //   icon: Icon(
            //     Icons.logout,
            //     color: Colors.white,
            //   ),
            //   onPressed: () async{
            //     await GoogleSignIn().signOut();
            //     FirebaseAuth.instance.signOut();
            //     FacebookAuth.instance.logOut();
            //     Navigator.pushReplacement(context, MaterialPageRoute(
            //         builder: (context) => MyHomePage(title: 'Flutter Demo Home Page',))
            //     );
            //     // Navigator.pushReplacement(
            //     //     context,
            //     //     MaterialPageRoute(
            //     //         builder: (context) => MyHomePage(title: 'Flutter Demo Home Page',))
            //     // );
            //   },
            // )
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return AddMachine();
                  } ,));
                },
                icon: Icon(Icons.add))
          ]
      ),
      body: ListView(
        // scrollDirection: Axis.horizontal,
        children: [
        //   Text('Your Register PhoneNumber is:', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700,color: Colors.indigo,),),
        //   Row(
        //   children: [
        //     Container(
        //       child: Row(
        //         children: [
        //           Image.asset('assets/images/user.png',
        //                     width: 70,
        //                     height: 70,),
        //         ],
        //       ),
        //     ),
        //       Container(
        //         child: Column(
        //           children: [
        //             Row(
        //               children: [
        //                 Text("Email:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700,color: Colors.indigo,),),
        //                 Text("$email", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700,),),
        //               ],
        //             ),
        //
        //             // Row(
        //             //   children: [
        //             //     Text("Password:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700,color: Colors.indigo,),),
        //             //     Text("$password", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700,),),
        //             //   ],
        //             // ),
        //           ],
        //         ),
        //       ),
        //   ],
        // ),

          // Text('Hello! $email', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700,color: Colors.indigo,),),
          // Text('Welcome back to home', style: TextStyle( fontWeight: FontWeight.w700,color: Colors.indigo,),),
          // TextButton.icon(onPressed: null, icon: Icon., label: Text('Add Machine')),
        // ElevatedButton(
        //     style: ElevatedButton.styleFrom(
        //       primary: Colors.blueGrey,
        //       onPrimary: Colors.white,
        //       shadowColor: Colors.blueGrey,
        //       elevation: 3,
        //       shape: RoundedRectangleBorder(
        //           borderRadius: BorderRadius.circular(32.0)),
        //       //////// HERE
        //     ),
        //     onPressed: () {},
        //     child: Text('Add Machine'),
    // ),
    //       Text('Your Register Machine:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700,color: Colors.indigo,),),
          Container(
            height: 650,
            width: 50,
            child: Row(
              children: [
                Expanded(
                    child:
                    FirebaseAnimatedList(
                    query: databaseref
                        .orderByChild('email')
                        .equalTo('$email'),
                    defaultChild: Text('Loading'),
                    itemBuilder: (context, snapshot, animation, index){
                      array = snapshot.key.toString();
                      array1 = snapshot.child('NickName').value.toString();

                  return SizedBox(
                    // height: 100,
                    // color: Colors.amberAccent,SingleChildScrollView
                      child: SingleChildScrollView(
                        child: Card(
                          child: ListTile(
                            title: Text(array),
                            subtitle: Text('Nickname: '+array1),
                            leading: CircleAvatar(
                              backgroundColor: const Color(0xff764abc),
                              child: Text('M', style: TextStyle(color: Colors.white),),
                            ),
                              // trailing: _getApplicableIcon(),

                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return MachinePage(machine: snapshot.key.toString(), nickname: snapshot.child('NickName').value.toString());
                              } ,));
                            },
                          ),

                        ),
                      )
                  ) ;
                 })
                ),
                // Expanded(
                //     child: StreamBuilder(
                //       stream: databaseref.onValue,
                //         builder: (context, AsyncSnapshot<DatabaseEvent>snapshot){
                //           if(!snapshot.hasData){
                //             return CircularProgressIndicator();
                //           }else{
                //             Map<dynamic, dynamic> map = snapshot.data!.snapshot.value as dynamic ;
                //             List<dynamic>list =[] ;
                //             list = map.values.toList();
                //             list.clear();
                //             return ListView.builder(
                //                 itemCount: snapshot.data!.snapshot.children.length,
                //                 itemBuilder: (context, index){
                //                   return ListTile(
                //                       title: Text(list[index]),
                //                   );
                //                 });
                //           }
                //         }
                //     )
                // )
              ],
            ),
          ),
        ],
      )
      // Column(
      //   children: [
      //     Text('Your Register Email and Password is:', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700,color: Colors.indigo,),),
      //     Row(
      //       children: [
      //         Image.asset('assets/images/user.png',
      //           width: 50,
      //           height: 50,),
      //       ],
      //     ),
      //     Row(
      //       children: [
      //         Text("Email:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700,color: Colors.indigo,),),
      //         Text("$email", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700,),),
      //       ],
      //     ),
      //     Row(
      //       children: [
      //         Text("Password:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700,color: Colors.indigo,),),
      //         Text("$password", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700,),),
      //       ],
      //     ),
      //
      //   ],
      // ),
    );
  }
  _getApplicableIcon(visitingPeriod) {
    switch (visitingPeriod) {
      case 0:
        return Icon(Icons.circle, color: Colors.green,);
      case 1:
        return Icon(Icons.circle, color: Colors.blue,);
      // default:
      //   return Icon(Icons.circle, color: Colors.white,);
    }
  }
}
