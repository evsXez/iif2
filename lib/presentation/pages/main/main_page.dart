import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iif/presentation/blocs/accounts_bloc/accounts_bloc.dart';
import 'package:iif/presentation/blocs/main_page_fab_bloc/main_page_fab_state.dart';
import 'package:iif/presentation/include.dart';
import 'package:iif/presentation/pages/add_operation/add_operation_page.dart';
import 'package:iif/presentation/pages/main/widgets/accounts.dart';
import 'package:iif/presentation/pages/main/widgets/header.dart';
import 'package:iif/presentation/pages/main/widgets/operations_bottom_sheet.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isBottomSheetOpened = false;
  late OperationsBottomSheet operationsBottomSheet;

  @override
  void initState() {
    super.initState();
    operationsBottomSheet = OperationsBottomSheet(
      onShow: _onBottomSheetShow,
      onHide: _onBottomSheetHide,
    );
  }

  @override
  Widget build(BuildContext context) {
    Strings.init(context);

    return WillPopScope(
      onWillPop: _onWillPop,
      child: BlocProvider<MainPageFabBloc>(
        create: (context) => MainPageFabBloc(context),
        child: BlocBuilder<MainPageFabBloc, MainPageFabState>(
          builder: (context, fabState) {
            return Scaffold(
              appBar: Header(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const SettingsPage())),
              ),
              backgroundColor: Style.lightGrayColor,
              body: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CustomScrollView(
                    slivers: [
                      SliverList(
                        delegate: SliverChildListDelegate(
                          [
                            Column(
                              children: [
                                const SizedBox(height: 20),
                                BlocProvider(
                                  create: (context) => AccountsBloc(context),
                                  child: Accounts(),
                                ),
                              ],
                            ),
                            const SizedBox(height: 24),
                          ],
                        ),
                      )
                    ],
                  ),
                  Visibility(
                    visible: fabState.map(
                      hidden: (_) => false,
                      shown: (_) => true,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: TextButton(
                        onPressed: () {
                          operationsBottomSheet.show();
                        },
                        child: Text(
                          Strings.swipe_to_reveal,
                          style: const TextStyle(
                            color: Style.grayColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              bottomSheet: Visibility(
                visible: fabState.map(
                  hidden: (_) => false,
                  shown: (_) => true,
                ),
                child: operationsBottomSheet,
              ),
              floatingActionButton: fabState.map(
                hidden: (_) => null,
                shown: (_) => !isBottomSheetOpened
                    ? FloatingActionButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (_) => const AddOperationPage()));
                        },
                        backgroundColor: Style.whiteColor,
                        child: const Icon(Icons.add, color: Style.accentColor),
                      )
                    : null,
              ),
            );
          },
        ),
      ),
    );
  }

  void _onBottomSheetShow() {
    setState(() {
      isBottomSheetOpened = true;
    });
  }

  void _onBottomSheetHide() {
    setState(() {
      isBottomSheetOpened = false;
    });
  }

  Future<bool> _onWillPop() {
    if (isBottomSheetOpened) {
      operationsBottomSheet.hide();
      return Future.value(false);
    }
    return Future.value(true);
  }
}
