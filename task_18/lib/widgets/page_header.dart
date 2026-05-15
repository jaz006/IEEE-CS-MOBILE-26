import 'package:flutter/material.dart';

class PageHeader extends StatelessWidget {
  const PageHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.3,
      child: Image.network('https://i.pinimg.com/736x/58/c6/91/58c691494590c6345a21c69de02344b2.jpg'),
    );
  }
}