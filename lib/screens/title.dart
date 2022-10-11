import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frail_training_app/common/functions.dart';
import 'package:frail_training_app/common/styles.dart';
import 'package:frail_training_app/screens/select.dart';
import 'package:frail_training_app/widgets/animation_background.dart';

class TitleScreen extends StatefulWidget {
  const TitleScreen({Key? key}) : super(key: key);

  @override
  State<TitleScreen> createState() => _TitleScreenState();
}

class _TitleScreenState extends State<TitleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => replaceScreen(context, const SelectScreen()),
          child: SizedBox(
            height: double.infinity,
            child: Stack(
              children: [
                const AnimationBackground(),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: const [
                          Text('フレイル予防', style: kTitleStyle),
                          Text('トレーニング', style: kTitleStyle),
                        ],
                      ),
                      const Text(
                        '画面をタップしてはじめましょう',
                        style: kMessageStyle,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
