import 'package:chat/pages/login/login_screen.dart';
import 'package:flutter/material.dart';

import '../../auth/validation_func.dart';
import '../custom_widget/elevatedbutton_widget.dart';
import '../custom_widget/textfieldflorm_widget.dart';
class RegisterScreen extends StatefulWidget {
   RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
GlobalKey<FormState> formkey=GlobalKey<FormState>();
TextEditingController passwordcontroller=TextEditingController();
TextEditingController confirmPasswordcontroller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size mediaquery=MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               ////////////////////////////////////////////////////////signUp text
                Text("SignUp",style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: mediaquery.height*0.04,

                ),),
                SizedBox(height: mediaquery.height*0.02,),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: mediaquery.width*0.1),
                  child: Text("Get chatting with friends and family today by signing up for our chat app!",
                  style: TextStyle(
                    fontSize: mediaquery.height*0.018,
                    fontWeight: FontWeight.w400,
                    color: Colors.black54,
                  ),textAlign: TextAlign.center,),
                ),

                ////////////////////////////////////////////////////////////////name textformfield
               //-----------------------------name---------------------------------
                SizedBox(height: mediaquery.height*0.05,),
                TextfieldflormWidget(
                  hinttext: "Name",
                  labeltext: "Name",
                  prefixicon: Icons.person,
                  isobsecure: false,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if(value!.isEmpty){
                      return "Please Enter Name";
                    }else if(!namevalidation(value)){
                      return "Please Enter Valid Name";
                    }else{
                      return null;
                    }
                  },
                ),

                //---------------------------------email--------------------------------
                SizedBox(height: mediaquery.height*0.025,),
                TextfieldflormWidget(
                  hinttext: "Email",
                  labeltext: "Email",
                  prefixicon: Icons.email,
                  isobsecure: false,
                  keyboardType: TextInputType.emailAddress,
                    validator: (value){
                      if(value!.isEmpty){
                        return "Enter Email";
                      }else if(!emailValidation(value)){
                        return "Enter Valid Email";
                      }else{
                        return null;
                      }
                    }
                ),

                //--------------------------------password--------------------------------
                SizedBox(height: mediaquery.height*0.025,),
                TextfieldflormWidget(
                  controller: passwordcontroller,
                  hinttext: "Password",
                  labeltext: "Password",
                  prefixicon: Icons.email,
                  suffixicon: Icons.remove_red_eye,
                  isobsecure: true,
                  keyboardType: TextInputType.emailAddress,
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

                //---------------------------------------confirm password--------------------------------
                SizedBox(height: mediaquery.height*0.025,),
                TextfieldflormWidget(
                  controller: confirmPasswordcontroller,
                  hinttext: "Confirm Password",
                  labeltext: "Confirm Password",
                  prefixicon: Icons.email,
                  isobsecure: true,
                  keyboardType: TextInputType.emailAddress,
                  suffixicon: Icons.remove_red_eye,
                  validator: (value) {
                    if(value!.isEmpty){
                      return "Enter Confirm Password";
                    }else if(passwordcontroller.text!=confirmPasswordcontroller.text){
                      return "Password and Confirm Password doesn't match";
                    }else{
                      return null;
                    }
                  },
                ),


                //---------------------------------------phone number--------------------------------
                SizedBox(height: mediaquery.height*0.025,),
                TextfieldflormWidget(
                  hinttext: "Phone Number",
                  labeltext: "Phone Number",
                  prefixicon: Icons.phone,
                  isobsecure: false,
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if(value!.isEmpty){
                      return "Enter Phone Number";
                    }else if(!phonenumberValidation(value)){
                      return "Enter Valid Phone Number";
                    }else{
                      return null;
                    }
                  },
                ),


                //---------------------------------------sign up button--------------------------------
                SizedBox(height: mediaquery.height*0.025,),
                ElevatedbuttonWidget(
                  text: "Sign up",
                  onPressed: () {
                    if(formkey.currentState!.validate()){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen(),));
                    }
                  },
                ),


                //------------------------------------------already have an account--------------------------------
                SizedBox(height: mediaquery.height*0.01,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?",style: TextStyle(
                        color:  const Color(0xff2f1440),
                        fontSize: mediaquery.height*0.019
                    ),),
                    TextButton(onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                    }, child: Text("Log in",
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
