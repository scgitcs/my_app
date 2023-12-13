import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_app/HomePage.dart';
import 'package:my_app/Intropage.dart';
import 'package:my_app/SplacePage.dart';
import 'package:provider/provider.dart';
import 'package:twitter_login/twitter_login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplacePage(),
      // Intropage(),
      // const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  String userEmail = "";
  Map<String, dynamic>? _userData;
  // bool loading = false;
  // var arrnames = [ 'Ramen', 'Ramanujan', 'Rajesh', 'James', 'John' ];
  // var Email = TextEditingController();
  // var passText = TextEditingController();
  // final auth = FirebaseAuth.instance;
  // String verificationID = "";
  // bool otpVisibility = false;
  // User? user;
  // final googleSignIn = GoogleSignIn();
  // GoogleSignInAccount? _user;
  // GoogleSignInAccount get user => _user!;
  // Future googleLogin() async{
  //   final googleUser = await googleSignIn.signIn();
  //   if(googleUser == null) return;
  //   _user = googleUser;
  //
  //   final googleAuth = await googleUser.authentication;
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth.accessToken,
  //     idToken: googleAuth.idToken,
  //   );
  //   await FirebaseAuth.instance.signInWithCredential(credential);
  //   // notifyListeners();
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Log In'),
      ),
      body: Column(
        children: [
          Container(height: 41,),
        Image.asset('assets/images/logo.png',
                            width: 200,
                            height: 70,),
          Text('Welcome to AKVO!',  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700,color: Colors.indigo,),),
          Container(height: 101,),
          SizedBox(
            width: double.infinity,
            child: Container(
              margin: const EdgeInsets.all(50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white54,
                        onPrimary: Colors.black,
                        minimumSize: Size(100, 50),
                        maximumSize: Size(300, 50),
                      ),
                      onPressed: (){
                        signInWithGoogle();
                      },
                      icon: FaIcon(FontAwesomeIcons.google, color: Colors.blue,),
                      label: Text('Sign Up With Google')
                  ),
                  Container(height: 11,),
                  ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white54,
                          onPrimary: Colors.black,
                          minimumSize: Size(70, 50)),
                      onPressed: () async {
                        // signInWithGoogle();
                        // facebookLogin();
                        // signInWithFacebook();
                        try {
                          final UserCredential userCredential = await signInWithFacebook();
                          if(context.mounted) {
                            Navigator.pushReplacement(context, MaterialPageRoute(
                                builder: (context) => HomePage(userCredential.user!.email!))
                            );
                          }
                        }
                        catch (e){
                          print(e);
                          // StatusAlert.show(context,
                          //   duration: const Duration(seconds: 2),
                          //   title: 'User Authentication',
                          //   subtitle:e.toString(),
                          //
                          // );
                        }
                      },
                      icon: FaIcon(
                        FontAwesomeIcons.facebook,
                        color: Colors.blue,
                      ),
                      label: Text('Sign Up With Facebook')),
                  Container(height: 11,),
                  ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white54,
                          onPrimary: Colors.black,
                          minimumSize: Size(70, 50)),
                      onPressed: () async {
                        try {
                          final UserCredential userCredential = await signInWithTwitter();
                          if(context.mounted) {
                            Navigator.pushReplacement(context, MaterialPageRoute(
                                builder: (context) => HomePage(userCredential.user!.email!))
                            );
                          }
                        }
                        catch (e){
                          print(e);
                          // StatusAlert.show(context,
                          //   duration: const Duration(seconds: 2),
                          //   title: 'User Authentication',
                          //   subtitle:e.toString(),
                          //
                          // );
                        }
                      },
                      icon: FaIcon(
                        FontAwesomeIcons.twitter,
                        color: Colors.blue,
                      ),
                      label: Text('Sign Up With Twitter')),
                  Container(height: 11,),
                  ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white54,
                          onPrimary: Colors.black,
                          minimumSize: Size(70, 50)),
                      onPressed: () async {
                        try {
                          final UserCredential userCredential = await signInWithTwitter();
                          if(context.mounted) {
                            Navigator.pushReplacement(context, MaterialPageRoute(
                                builder: (context) => HomePage(userCredential.user!.email!))
                            );
                          }
                        }
                        catch (e){
                          print(e);
                          // StatusAlert.show(context,
                          //   duration: const Duration(seconds: 2),
                          //   title: 'User Authentication',
                          //   subtitle:e.toString(),
                          //
                          // );
                        }
                      },
                      icon: FaIcon(
                        FontAwesomeIcons.twitter,
                        color: Colors.blue,
                      ),
                      label: Text('Sign Up With Twitter')),
                ],
              ),
            ),
          ),

          ],
      )
      // Center(
      //   child: Container(
      //     width: 300,
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         TextField(
      //           controller: PhoneNumber,
      //           // keyboardType: TextInputType.number,
      //           decoration: InputDecoration(
      //             hintText: 'Enter PhoneNumber',
      //             enabledBorder: OutlineInputBorder(
      //               borderRadius: BorderRadius.circular(11),
      //               borderSide: BorderSide(
      //                 color: Colors.deepPurple,
      //                 width: 2,
      //               ),
      //             ),
      //             focusedBorder: OutlineInputBorder(
      //                 borderRadius: BorderRadius.circular(11),
      //                 borderSide: BorderSide(
      //                   color: Colors.red,
      //                   width: 2,
      //               ),
      //             ),
      //             // suffixText: "Username Exits",
      //             prefixIcon: Icon(Icons.phone, color: Colors.deepPurple)
      //           ),
      //         ),
      //         Container(height: 31,),
      //         ElevatedButton(onPressed: (){
      //           // setState(() {
      //           //   loading = true;
      //           // });
      //           String uPhno = PhoneNumber.text.toString();
      //           // String uPass = passText.text;
      //           auth.verifyPhoneNumber(
      //               phoneNumber: PhoneNumber.text.toString(),
      //               verificationCompleted: (PhoneAuthCredential credential) async {
      //                 await auth.signInWithCredential(credential).then((value) {
      //                   print("You are logged in successfully");
      //                 });
      //                 // setState(() {
      //                 //   loading = false;
      //                 // });
      //               },
      //               verificationFailed: (FirebaseAuthException e){
      //                 print(e.message);
      //                 // setState(() {
      //                 //   loading = false;
      //                 // });
      //                 // Utils().toastMessage(e.toString());
      //               },
      //               codeSent: (String verificationId, int? resendToken){
      //                 otpVisibility = true;
      //                 verificationID = verificationId;
      //                 // setState(() {
      //                 //   loading = false;
      //                 // });
      //               },
      //               codeAutoRetrievalTimeout: (String verificationId){
      //                 print('TimeOut');
      //                 // Utils().toastMessage(e.toString());
      //                 // setState(() {
      //                 //   loading = false;
      //                 // });
      //               });
      //
      //         }, child: Text(
      //             'Verify'
      //         )),
      //         Container(height: 21,),
      //         TextField(
      //           controller: passText,
      //           // obscureText: true,
      //           // obscuringCharacter: '*',
      //           decoration: InputDecoration(
      //               hintText: 'Enter OTP',
      //             enabledBorder: OutlineInputBorder(
      //               borderRadius: BorderRadius.circular(11),
      //               borderSide: BorderSide(
      //                 color: Colors.deepPurple,
      //                 width: 2,
      //               ),
      //             ),
      //             focusedBorder: OutlineInputBorder(
      //               borderRadius: BorderRadius.circular(11),
      //               borderSide: BorderSide(
      //                 color: Colors.red,
      //                 width: 2,
      //               ),
      //             ),
      //             // suffixIcon: IconButton(
      //             //   icon: Icon(Icons.remove_red_eye, color: Colors.deepPurple,),
      //             //   onPressed: (){
      //             //
      //             //   },
      //             // ),
      //               prefixIcon: Icon(Icons.password, color: Colors.deepPurple)
      //           ),
      //         ),
      //         Container(height: 31,),
      //         ElevatedButton(onPressed: () async {
      //           // setState(() {
      //           //   loading = true;
      //           // });
      //           String uPhno = PhoneNumber.text;
      //           String uPass = passText.text;
      //           PhoneAuthCredential credential = PhoneAuthProvider.credential(
      //               verificationId: verificationID, smsCode: passText.text);
      //           await auth.signInWithCredential(credential).then(
      //                 (value) {
      //               setState(() {
      //                 user = FirebaseAuth.instance.currentUser;
      //               });
      //             },
      //           ).whenComplete(
      //                 () {
      //               if (user != null) {
      //                 Fluttertoast.showToast(
      //                   msg: "You are logged in successfully",
      //                   toastLength: Toast.LENGTH_SHORT,
      //                   gravity: ToastGravity.BOTTOM,
      //                   timeInSecForIosWeb: 1,
      //                   backgroundColor: Colors.red,
      //                   textColor: Colors.white,
      //                   fontSize: 16.0,
      //                 );
      //                 Navigator.pushReplacement(
      //                     context,
      //                     MaterialPageRoute(
      //                         builder: (context) => HomePage(PhoneNumber.text.toString(),passText.text))
      //                 );
      //               } else {
      //                 Fluttertoast.showToast(
      //                   msg: "your login is failed",
      //                   toastLength: Toast.LENGTH_SHORT,
      //                   gravity: ToastGravity.BOTTOM,
      //                   timeInSecForIosWeb: 1,
      //                   backgroundColor: Colors.red,
      //                   textColor: Colors.white,
      //                   fontSize: 16.0,
      //                 );
      //               }
      //             },
      //           );
      //
      //
      //           print("Email: $uPhno, Password: $uPass");
      //
      //           // Navigator.push(context, MaterialPageRoute(builder: (context) {
      //           //   return HomePage(emailText.text.toString(),passText.text);
      //           // } ,));
      //           // Navigator.pushReplacement(
      //           //     context,
      //           //     MaterialPageRoute(
      //           //         builder: (context) => HomePage(PhoneNumber.text.toString(),passText.text))
      //           // );
      //         }, child: Text(
      //           'Login'
      //         ))
      //       ],
      //     ),
      //   ),
      // )
      // ListView.builder(itemBuilder: (context, index){
      //   return Text(arrnames[index], style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500),);
      // },
      //   itemCount: arrnames.length,
      // )
      // Center(
      //   child: ListView(
      //     scrollDirection: Axis.horizontal,
      //     children: [
      //       Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: Text('one', style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500),),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: Text('two', style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500),),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: Text('three', style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500),),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: Text('four', style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500),),
      //       ),
      //       Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: Text('five', style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500),),
      //       )
      //     ],
      //   ),
      // )
      // Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //   crossAxisAlignment: CrossAxisAlignment.stretch,
      //   children: [
      //     Column(
      //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //       children: [
      //         Text('1'),
      //         Text('2'),
      //         Text('3'),
      //         Text('4'),
      //         Text('5'),
      //       ],
      //     ),
      //     Text('A'),
      //     Text('B'),
      //     Text('C'),
      //     Text('D'),
      //     Text('E'),
      //   ],
      // )
      //   OutlinedButton(
    //     child: Text('Outline Button'),
    //     onPressed: (){
    //       print('Outline Button Pressed');
    // },
    //   )
      // ElevatedButton(
      //   child: Text('Elevated Button'),
      //   onPressed: (){
      //     print('Button Prassed');
      //   },
      // )
      // TextButton(
      //   child: Text('Click Here!'),
      //   onPressed: (){
      //     print('Text Button Tapped!');
      //   },
      //   onLongPress: (){
      //     print('LongPressed!');
      //   },
      // ),
      // Center(
      //   child: Container(
      //     width: 300,
      //     height: 300,
      //     color:Colors.purpleAccent,
      //     child: Center(
      //       child: Text('Hello World',
      //         style: TextStyle(
      //             color: Colors.white,
      //           fontSize: 15,
      //           fontWeight: FontWeight.bold,
      //           // backgroundColor: Colors.black
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }

  signInWithGoogle() async {
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
    print(userCredential.user?.email);
    var email = userCredential.user?.email;
    if (userCredential.user != null){
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => HomePage(userCredential.user?.email)));
    }
  }
}
Future<UserCredential> signInWithFacebook() async {
  // Trigger the sign-in flow
  final LoginResult loginResult = await FacebookAuth.instance.login(
      permissions: ['public_profile', 'email']
  );
  if(loginResult == LoginStatus.success){
    final userData = await FacebookAuth.instance.getUserData();
    print(userData);
  }else{
    print(loginResult.message);
  }

  // Create a credential from the access token
  final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

  // final userEmail = userData['email'];
  // Once signed in, return the UserCredential
  return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
}
facebookLogin() async {
  print("FaceBook");
  try {
    final result =
    await FacebookAuth.instance.login(permissions: ['public_profile', 'email']);
    if (result.status == LoginStatus.success) {
      final userData = await FacebookAuth.instance.getUserData();
      print(userData['email']);
    }
  } catch (error) {
    print(error);
  }
}
signInWithTwitter() async{
 final twitterLogin = TwitterLogin(
     apiKey: 'dnsW8QLfR8dh95wmdKGrbBXaa',
     apiSecretKey: 'qPnbkawb4LBZlPAn85RtVlwkfabdfTjdUW1jOKvbjKNURMohck',
     redirectURI: 'flutter-twitter-login://');
 await twitterLogin.login().then((value) async{
   final twitterAuthCredentials = TwitterAuthProvider.credential(
       accessToken: value.authToken!,
       secret: value.authTokenSecret!);
   await FirebaseAuth.instance.signInWithCredential(twitterAuthCredentials);
 });
}

