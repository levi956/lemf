import 'dart:io';

import 'package:floating/floating.dart';
import 'package:flutter/material.dart';
import 'package:lemfy_task_in_flutter/injectable.dart';


class PictureInPictureWrapper extends StatefulWidget {
  final Widget body;

  const PictureInPictureWrapper({
    super.key,
    required this.body,
  });

  @override
  State<PictureInPictureWrapper> createState() =>
      _PictureInPictureWrapperState();
}

class _PictureInPictureWrapperState extends State<PictureInPictureWrapper>
    with WidgetsBindingObserver {
  final floating = getIt<Floating>();

  bool isPipEnabled = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    floating.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState lifecycleState) {
    if (lifecycleState == AppLifecycleState.resumed) {
      setState(() {
        isPipEnabled = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? PiPSwitcher(
            floating: floating,
            childWhenEnabled: const CircleAvatar(
              backgroundColor: Colors.red,
            ),
            childWhenDisabled: widget.body,
          )
        : widget.body;
  }
}

Future<void> enablePip() async {
  final floating = getIt<Floating>();
  bool deviceSupport = await floating.isPipAvailable;
  if (deviceSupport) {
    const rational = Rational.landscape();
    final status = await floating.enable(
      aspectRatio: rational,
    );
    debugPrint('PiP enabled? $status');
    return;
  }

  debugPrint("this is device support ---> $deviceSupport");
}
