import 'package:floating/floating.dart';
import 'package:injectable/injectable.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

@module
abstract class PreModules {
  @lazySingleton
  PusherChannelsFlutter get pusherChannel =>
      PusherChannelsFlutter.getInstance();

  @lazySingleton
  Floating get floating => Floating();
}
