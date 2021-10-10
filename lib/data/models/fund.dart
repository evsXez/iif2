import 'package:iif/data/include.dart';

class Fund {
  final String name;
  final FundType type;
  final Currency currency;
  final bool isArchived;

  Fund({
    required this.name,
    required this.type,
    required this.currency,
    this.isArchived = false,
  });
}
