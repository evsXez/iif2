import 'package:iif/presentation/include.dart';

class UiNotifierAccountEditorOpened extends ChangeNotifier {
  bool _isAccountEditorOpened = false;
  bool get isAccountEditorOpened => _isAccountEditorOpened;

  void editorOpened() {
    _isAccountEditorOpened = true;
    notifyListeners();
  }

  void editorClosed() {
    _isAccountEditorOpened = false;
    notifyListeners();
  }
}
