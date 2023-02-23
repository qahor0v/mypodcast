import 'package:flutter/material.dart';
class DetailsScreen extends StatelessWidget {
  String? detailsText;
  DetailsScreen({Key? key,required this.detailsText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(detailsText!);
  }
}
