import 'package:flutter/material.dart';
import 'package:iif/presentation/include.dart';

class OperationsHeader extends StatelessWidget {
  const OperationsHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Style.lightGrayColor,
      child: Column(
        children: [
          // Container(height: 40, color: Colors.transparent),
          Container(
            width: double.infinity,
            height: 24,
            decoration: const BoxDecoration(
              color: Style.accentColor,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
            ),
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                // Padding(padding: EdgeInsets.only(top: 12), child: StyleText.titleAppBar(Strings.title_operations, color: StyleColors.white)),
                // StyleText(Strings.subtitle_all_time, color: StyleColors.lightGray, fontSize: 12),
                Container(
                  margin: const EdgeInsets.only(top: 4),
                  width: 50,
                  height: 4,
                  decoration: const BoxDecoration(
                    color: Style.whiteColor,
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
