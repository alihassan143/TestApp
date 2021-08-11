import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:testapp/Screens/signup.dart';
import 'package:testapp/Screens/welcome.dart';
import 'package:testapp/authfunction.dart';
import 'package:testapp/constants.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email=TextEditingController();
   TextEditingController password=TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool state=false;
  bool view=true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
     backgroundColor: black,
        body: ModalProgressHUD(
          inAsyncCall: state,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width*0.3,
                      height: MediaQuery.of(context).size.height*0.15,
                      decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/logo.png"),fit: BoxFit.fill)),
                    ),
                  
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Welcome to ,",style: TextStyle(color: white,fontSize: 30),),
                  ),
                    Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("7days7nights",style: TextStyle(color: white,fontSize: 30,fontWeight: FontWeight.bold),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Please login to your account",style: TextStyle(color: white,fontSize: 15),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: TextFormField(
            controller: email,
            validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter Your Email';
                }
                return null;
              },
            decoration: InputDecoration(     
               
              enabledBorder: UnderlineInputBorder(      
                borderSide: BorderSide(color: white),   
              ),  
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: white),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color:white),
              ),
              hintText: "Enter  Your Email",
              labelStyle: TextStyle(color: white),
              labelText: "Email",
              hintStyle: TextStyle(color: white),
              
            ),
               style:TextStyle(color: white) ,
            
          
            
            
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: TextFormField(
            controller: password,
                obscureText: view,
            validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter Your Password';
                }
                return null;
              },
            decoration: InputDecoration(     
               
              enabledBorder: UnderlineInputBorder(      
                borderSide: BorderSide(color: white),   
              ),  
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: white),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color:white),
              ),
              hintText: "Enter  Your Password",
              labelStyle: TextStyle(color: white),
              labelText: "Password",
              hintStyle: TextStyle(color: white),
              suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  view = !view;
                                });
                              },
                              child: view
                                  ? Icon(Icons.visibility,color: white,)
                                  : Icon(Icons.visibility_off,color: white,)),
            ),
            style:TextStyle(color: white) ,
            
            
                    ),
                  ),
          
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width*0.8,
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
              primary: Color.fromRGBO(0, 238, 255,10),
              onPrimary: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
            ),
                  onPressed: (){
          if(_formKey.currentState!.validate()){
             setState(() {
                state=true;
              });
            AuthFunction().auth(context,email.text.trim(), password.text.trim()).then((value){
               setState(() {
                state=false;
              });
              if(value!=null){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Welcome()));
              }
            });
          }
          
                  }, child:Text("SIGN IN")),
              ),
            ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Did not have and account ",style: TextStyle(color: white),),
              TextButton(
                onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignUp()));
                },
                child: Text("Sign Up",style: TextStyle(color: Colors.red),)),
            ],
                )
                
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}