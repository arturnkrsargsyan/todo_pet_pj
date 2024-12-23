import 'package:flutter/material.dart';
import 'package:todo_app/presentation/core/consts/typography.dart';

class TaskTail extends StatelessWidget {
  const TaskTail({
    super.key,
    required this.tailTitle,
    required this.tailDescription,
    required this.tailDayStartData,
    required this.tailMonthStartData,
    required this.tailDayEndData,
    required this.tailMonthEndData,
  });
  final String tailTitle;
  final String tailDescription;
  final String tailDayStartData;
  final String tailMonthStartData;
  final String tailDayEndData;
  final String tailMonthEndData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            )),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tailTitle,
                style: AppTypography.s25w6h20W,
              ),
              Text(tailDescription, style: AppTypography.s18wh70h20),
              Row(
                children: [
                  Row(
                    children: [
                      Text(
                        tailDayStartData,
                        style: AppTypography.s16w5h1w,
                      ),
                      const Text(
                        '.',
                        style: AppTypography.s16w5h1w,
                      ),
                      Text(
                        tailMonthStartData,
                        style: AppTypography.s16w5h1w,
                      ),
                    ],
                  ),
                  const Text(
                    '/',
                    style: AppTypography.s16w5h1w,
                  ),
                  Row(
                    children: [
                      Text(
                        tailDayEndData,
                        style: AppTypography.s16w5h1w,
                      ),
                      const Text(
                        '.',
                        style: AppTypography.s16w5h1w,
                      ),
                      Text(
                        tailMonthEndData,
                        style: AppTypography.s16w5h1w,
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
