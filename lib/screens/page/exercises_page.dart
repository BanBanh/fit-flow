import 'dart:math';

import 'package:fit_flow/data/my_decor.dart';
import 'package:fit_flow/data/test.dart';
import 'package:fit_flow/widgets/custom_list_item.dart';
import 'package:flutter/material.dart';

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
          child: Column(
            spacing: 24,
            children: exercises.keys.map((name) => ExerciseItem(name)).toList(),
          ),
        ),
      ),
    );
  }
}

class ExerciseItem extends StatefulWidget {
  const ExerciseItem(this.index, {super.key});
  final String index;

  @override
  State<ExerciseItem> createState() => _ExerciseItemState();
}

class _ExerciseItemState extends State<ExerciseItem> {
  double dragOffset = 0.0;
  bool isSwiped = false;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(18),
      child: GestureDetector(
        onHorizontalDragUpdate: (details) {
          if (dragOffset + details.delta.dx <= 0 &&
              dragOffset + details.delta.dx > -100) {
            setState(() {
              dragOffset += details.delta.dx;
            });
          }
        },
        onHorizontalDragEnd: (details) {
          print(dragOffset);
          if (dragOffset < -50) {
            print('trash');
            setState(() => dragOffset = 0);
            // Swiped enough to show trash
            setState(() => isSwiped = true);
          } else {
            print('no trash');
            setState(() => dragOffset = 0); // Reset if not swiped enough
          }
        },

        child: Stack(
          children: [
            // Red background with trash icon (hidden initially)
            if (isSwiped || dragOffset < 0)
              Positioned.fill(
                child: AnimatedContainer(
                  duration: Duration(),
                  decoration: BoxDecoration(
                    color: Colors.red.withAlpha(
                      (-dragOffset / 100 * 255).ceil().clamp(0, 255),
                    ),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: 20),
                  child: Icon(Icons.delete, color: Colors.white),
                ),
              ),
            // The draggable item
            Transform.translate(
              offset: Offset(dragOffset, 0),
              child: CListItem(title: widget.index),
            ),
          ],
        ),
      ),
    );
  }
}
