import 'package:countdown_timer/size_config.dart';
import 'package:flutter/material.dart';

import 'components/countdowntimer.dart';

class AudioCall extends StatelessWidget {
  const AudioCall({super.key});

  @override
  Widget build(BuildContext context) {
    //responsive
    SizeConfig().init(context);
    return const Scaffold(
      body: CountDownTimer(),
    );
  }
}
