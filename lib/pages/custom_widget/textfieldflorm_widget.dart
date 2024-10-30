import 'package:flutter/material.dart';
class TextfieldflormWidget extends StatefulWidget {
   TextfieldflormWidget({super.key,
     required this.hinttext,
     required this.prefixicon,
     required this.labeltext,
      this.suffixicon,
      this.isobsecure,
      this.validator,
      this.onChanged,
     this.controller,
     this.onTap,
     this.keyboardType,
   });

  final String hinttext;
  final String labeltext;
  //IconData? suffixicon;
   IconData? suffixicon;
  final IconData prefixicon;
  bool ? isobsecure;
  String? Function(String?)? validator;
  void Function(String)? onChanged;
  TextEditingController? controller;
   void Function()? onTap;
   TextInputType? keyboardType;

  @override
  State<TextfieldflormWidget> createState() => _TextfieldflormWidgetState();
}

class _TextfieldflormWidgetState extends State<TextfieldflormWidget> {
  @override
  Widget build(BuildContext context) {
    Size mediaquery=MediaQuery.of(context).size;

    return  Padding(
      padding:  EdgeInsets.symmetric(horizontal: mediaquery.width*0.04),
          child: TextFormField(
            style: TextStyle(
              fontSize: mediaquery.height*0.02,
            ),
            decoration:  InputDecoration(

              hintText: widget.hinttext,
              labelText: widget.labeltext,
              suffixIcon: Icon(widget.suffixicon),
              prefixIcon: Icon(widget.prefixicon),

              labelStyle: TextStyle(
                fontSize: mediaquery.height*0.02,
                color: Colors.grey
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide(width: 2,
                  color:  Color(0xff2f1440),),
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(color:  Color(0xff2f1440),),
              ),
              focusedBorder:  const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(color:  Color(0xff2f1440),),
              ),
              hoverColor: Colors.grey.shade200,
              errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              ),
              disabledBorder:  const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(color:  Colors.red,),
              ),
              errorStyle: TextStyle(
                fontSize: mediaquery.height*0.017,
              )

          ),
          obscureText: widget.isobsecure!,
            validator: widget.validator,
            onChanged: widget.onChanged,
            controller: widget.controller,
            onTap:widget.onTap,
            keyboardType: widget.keyboardType,

          ),
    );
  }
}
