import 'package:flutter/material.dart';
import 'package:frail_training_app/common/functions.dart';
import 'package:frail_training_app/screens/select.dart';
import 'package:frail_training_app/screens/title.dart';
import 'package:frail_training_app/widgets/dialog_button.dart';
import 'package:frail_training_app/widgets/finish_list.dart';
import 'package:frail_training_app/widgets/setting_list.dart';

class StepsDialog extends StatelessWidget {
  final int steps;

  const StepsDialog({
    required this.steps,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center(child: Text('お疲れ様！')),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$steps 歩の運動を計測しました。本アプリに加算します。',
            style: const TextStyle(
              color: Color(0xFF212121),
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DialogButton(
                label: '閉じる',
                backgroundColor: Colors.grey,
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SettingDialog extends StatelessWidget {
  const SettingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center(child: Text('アプリの設定')),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SettingList(
            label: '名前の変更',
            onTap: () {},
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DialogButton(
                label: 'タイトルに戻る',
                backgroundColor: Colors.cyan,
                onPressed: () => replaceScreen(
                  context,
                  const TitleScreen(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FinishDialog extends StatelessWidget {
  const FinishDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center(child: Text('ゲーム結果：成功')),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FinishList(label: '消費歩数', value: '-10 歩'),
          const FinishList(label: '獲得歩数', value: '+100 歩', noTopBorder: true),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DialogButton(
                label: 'ゲーム選択に戻る',
                backgroundColor: Colors.cyan,
                onPressed: () async {
                  int steps = await getPrefsInt('steps') ?? 0;
                  steps -= 10;
                  steps += 100;
                  await setPrefsInt('steps', steps);
                  // ignore: use_build_context_synchronously
                  replaceScreen(context, const SelectScreen());
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
