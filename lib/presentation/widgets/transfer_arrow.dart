import 'dart:math';

import 'package:flutter/material.dart';
import 'package:iif/presentation/include.dart';

class TransferArrow extends StatelessWidget {
  final bool right;
  final bool isSmall;
  final Color? color;

  const TransferArrow({
    Key? key,
    required this.right,
    required this.isSmall,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = this.color ?? (isSmall ? Style.grayColor : Style.accentColor);
    return Transform.rotate(
        angle: right ? 0 : pi,
        child: Stack(
          alignment: Alignment.centerRight,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(
                "➤",
                style: TextStyle(
                  color: color,
                  fontSize: isSmall ? 14 : 24,
                ),
              ),
            ),
            Container(
              // width: double.infinity,
              width: isSmall ? 16 : 40,
              height: isSmall ? 1.3 : 2,
              decoration: BoxDecoration(
                color: color,
              ),
              margin: EdgeInsets.only(right: 8, left: 0, bottom: isSmall ? 1 : 0),
            ),
            // Icon(Icons.arrow_right, size: 48, color: StyleColors.accent),
          ],
        ));
  }
}
