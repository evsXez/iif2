import 'package:flutter/material.dart';
import 'package:iif/domain/include.dart';
import 'package:iif/presentation/include.dart';

class Dialogs {
  final BuildContext context;
  Dialogs(this.context);

  void showArchiveLocationDialog(
      {required String accountName, required bool isArchiveAvailable, required VoidCallback onArchivePressed}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        title: Text(
          Strings.title_dialog_archive_location.replaceAll("<name>", accountName),
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          maxLines: 2,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              isArchiveAvailable
                  ? Strings.message_dialog_archive_location_available
                  : Strings.message_dialog_archive_location_unavailable,
              style: const TextStyle(
                fontWeight: FontWeight.w300,
              ),
              maxLines: 20,
            ),
            _ButtonsOkCancel(
              buttonOkText: Strings.option_archive,
              isButtonOkVisible: isArchiveAvailable,
              buttonOkOnPressed: onArchivePressed,
            ),
          ],
        ),
      ),
    );
  }

  void showDeleteLocationDialog({
    required Account account,
    required bool isDeleteAvailable,
    required VoidCallback onDeletePressed,
  }) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              title: Text(
                Strings.title_dialog_delete_location.replaceAll("<name>", account.name),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 2,
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  isDeleteAvailable
                      ? const SizedBox.shrink()
                      : Text(
                          Strings.message_dialog_delete_location_unavailable,
                          style: const TextStyle(
                            fontWeight: FontWeight.w300,
                          ),
                          maxLines: 20,
                        ),
                  _ButtonsOkCancel(
                    buttonOkText: Strings.option_delete,
                    isButtonOkVisible: isDeleteAvailable,
                    buttonOkOnPressed: onDeletePressed,
                  ),
                ],
              ),
            ));
  }

  // Widget get _buttonCancel => ;
  // Widget _buttonDelete(Location location) => FlatButton(
  //   onPressed: () { _deleteAccount(location); },
  //   child: StyleText(Strings.option_delete, fontSize: 16, fontWeight: FontWeight.w300,),
  // );

  // void _deleteAccount(Location location) async {
  //   await location.delete();
  //   LocalCache.update();
  //   context.navigationPop();
  // }

  // void _archiveAccount(Location location) async {
  //   await location.archive();
  //   LocalCache.update();
  //   context.navigationPop();
  // }

}

class _ButtonsOkCancel extends StatelessWidget {
  final String buttonOkText;
  final bool isButtonOkVisible;
  final VoidCallback buttonOkOnPressed;

  const _ButtonsOkCancel({
    required this.buttonOkText,
    required this.isButtonOkVisible,
    required this.buttonOkOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    final buttons = [
      _Button(
        label: Strings.cancel,
        onPressed: Navigation.pop,
      ),
    ];
    if (isButtonOkVisible) {
      buttons.add(
        _Button(
          label: buttonOkText,
          onPressed: () {
            Navigation.pop();
            buttonOkOnPressed();
          },
        ),
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: buttons,
    );
  }
}

class _Button extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  const _Button({
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
