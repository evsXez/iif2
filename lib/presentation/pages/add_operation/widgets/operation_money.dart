import 'package:flutter/material.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/presentation/include.dart';

class OperationMoney extends StatefulWidget {
  final Function(Money) onMoneyChanged;
  OperationMoney({Key? key, required this.onMoneyChanged}) : super(key: key);

  @override
  _OperationMoneyState createState() => _OperationMoneyState();
}

class _OperationMoneyState extends State<OperationMoney> {
  // Money sum;
  // Money sumInBaseCurrency;
  // Currency currency;

  // MoneyField moneyField;
  // CurrencySelector currencySelector;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: MoneyField(
                  initialValue: null,
                  onChanged: save,
                  fontSize: 18,
                ),
              ),
            ),
            // currencySelector = CurrencySelector(), //TODO: save on currency update
          ],
        ),
      ),
    );
  }

  void save(String text) {
    print("money changed: $text");
    // widget._sum = moneyField.value;
    // widget._currency = currencySelector.value;
  }
}
