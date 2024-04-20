import 'package:flutter/material.dart';
import 'package:lemfy_task_in_flutter/app/modules/students/presentation/pages/student_list_page.dart';
import 'package:lemfy_task_in_flutter/core/compass/compass.dart';
import 'package:lemfy_task_in_flutter/injectable.dart';

import '../../../../core/framework/navigation.dart';
import '../service/pusher_service.dart';

class FailedEventPage extends StatefulWidget {
  const FailedEventPage({super.key});

  @override
  State<FailedEventPage> createState() => _FailedEventPageState();
}

class _FailedEventPageState extends State<FailedEventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () =>
                  pushToAndClearStack(context, const StudentListPage()),
              child: const Text("back"),
            ),
            ElevatedButton(
              onPressed: () => DialogSheetFunction.showUpDialog(
                child: const DialogSomething(),
              ),
              child: const Text("dialog"),
            ),
          ],
        ),
      ),
    );
  }
}

class DialogSheetFunction {
  static void showUpDialog<T>({
    required Widget child,
  }) {
    var context = getIt<Compass>().navigatorKey.currentContext!;
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Dialog(
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 14,
          ),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: child,
        );
      },
    );
  }
}
