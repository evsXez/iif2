import 'package:flutter/material.dart';
import 'package:iif/domain/include.dart';

class OperationMoney extends StatelessWidget {
  const OperationMoney({Key? key}) : super(key: key);

  Money get sum => Money.zero;
  Currency get currency => Currency.debugDefault;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
