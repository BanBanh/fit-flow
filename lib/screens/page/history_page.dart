import 'package:fit_flow/data/model/history.dart';
import 'package:fit_flow/data/my_decor.dart';
import 'package:fit_flow/data/test.dart';
import 'package:fit_flow/widgets/custom_list_item.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = context.themeMode;

    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    final double pageWidth = screenWidth - 24 - 24;
    final double pageHeight = screenHeight - 24 - 48 - 24 - 72 - 24;

    return Container(
      width: pageWidth,
      height: pageHeight,
      decoration: BoxDecoration(
        color: MyDecor(isDarkMode).bg,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Container(
        width: pageWidth,
        height: pageHeight,
        decoration: BoxDecoration(
          color: MyDecor(isDarkMode).bg,
          borderRadius: BorderRadius.circular(24),
        ),
        padding: EdgeInsets.all(24),
        child: ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(18),
          child: SingleChildScrollView(
            child: Column(
              spacing: 24,
              children: [
                ...historiesTest.map((e) {
                  return _HistoryLiState(historyItem: e);
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _HistoryLiState extends StatefulWidget {
  const _HistoryLiState({required this.historyItem});
  final History historyItem;
  @override
  State<_HistoryLiState> createState() => __HistoryLiStateState();
}

class __HistoryLiStateState extends State<_HistoryLiState> {
  final ExpansibleController controller = ExpansibleController();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = context.themeMode;
    final History historyItem = widget.historyItem;
    final List<Widget> workOutList = historyItem.workOutList
        .map((key, value) {
          return MapEntry(key, CListItem(title: key));
        })
        .values
        .toList();
    return ExpansionTile(
      controller: controller,
      tilePadding: EdgeInsets.zero,
      childrenPadding: EdgeInsets.only(bottom: 10),
      showTrailingIcon: false,
      expansionAnimationStyle: AnimationStyle(
        duration: Duration(milliseconds: 75),
      ),
      title: CListItem(
        title: historyItem.date.toString(),
        border: Border.symmetric(
          vertical: BorderSide(
            width: 5,
            color: MyDecor(isDarkMode).borderMuted,
          ),
        ),
        verticalBorder: 10,
      ),
      children: historyItem.workOutList.isNotEmpty ? workOutList : [],
    );
  }
}
