import 'package:flutter/material.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/presentation/blocs/operations_list_bloc/operations_list_bloc.dart';
import 'package:iif/presentation/include.dart';
import 'package:iif/presentation/pages/main/widgets/account_item.dart';
import 'package:iif/presentation/pages/main/widgets/operation_item.dart';

class OperationsList extends StatefulWidget {
  @override
  _OperationsListState createState() => _OperationsListState();
}

class _OperationsListState extends State<OperationsList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OperationsListBloc, OperationsListState>(
        builder: (context, state) => state.map(
              loading: (_) => Container(
                height: 50,
                margin: const EdgeInsets.all(24),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              loaded: (state) {
                if (state.data.isEmpty) {
                  return SizedBox(
                    height: 50,
                    child: Center(
                      child: Text(Strings.hint_no_records),
                    ),
                  );
                } else {
                  return ListView(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    children: List.generate(state.data.length, (index) => OperationItem(state.data[index])),
                  );
                }
              },
            ));
  }
}
