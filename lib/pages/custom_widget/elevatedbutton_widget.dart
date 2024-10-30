import 'package:flutter/material.dart';
class ElevatedbuttonWidget extends StatelessWidget {
   ElevatedbuttonWidget({super.key,
     required this.text,
     this.onPressed
   });

  final String text;
   void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    Size mediaquery=MediaQuery.of(context).size;
    return  ElevatedButton(
      style:ElevatedButton.styleFrom(
        backgroundColor:  Color(0xff2f1440),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(
            horizontal: mediaquery.width*0.39,vertical: mediaquery.height*0.02),
      ),
      onPressed: onPressed,
      child: Text(text,style: TextStyle(
      color:  Colors.white,
      fontSize: mediaquery.height*0.02,
    ),),
    );
  }
}
