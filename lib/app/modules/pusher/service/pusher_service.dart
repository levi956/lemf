import 'package:flutter/material.dart';
import 'package:lemfy_task_in_flutter/app/modules/pusher/presentation/failed_event_page.dart';
import 'package:lemfy_task_in_flutter/app/modules/pusher/presentation/start_page.dart';
import 'package:lemfy_task_in_flutter/core/compass/compass.dart';
import 'package:lemfy_task_in_flutter/injectable.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

class PusherService {
  static Future<bool> initializePusher() async {
    final pusherClient = getIt<PusherChannelsFlutter>();
    try {
      await pusherClient.init(
        apiKey: '5a1b281db31a508b390a',
        cluster: 'mt1',
        logToConsole: true,
        onEvent: (event) {
          handlePusherEvent(event);
        },
        onError: (message, code, error) {
          getIt<Compass>().push(FailedEventRoute());
        },
      );

      await pusherClient.subscribe(
        channelName: "my-channel",
      );

      await pusherClient.connect();

      print(pusherClient.connectionState);

      return true;
    } catch (e) {
      print("ERROR: $e");
      return false;
    }
  }

  static Future<bool> disconnect() async {
    try {
      final pusherClient = getIt<PusherChannelsFlutter>();
      await pusherClient.unsubscribe(channelName: 'my-channel');
      await pusherClient.disconnect();

      print(pusherClient.connectionState);
      return true;
    } catch (e) {
      print("ERROR: $e");
      return false;
    }
  }
}

void handlePusherEvent(PusherEvent event) {
  switch (event.eventName) {
    case 'success':
      handleSuccessEvent();
      break;
    case 'failed':
      handleFailedEvent();
      break;
    case 'found':
      handleFoundEvent();
      break;
    // Add more cases as needed

    default:
      // Handle default case or unknown events
      break;
  }
}

void handleSuccessEvent() {
  getIt<Compass>().push(FailedEventRoute());
}

void handleFailedEvent() {}

void handleFoundEvent() {
  DialogSheetFunction.showUpDialog(
    child: const DialogSomething(),
  );
}

class DialogSomething extends StatelessWidget {
  const DialogSomething({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          "Found Provider",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
