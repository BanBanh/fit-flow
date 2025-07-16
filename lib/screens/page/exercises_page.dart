// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:fit_flow/data/model/exercise.dart';
import 'package:fit_flow/data/my_decor.dart';
import 'package:fit_flow/data/test.dart';
import 'package:fit_flow/widgets/custom_list_item.dart';

ValueNotifier<bool> exerciseRemoveNotifier = ValueNotifier(false);

class ExercisesPage extends StatefulWidget {
  const ExercisesPage({super.key});

  @override
  State<ExercisesPage> createState() => _ExercisesPageState();
}

class _ExercisesPageState extends State<ExercisesPage> {
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
      padding: EdgeInsets.all(24),
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(18),
        child: SingleChildScrollView(
          child: ValueListenableBuilder(
            valueListenable: exerciseRemoveNotifier,
            builder: (context, value, child) {
              return Column(
                spacing: 24,
                // children: exercises.indexed
                //     .map((e) => ExerciseItem(index: e.$1, exercise: e.$2))
                //     .toList(),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: ExerciseList(Category.upperBody),
                  ),
                  ExerciseList(Category.core),
                  ExerciseList(Category.lowerBody),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class ExerciseList extends StatefulWidget {
  const ExerciseList(this.category, {super.key});
  final Category category;
  @override
  State<ExerciseList> createState() => _ExerciseListState();
}

class _ExerciseListState extends State<ExerciseList> {
  final ExpansibleController controller = ExpansibleController();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = context.themeMode;
    final Category category = widget.category;
    final String categoryStr = switch (category) {
      Category.core => 'Core',
      Category.upperBody => 'Upper Body',
      Category.lowerBody => 'Lower Body',
    };
    final List<(int, Exercise)> exercises = exercisesTest.indexed
        .where((element) => element.$2.category == category)
        .toList();
    final int exercisesLength = exercises.length;
    return ExpansionTile(
      controller: controller,
      tilePadding: EdgeInsets.zero,
      childrenPadding: EdgeInsets.only(bottom: 10),
      showTrailingIcon: false,
      expansionAnimationStyle: AnimationStyle(
        duration: Duration(milliseconds: 75),
      ),
      title: CListItem(
        title: categoryStr,
        border: Border.symmetric(
          vertical: BorderSide(
            width: 5,
            color: MyDecor(isDarkMode).borderMuted,
          ),
        ),
        verticalBorder: 10,
      ),
      children: [
        FilledButton(
          onPressed: () {},
          style: FilledButton.styleFrom(
            backgroundColor: MyDecor(isDarkMode).primaryColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.add, size: 36)],
          ),
        ),
        SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: MyDecor(isDarkMode).bgLight,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: exercises.indexed
                .map(
                  (e) => ExerciseItem(
                    index0: e.$1,
                    index1: e.$2.$1,
                    exercise: e.$2.$2,
                    exercisesLength: exercisesLength,
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}

class ExerciseItem extends StatefulWidget {
  const ExerciseItem({
    super.key,
    required this.index0,
    required this.index1,
    required this.exercisesLength,
    required this.exercise,
  });
  final int index0;
  final int index1;
  final int exercisesLength;
  final Exercise exercise;

  @override
  State<ExerciseItem> createState() => _ExerciseItemState();
}

class _ExerciseItemState extends State<ExerciseItem> {
  double dragOffset = 0.0;
  @override
  Widget build(BuildContext context) {
    final Exercise exercise = widget.exercise;
    final int index = widget.index1;
    final bool isDarkMode = context.themeMode;
    final List<Widget> widgetsChild = exercise.personalRecord
        .toMap()
        .map((key, value) {
          MapEntry<String, Widget?> result = MapEntry(key, null);
          if (value != null) {
            result = MapEntry(key, CListItemItem(text: '$key: $value'));
          }
          return result;
        })
        .values
        .where((element) => element != null)
        .map((e) => e ?? SizedBox.shrink())
        .toList();
    final List<Widget> widgets = [
      if (exercise.lastPerformed != null)
        CListItemItem(
          text: 'Last Performed: ${exercise.lastPerformed.toString()}',
        ),
      if (widgetsChild.isNotEmpty)
        Wrap(spacing: 6, runSpacing: 6, children: widgetsChild),
    ];
    return CListItem(
      title: exercise.name,
      titleRight: GestureDetector(
        onTap: () {
          exercisesTest.removeAt(index);
          exerciseRemoveNotifier.value = !exerciseRemoveNotifier.value;
        },
        child: Icon(Icons.delete, color: MyDecor(isDarkMode).red, size: 28),
      ),
      border: Border(
        top: widget.index0 == 0
            ? BorderSide(width: 5, color: MyDecor(isDarkMode).border)
            : BorderSide.none,
        bottom: widget.index0 == widget.exercisesLength - 1
            ? BorderSide(width: 5, color: MyDecor(isDarkMode).border)
            : BorderSide.none,
      ),
      widgets: widgets.isNotEmpty ? widgets : null,
    );
  }
}
