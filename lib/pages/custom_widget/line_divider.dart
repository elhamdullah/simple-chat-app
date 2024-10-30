import 'package:flutter/material.dart';
class LineDivider extends StatelessWidget {
  const LineDivider({super.key});

  @override
  Widget build(BuildContext context) {
    Size mediaquery=MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 1,
          width: mediaquery.width*0.4,
          color: Colors.grey,
        ),
        SizedBox(width: mediaquery.width*0.02,),
        Text("OR",style: TextStyle(
          color: Colors.grey,fontSize: mediaquery.height*0.025,
        )),
        SizedBox(width: mediaquery.width*0.02,),
        Container(
          height: 1,
          width: mediaquery.width*0.4,
          color: Colors.grey,

        )
      ],
    );
  }
}
