class LogicOperationTime {
  late int createdTs;
  late int statsTs;
  late int statsMonth;
  late int statsYear;
  LogicOperationTime({
    int? createdTs,
    int? statsTs,
    int? statsMonth,
    int? statsYear,
  }) {
    final now = DateTime.now();
    this.createdTs = createdTs ?? now.millisecondsSinceEpoch;
    this.statsTs = statsTs ?? now.millisecondsSinceEpoch;
    this.statsMonth = statsMonth ?? now.month;
    this.statsYear = statsYear ?? now.year;
  }

  static LogicOperationTime fromNow() => LogicOperationTime();
}
