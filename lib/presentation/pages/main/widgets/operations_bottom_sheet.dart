import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iif/presentation/blocs/operations_list_bloc/operations_list_bloc.dart';
import 'package:iif/presentation/include.dart';
import 'package:iif/presentation/pages/main/widgets/operations_header.dart';
import 'package:iif/presentation/pages/main/widgets/operations_list.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

class OperationsBottomSheet extends StatelessWidget {
  final VoidCallback onShow;
  final VoidCallback onHide;
  OperationsBottomSheet({
    Key? key,
    required this.onShow,
    required this.onHide,
  }) : super(key: key);
  final controller = SolidController();

  @override
  Widget build(BuildContext context) {
    return SolidBottomSheet(
      controller: controller,
      // toggleVisibilityOnTap: true,
      onShow: onShow,
      onHide: onHide,
      maxHeight: MediaQuery.of(context).size.height - 80 - 24,
      headerBar: const OperationsHeader(),
      body: BlocProvider<OperationsListBloc>(
        create: (context) => OperationsListBloc(context),
        child: _Operations(onClose: () {
          controller.hide();
        }),
      ),
    );
  }

  void hide() => controller.hide();
  void show() => controller.show();
}

class _Operations extends StatefulWidget {
  final VoidCallback onClose;
  _Operations({required this.onClose});

  @override
  _OperationsState createState() => _OperationsState();
}

class _OperationsState extends State<_Operations> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Style.lightGrayColor,
      child: Column(
        children: [
          Container(
            color: Style.accentColor,
            padding: const EdgeInsets.only(left: 16),
            height: 40,
            width: double.infinity,
            child: Stack(
              children: [
                Text(
                  Strings.title_operations,
                  style: const TextStyle(
                    color: Style.whiteColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      padding: const EdgeInsets.only(right: 16),
                      alignment: Alignment.topRight,
                      icon: const Icon(
                        Icons.close,
                        color: Style.whiteColor,
                      ),
                      onPressed: widget.onClose,
                    ))
              ],
            ),
          ),
          Expanded(child: OperationsList()),
        ],
      ),
    );
  }
}
