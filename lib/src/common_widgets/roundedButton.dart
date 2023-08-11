import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
   RoundedButton({super.key, required this.height, required this.width, required this.onpress, this.loading=false, required this.text});
  final double height;
  final double width;
  final VoidCallback onpress;
  final String text;
  bool loading;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: onpress,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: const Color(0xffFF2156),
            borderRadius: BorderRadius.circular(50)),
        child: Center(
            child:loading ?
            const CircularProgressIndicator(
              color: Colors.white,
            ): Text(text,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)) 
            ),
      ),
    );
  }
}