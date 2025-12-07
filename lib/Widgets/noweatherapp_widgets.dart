import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class NoweatherappView extends StatelessWidget {
  const NoweatherappView();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,

          children: [
            Text(
              'there is no weather 😔 start',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.w700),
            ),

            Text(
              'searching now 🔍',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}



