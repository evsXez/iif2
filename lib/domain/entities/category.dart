import 'package:equatable/equatable.dart';
import 'package:iif/domain/include.dart';

class Category with EquatableMixin {
  final String name;
  final CategoryType type;
  Category(this.name, this.type);

  @override
  List<Object?> get props => [name];

  @override
  String toString() => name;
}
