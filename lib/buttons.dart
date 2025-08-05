import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButtonStyle extends StatelessWidget {

  final Color inputcolor;
  final String inputbuttonText;
  final Color inputbuttonTextcolor;
  final buttontapped;


  const MyButtonStyle(this.inputcolor,this.inputbuttonText,this.inputbuttonTextcolor ,this.buttontapped,{super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
    onTap: buttontapped,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: Container(
            color: inputcolor,
            child: Center(child: Text(inputbuttonText,style: GoogleFonts.acme(color: inputbuttonTextcolor,fontSize: 25 ),)),
          ),
        ),
      ),
    );
  }
}
