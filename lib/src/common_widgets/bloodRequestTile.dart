import 'package:flutter/material.dart';

import '../utils/date_time_convert.dart';


Widget listTile(String name, String Location, String bloodGroup, String Time,onTap) {
      return InkWell(
        onTap:onTap ,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color:Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.shade300)
            ),
            height: 160,
            width: 374,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 8,right: 10),
              child: Row( 
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name",
                        style:  hintTextStyle(15),
                       ),
                      Text(
                        name,
                        style: variableTextStyle(),
                       ),
                        const SizedBox(height: 10),
                      Text(
                        "Location",
                        style:  hintTextStyle(15)
                       ),
                      Text(
                        Location,
                        style: variableTextStyle()
                       ),
                       const SizedBox(height: 10),
                       Text(
                        getTimeAgo(Time),
                        style: hintTextStyle(18)
                       ),
                    ],
                  ),
                 
                  Column(
                    children: [
                      Stack(
                       fit: StackFit.loose, 
                  alignment: AlignmentDirectional.center,
                  children: [
                  
                    Image.asset(
                      'assets/images/Blood_Group.png',
                      height:72 ,
                      width: 52,
                      fit: BoxFit.fitHeight,
                    ),
                    Text(
                      bloodGroup,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )
                  ],
                ),
                const Spacer(),
                TextButton(onPressed: (){}, child: const Text('Donate',style: TextStyle(color: Color.fromRGBO(255, 33, 86, 1),letterSpacing: 2,fontWeight: FontWeight.w500,fontSize: 18),),)
                    ],
                  )
                ],
                
              ),
            )
          ),
        ),
      );
    }

TextStyle variableTextStyle() {
  return const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                    );
}

TextStyle hintTextStyle(double fontSize) {
  return TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.normal,
                      color: const Color.fromARGB(255, 167, 167, 167)
                    );
}