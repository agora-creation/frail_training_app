import 'package:flutter/material.dart';
import 'package:frail_training_app/common/dialogs.dart';
import 'package:frail_training_app/common/functions.dart';
import 'package:frail_training_app/screens/wait/home.dart';
import 'package:frail_training_app/widgets/animation_background.dart';
import 'package:frail_training_app/widgets/footer.dart';
import 'package:frail_training_app/widgets/select_panel.dart';
import 'package:frail_training_app/widgets/steps_button.dart';

class SelectScreen extends StatefulWidget {
  const SelectScreen({Key? key}) : super(key: key);

  @override
  State<SelectScreen> createState() => _SelectScreenState();
}

class _SelectScreenState extends State<SelectScreen>
    with WidgetsBindingObserver {
  int nowSteps = 0;

  void _init() async {
    int getSteps = await openApp();
    if (getSteps != 0) {
      showDialog(
        context: context,
        builder: (_) => StepsDialog(steps: getSteps),
      );
      int befSteps = await getPrefsInt('steps') ?? 0;
      int steps = befSteps + getSteps;
      await setPrefsInt('steps', steps);
    }
    int steps = await getPrefsInt('steps') ?? 0;
    setState(() => nowSteps = steps);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _init();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    changeApp(context, state);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('テスト太郎'),
        actions: [
          StepsButton(steps: nowSteps),
        ],
      ),
      body: Stack(
        children: [
          const AnimationBackground(),
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          SelectPanel(
                            title: '5秒待つゲーム',
                            subtitle: '消費歩数: 10 歩',
                            onTap: () => replaceScreen(
                              context,
                              const WaitHomeScreen(),
                            ),
                          ),
                          SelectPanel(
                            title: 'マルバツゲーム',
                            subtitle: '消費歩数: 10 歩',
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Footer(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => const SettingDialog(),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
