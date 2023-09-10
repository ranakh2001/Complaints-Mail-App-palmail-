import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final String text;
  final Color color;
  const CustomContainer({
    super.key, required this.text, required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20,left: 10,right: 10),
        child: Container(
          padding: const EdgeInsets.all(10),
          width: 181,
          height: 88,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.white
          ),
          child:  Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: color,
                      ),
                      const SizedBox(height: 12,),
                      Text(text,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Color(0xffB2B2B2)),),
                    ],
                  ),
                  const Text('9',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,),),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}