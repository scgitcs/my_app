
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmailLogin extends StatelessWidget{
  var emailText = TextEditingController();
  var passText = TextEditingController();
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text('Email Log In'),
        ),
        body: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: emailText,
                  decoration: InputDecoration(
                      hintText: 'Enter Email',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: BorderSide(
                          color: Colors.deepPurple,
                          width: 2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 2,
                        ),
                      ),
                      suffixText: "Username Exits",
                      prefixIcon: Icon(Icons.email, color: Colors.deepPurple)
                  ),
                ),
                Container(height: 11,),
                TextField(
                  controller: passText,
                  obscureText: true,
                  obscuringCharacter: '*',
                  decoration: InputDecoration(
                      hintText: 'Enter Password',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: BorderSide(
                          color: Colors.deepPurple,
                          width: 2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 2,
                        ),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.remove_red_eye, color: Colors.deepPurple,),
                        onPressed: (){

                        },
                      ),
                      prefixIcon: Icon(Icons.password, color: Colors.deepPurple)
                  ),
                ),
                Container(height: 51,),
                ElevatedButton(onPressed: (){
                  String uEmail = emailText.text.toString();
                  String uPass = passText.text;
                  print("Email: $uEmail, Password: $uPass");

                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //   return HomePage(emailText.text.toString(),passText.text);
                  // } ,));
                  // Navigator.pushReplacement(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => HomePage(emailText.text.toString(),passText.text))
                  // );
                }, child: Text(
                    'Login'
                ))
              ],
            ),
          ),
        )
    );
  }

}