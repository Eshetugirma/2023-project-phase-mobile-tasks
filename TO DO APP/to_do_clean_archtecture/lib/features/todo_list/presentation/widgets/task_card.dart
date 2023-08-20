import 'package:flutter/material.dart';
import '../../../../core/presentation/util/input_converter.dart';
import '../../../../injection_container.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final DateTime deadline;
  final bool completed;

  const TaskCard(
      {super.key,
      required this.title,
      required this.deadline,
      required this.completed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.surface.withOpacity(1),
            blurRadius: 5,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.surface,
              child: Text(title.isNotEmpty ? title[0] : ''),
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    overflow: TextOverflow.ellipsis,
                  ),
            ),
            Row(
              children: [
                Text(
                  serviceLocator<InputConverter>().dateTimeToString(deadline),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        overflow: TextOverflow.ellipsis,
                      ),
                ),
                SizedBox(
                  height: 30,
                  child: VerticalDivider(
                    thickness: 2,
                    color: completed ? Colors.green : Colors.red,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
