import 'package:flutter/material.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/presentation/include.dart';

class OperationItem extends StatelessWidget {
  final LogicOperation operation;
  OperationItem(this.operation);

  Account get account1 => operation.atomics.first.account;
  Account? get account2 => operation.atomics.length > 1 ? operation.atomics[1].account : null;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: account1.isArchived ? 0.4 : 1,
      child: Card(
        margin: const EdgeInsets.fromLTRB(8, 4, 8, 4),
        // color: account1 == null ? Style.whiteColor : (account1.isArchived ? Style.lightGrayColor : Style.whiteColor),
        color: Style.whiteColor,
        // elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 80,
                child: Column(
                  children: [
                    FittedBox(
                        alignment: Alignment.centerLeft,
                        fit: BoxFit.scaleDown,
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: moneyBackColor(),
                            borderRadius: const BorderRadius.all(Radius.circular(4)),
                          ),
                          child: MoneyText(
                            money: operation.atomics.first.money,
                            color: moneyFrontColor(),
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        )),
                    Text(
                      operation.atomics.first.account.currency.symbol,
                      style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Expanded(child: _OperationInfo(operation)),
              const SizedBox(width: 4),
              // Column(
              //   // mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   // mainAxisSize: MainAxisSize.max,
              //   crossAxisAlignment: CrossAxisAlignment.end,
              //   children: [
              //     Text(
              //       statDateDayMonth(),
              //       style: const TextStyle(
              //         color: Colors.grey,
              //         fontSize: 12,
              //       ),
              //     ),
              //     Text(
              //       statDateYear(),
              //       style: const TextStyle(
              //         color: Colors.grey,
              //         fontSize: 12,
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Color moneyBackColor() {
    if (account2 != null) return Style.lightGrayColor;

    switch (operation.atomics.first.type) {
      case AtomicOperationType.initialInput:
        return Style.lightGrayColor;
      case AtomicOperationType.income:
        return Style.greenColor;
      case AtomicOperationType.expense:
        return Style.grayColor;
    }
  }

  Color moneyFrontColor() {
    if (account2 != null || operation.atomics.first.type == AtomicOperationType.initialInput) {
      return Style.grayColor;
    }
    return Colors.white;
  }

  // String statDateYear() {
  //   final dt = DateTime.fromMillisecondsSinceEpoch(operation.stats.statsTs);
  //   return "${dt.year}";
  // }

  // String statDateDayMonth() {
  //   final dt = DateTime.fromMillisecondsSinceEpoch(operation.stats.statsTs);
  //   final month = DateFormat.MMM().format(dt);
  //   return "${dt.day} $month";
  // }
}

class _OperationInfo extends StatelessWidget {
  final LogicOperation operation;
  const _OperationInfo(this.operation);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _MoneyAndAccounts(operation),
        const SizedBox(height: 4),
        Text(
          _categories(),
          style: const TextStyle(
            fontSize: 12,
          ),
          maxLines: 5,
        ),
        const SizedBox(height: 4),
        Visibility(
          visible: (operation.comment.isNotEmpty),
          child: Text(
            "(${operation.comment})",
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
            maxLines: 3,
          ),
        )
      ],
    );
  }

  String _categories() {
    return "categories/here";
    // List<String> itemCategories = decodeJsonArray(operation.categories);
    // List<String> itemObjects = decodeJsonArray(operation.objects);
    // if (operation.categories == null || operation.categories.isEmpty) return "<no data?>";

    // itemCategories.addAll(itemObjects);
    // return itemCategories.join("/");
  }
}

class _MoneyAndAccounts extends StatelessWidget {
  final LogicOperation operation;
  _MoneyAndAccounts(this.operation);

  Account get account1 => operation.atomics.first.account;
  Account? get account2 => operation.atomics.length > 1 ? operation.atomics[1].account : null;

  @override
  Widget build(BuildContext context) {
    final isTransfer = account2 != null;
    return Wrap(
      children: [
        // money,
        // SizedBox(width: 8,),
        Text(
          "${account1.name}${account1.isArchived ? ' (*)' : ''}",
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        Visibility(
            visible: isTransfer,
            child: const SizedBox(
              width: 4,
            )),
        Visibility(visible: isTransfer, child: TransferArrow(right: true, isSmall: true)),
        Visibility(visible: isTransfer, child: const SizedBox(width: 4)),
        Visibility(
          visible: isTransfer,
          child: Text(
            account2?.name ?? "<null>",
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
