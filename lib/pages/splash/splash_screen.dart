import 'package:chat/pages/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 5),(){
      Navigator.of(context).pushReplacement( MaterialPageRoute(builder: (context)=>WelcomeScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    Size mediaquery=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/splash.png",
              height: mediaquery.height*0.15,
            ),
            Text("ChatBox",style: TextStyle(
              color: Colors.black,
              fontSize: mediaquery.height*0.06,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.italic
            ),)
          ],
        ),
      ),
    );
  }
}
