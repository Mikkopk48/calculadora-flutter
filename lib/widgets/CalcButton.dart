import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class CalcButton extends StatelessWidget {
    final int bgcolor;
    final Function callback; 
    final String text; 
    final double textSize;
    
  const CalcButton({super.key,required this.callback
  ,required this.text,this.textSize=28,this.bgcolor=0xFF21252B,});

  @override
  Widget build(BuildContext context) {
    
    return Container(
      margin: const EdgeInsets.all(5),
      child:SizedBox(
        width: 60,
        height: 60,
        child: TextButton(
          onPressed: ()=>{callback(text)},
          style:TextButton.styleFrom(
            backgroundColor: Color(bgcolor),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.all(16.0),
            textStyle: const TextStyle(fontSize: 20)
          ),
          child:Text(
            text,style:GoogleFonts.rubik(
              fontSize:textSize
            )
          )
        ),
      )
    );
  }
}