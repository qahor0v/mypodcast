import 'package:flutter/material.dart';
class SynopsisScreen extends StatelessWidget {
  String? synopsisText;
  SynopsisScreen({Key? key,required this.synopsisText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(synopsisText!);
  }
}
