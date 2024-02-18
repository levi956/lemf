import 'package:flutter/material.dart';
import 'package:lemfy_task_in_flutter/app/modules/pusher/presentation/failed_event_page.dart';
import 'package:lemfy_task_in_flutter/app/modules/pusher/service/pusher_service.dart';
import 'package:lemfy_task_in_flutter/core/compass/compass.dart';
import 'package:lemfy_task_in_flutter/injectable.dart';

class FailedEventRoute extends MaterialPageRoute<bool> {
  FailedEventRoute() : super(builder: (_) => const FailedEventPage());
}

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async => await begin(),
              child: const Text("Initialize Service"),
            ),
            ElevatedButton(
              onPressed: () async => await end(),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
              child: const Text("End Service"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => getIt<Compass>().push(FailedEventRoute()),
              child: const Text("Next"),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> begin() async {
    showLoader(context);
    final service = await PusherService.initializePusher();
    if (mounted) {
      Navigator.pop(context);
    }

    if (service) {
      print('Service somehow initialized?');
      return;
    }
    print('service failed o');
  }

  Future<void> end() async {
    showLoader(context);
    final service = await PusherService.disconnect();
    if (mounted) {
      Navigator.pop(context);
    }
    if (service) {
      print('Service somehow initialized?');
      return;
    }
    print('service failed o');
  }
}

Future<void> showLoader(BuildContext context) async {
  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => const CircularProgressIndicator.adaptive(),
  );
}
