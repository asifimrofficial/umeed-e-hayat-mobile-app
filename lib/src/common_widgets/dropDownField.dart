import 'package:flutter/material.dart';
class CustomDropdownField extends StatelessWidget {
  final onChanged;
  final IconData prefixIcon ;
   final List<String> bloodTypes = [
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-',
  ];
  CustomDropdownField({super.key,  this.onChanged,required this.prefixIcon});

  @override
  Widget build(BuildContext context) {
     return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.grey),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Icon(prefixIcon,color:const Color(0xffFF2156),),
          const SizedBox(width: 8),
          Expanded(
            child: DropdownButton<String>(
              hint: const Text('Select Blood Type'),
              value: null,
              icon: const Icon(Icons.arrow_drop_down),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.black, fontSize: 16),
              underline: Container(
                height: 0,
              ),
              onChanged: (String? newValue) {
                onChanged(newValue);
              },
              items: bloodTypes.map((String type) {
                return DropdownMenuItem<String>(  
                  value: type,
                  child: Text(type),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}