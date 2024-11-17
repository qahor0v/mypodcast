import 'package:flutter/material.dart';

class NameOfPartsWidget extends StatelessWidget {
  String name;

  NameOfPartsWidget({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20, top: 10, bottom: 10),
        child: ClipRRect(
          //borderRadius: BorderRadius.circular(15),
          child: Container(
            //color: Colors.black54,
            child: Text(
              name,
              style: const TextStyle(
                  fontSize: 20,
                  color: Color(0xff2F2F2F),
                  fontFamily: "PlayfairDisplay-VariableFont",
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
