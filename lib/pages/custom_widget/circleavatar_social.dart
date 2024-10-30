import 'package:flutter/material.dart';
class CircleavatarSocial extends StatelessWidget {
  const CircleavatarSocial({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    Size mediaquery=MediaQuery.of(context).size;
    return  CircleAvatar(
      radius: mediaquery.height*0.025,
      backgroundColor: Colors.transparent,
      child: Image.asset(image,),
    );
  }
}
