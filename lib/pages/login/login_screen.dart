import 'dart:math';

import 'package:chat/pages/custom_widget/circleavatar_social.dart';
import 'package:chat/pages/register/register_screen.dart';
import 'package:flutter/material.dart';

import '../../auth/validation_func.dart';
import '../custom_widget/elevatedbutton_widget.dart';
import '../custom_widget/line_divider.dart';
import '../custom_widget/textfieldflorm_widget.dart';
import '../home/home_screen.dart';
class LoginScreen extends StatefulWidget {
   LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formkey=GlobalKey();
  bool obSecure=true;

  @override
  Widget build(BuildContext context) {
    Size mediaquery=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: Center(
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                ///////////////////////////////////////////////////////////////Text login
                Text("Log in to Chatbox",style: TextStyle(
                  color: Colors.black,
                  fontSize: mediaquery.height*0.03,
                  fontWeight: FontWeight.w600,
                )),
                SizedBox(height: mediaquery.height*0.02,),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: mediaquery.width*0.1),
                  child: Text("Welcome back! Sign in using your social account or email to continue us",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: mediaquery.height*0.019,
                    fontWeight: FontWeight.w400,
                  ),textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: mediaquery.height*0.02,),

                ///////////////////////////////////////////////////////////////social media
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(width: mediaquery.width*0.1,),
                    const CircleavatarSocial(image: "assets/images/google.png"),
                    const CircleavatarSocial(image: "assets/images/facebook.png"),
                    const CircleavatarSocial(image: "assets/images/twitter.png"),
                    const CircleavatarSocial(image: "assets/images/apple.png"),
                    const CircleavatarSocial(image: "assets/images/github.png"),
                    SizedBox(width: mediaquery.width*0.1,),
                  ],
                ),

            ///////////////////////////////////////////////////////////////line divider
                SizedBox(height: mediaquery.height*0.02,),
                const LineDivider(),


            //////////////////////////////////////////////////////////////TextFormField email
            SizedBox(height: mediaquery.height*0.02,),
            TextfieldflormWidget(
              keyboardType: TextInputType.emailAddress,
              hinttext: "Email",
              labeltext: "Email",
              prefixicon: Icons.email,
              isobsecure: false,
              validator: (value){
                if(value!.isEmpty){
                  return "Enter Email";
                }else if(!emailValidation(value)){
                  return "Enter Valid Email";
                }else{
                  return null;
                }
              },
            ),


            //////////////////////////////////////////////password textformfield
            SizedBox(height: mediaquery.height*0.02,),
            TextfieldflormWidget(
              hinttext: "Password",
              labeltext: "Password",
              prefixicon: Icons.email,
              suffixicon: obSecure ? Icons.visibility : Icons.visibility_off,
              isobsecure: true,
              validator: (value) {
                if(value!.isEmpty){
                  return "Enter Password";
                }else if(!passwordValidation(value)){
                  return "Enter Valid Password";
                }else{
                  return null;
                }
              },
            ),
                //////////////////////////////////////////////////////////////////forget password
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {  },
                      child: Text("Forgot Password?",style: TextStyle(
                        color:  const Color(0xff2f1440),
                        fontSize: mediaquery.height*0.018,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                    ),
                  ],
                ),

                ////////////////////////////////////////////////////////////////////Login button
                SizedBox(height: mediaquery.height*0.02,),
                 ElevatedbuttonWidget(
                  text: "Login",
                   onPressed: () {
                    if(formkey.currentState!.validate()){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
                    }
                   },
                ),


                //////////////////////////////////////////////////Create account? signUp
                SizedBox(height: mediaquery.height*0.01,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Create an account?",style: TextStyle(
                        color:  const Color(0xff2f1440),
                        fontSize: mediaquery.height*0.019
                    ),),
                    TextButton(onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => RegisterScreen(),));
                    }, child: Text("Sign up",
                      style: TextStyle(
                          color:  const Color(0xff2f1440),
                        fontSize: mediaquery.height*0.022,
                        fontWeight: FontWeight.bold
                    ),))
                  ],
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
