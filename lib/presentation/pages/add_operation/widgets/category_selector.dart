import 'package:flutter/material.dart';
import 'package:iif/domain/entities/enums/operation_category.dart';

class CategorySelector extends StatelessWidget {
  final Function(OperationCategory)? onCategoryChanged;
  final bool isObject;

  CategorySelector({
    this.onCategoryChanged,
    this.isObject = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
