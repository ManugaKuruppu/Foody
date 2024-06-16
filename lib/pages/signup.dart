import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foody/pages/bottomnav.dart';
import 'package:foody/pages/login.dart';
import 'package:foody/widget/widget_support.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  String email="", password="", name="";

  TextEditingController namecontroller= new TextEditingController();

  TextEditingController passwordcontroller= new TextEditingController();

  TextEditingController mailcontroller = new TextEditingController();

  final _formkey= GlobalKey<FormState>();

  registration()async{
    if(password!=null){
      try{
        UserCredential userCredential= await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);

        ScaffoldMessenger.of(context).showSnackBar((SnackBar(
          backgroundColor: Colors.blueAccent,
          content: Text(
          "Registerd Succesfully!",
            style: TextStyle(fontSize: 20.0),
          ))));
        Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>BottomNav() ));
      }on FirebaseException catch(e){
        if(e.code=='weak-password'){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Password Provided is too Weak",style: TextStyle(fontSize: 18.0),),));


        }
        else if(e.code=="email-already-in-use")
        {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.blueAccent,
              content:Text("Account Alredeady exixsts", style: TextStyle(fontSize: 18.0),)));


        }
      }
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: Stack(
        children: [
          Container(
            width: MediaQuery
                .of(context)
                .size
                .width,
            height: MediaQuery
                .of(context)
                .size
                .height / 2.5,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,

                    colors: [
                      Color(0xff5f94ff),
                      Color(0xff7b7dfe),

                    ])),
          ),
          Container(
            margin: EdgeInsets.only(top: MediaQuery
                .of(context)
                .size
                .height / 3),
            height: MediaQuery
                .of(context)
                .size
                .height / 2,
            width: MediaQuery
                .of(context)
                .size
                .width,
            decoration: BoxDecoration(color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
            child: Text(""),
          ),
          Container(
            margin: EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0,),
            child: Column(children: [
              Center(
                  child: Image.asset("images/foodylogo.png", width: MediaQuery
                      .of(context)
                      .size
                      .width / 2, fit: BoxFit.cover,)),
              SizedBox(height: 50.0,),
              Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height / 2.0,
                  decoration: BoxDecoration(color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Form(
                    key: _formkey,
                    child: Column(children: [
                      SizedBox(height: 30.0,),
                      Text("Sign Up", style: AppWidget.HeadlineTextFeildStyle(),),
                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: namecontroller,
                          validator: (value){
                          if(value==null || value.isEmpty){
                            return 'Please Enter Name';
                          }
                          return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'Name',
                            hintStyle: AppWidget.semiBoldTextFeildStyle(),
                            prefixIcon: Icon(Icons.person_outline),


                          )
                      ),

                      SizedBox(
                        height: 30,
                      ),
                    TextFormField(
                        controller: mailcontroller,
                        validator: (value){
                          if(value==null || value.isEmpty){
                            return 'Please Enter E-email';
                          }
                          return null;
                        },
                      decoration: InputDecoration(
                        hintText: 'Email',
                        hintStyle: AppWidget.semiBoldTextFeildStyle(),
                        prefixIcon: Icon(Icons.email_outlined),
                      )),
                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                          controller: passwordcontroller,
                          validator: (value){
                            if(value==null || value.isEmpty){
                              return 'Please Enter Password';
                            }
                            return null;
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            hintStyle: AppWidget.semiBoldTextFeildStyle(),
                            prefixIcon: Icon(Icons.lock_outlined),

                          )
                      ),
                      SizedBox(height: 20,),
                      Container(
                          alignment: Alignment.topRight,
                          child: Text("Forgot Password?",
                            style: AppWidget.semiBoldTextFeildStyle(),)),
                      SizedBox(height: 20,),
                      GestureDetector(
                        onTap: ()async{
                          if(_formkey.currentState!.validate()){
                            setState(() {
                              email= mailcontroller.text;
                              name= namecontroller.text;
                              password= passwordcontroller.text;
                            });
                          }
                          registration();
                        },
                        child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            width: 200,
                            decoration: BoxDecoration(color: Color(0xff5f94ff),
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(child: Text("SIGN UP", style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'Poppins1',
                                fontWeight: FontWeight.bold),)),),
                        ),
                      )
                    ],
                    ),
                  ),

                ),
              ),
              SizedBox(height: 70.0,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>LogIn()));
                },
                child: Text("Already have an account? Login",
                  style: AppWidget.semiBoldTextFeildStyle(),),
              )
            ],
            ),
          )
        ],

      ),
      ),
    );
  }
}
