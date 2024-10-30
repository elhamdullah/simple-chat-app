import 'package:chat/pages/custom_widget/line_divider.dart';
import 'package:chat/pages/login/login_screen.dart';
import 'package:chat/pages/register/register_screen.dart';
import 'package:flutter/material.dart';

import '../custom_widget/circleavatar_social.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size mediaquery=MediaQuery.of(context).size;
    return Scaffold(
      body: Expanded(
        child: Container(

          /////////////////////////////////////////////////////////////background color by using linear color
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.topCenter,
                tileMode: TileMode.clamp,
                stops: [0.1, 2.0],
                colors: [
                  Color(0xff1f1633),
                  Color(0xff2f1440),
                ]),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [

                  ////////////////////////////////////////////////////chatapp logo
                  SizedBox(height: mediaquery.height*0.1,),
                  Image.asset("assets/images/splash.png",
                    height: mediaquery.height*0.045,
                  ),
                  SizedBox(width: mediaquery.width*0.02,),
                  Text("ChatBox",style: TextStyle(
                      color: Colors.white,fontSize: mediaquery.height*0.027),),
                ],
              ),

              /////////////////////////////////////////////////////////////text body
              Text("Connect friends easily & quickly",style: TextStyle(
                color: Colors.white,fontSize: mediaquery.height*0.08,
              ),
                textAlign: TextAlign.center,
              ),

              ////////////////////////////////////////////////////////////////////description
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: mediaquery.width*0.1),
                child: Text("Our chat app is the perfect way to stay connected with friends and family.",style: TextStyle(
                  color: Colors.grey,fontSize: mediaquery.height*0.02,

                ),
                  textAlign: TextAlign.center,
                ),
              ),


              ////////////////////////////////////////////////////////social login
              SizedBox(height: mediaquery.height*0.025,),
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


              /////////////////////////////////////////////////////////line divider
              SizedBox(height: mediaquery.height*0.025,),
              const LineDivider(),


              //////////////////////////////////////////////////////////signup button
              SizedBox(height: mediaquery.height*0.03,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: mediaquery.width*0.07),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => RegisterScreen(),));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: mediaquery.width*0.1,vertical: mediaquery.height*0.02),
                    ),
                    child: Text("SIGN UP",style: TextStyle(
                        color: Colors.black,fontSize: mediaquery.height*0.025
                    ),),
                  ),
                ),
              ),


              //////////////////////////////////////////////////Existing account? Log in
              SizedBox(height: mediaquery.height*0.025,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?",style: TextStyle(
                      color: Colors.grey,fontSize: mediaquery.height*0.019
                  ),),
                  TextButton(onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                  }, child: Text("Log in",style: TextStyle(
                      color: Colors.white,fontSize: mediaquery.height*0.022,
                      fontWeight: FontWeight.bold
                  ),))
                ],
              ),


            ],
          ),
        ),
      ),

    );
  }
}
