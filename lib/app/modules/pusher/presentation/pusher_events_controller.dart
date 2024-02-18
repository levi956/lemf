// import 'package:injectable/injectable.dart';
// import 'package:lemfy_task_in_flutter/app/modules/pusher/service/pusher_service.dart';
// import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
// import 'package:rxdart/rxdart.dart';

// @lazySingleton
// class PusherEventsController {
//   final Sink<String> _sink;
//   final Stream<PusherEvent?> stream;

//   PusherEventsController._({
//     required Sink<String> sink,
//     required this.stream,
//   }) : _sink = sink;

//   factory PusherEventsController() {
//     final subject = BehaviorSubject<String>();
//     final subjecStream = subject.distinct().switchMap<PusherEvent?>((value) {
//       return Rx.fromCallable(() => PusherService.initializePusher())
//           .map<PusherEvent?>(
//         (event) {
//           return event;
//         },
//       );
//     });

//     return PusherEventsController._(
//       sink: subject,
//       stream: subjecStream,
//     );
//   }

//   initialize() {
//     _sink.add('nothing');
//   }
// }
