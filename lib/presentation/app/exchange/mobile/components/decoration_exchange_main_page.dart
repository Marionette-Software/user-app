import 'package:flutter/material.dart';

class DecorationExchangeMainPageMobile extends StatelessWidget {
  const DecorationExchangeMainPageMobile({
    super.key,
    required this.content,
  });

  final Widget content;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: content,
        ),
      ),
    );
  }
}
