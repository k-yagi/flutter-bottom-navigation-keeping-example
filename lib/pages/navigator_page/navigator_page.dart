import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'navigator_screen.dart';

class NavigatorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigator Page'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: const Text('Inside tab view'),
              onPressed: () {
                // 通常通りNavigator.pushをするとCupertinoTabViewのNavigatorを参照するため
                // ナビゲーションバーが表示された状態で遷移します
                Navigator.of(context).push<void>(
                  MaterialPageRoute(builder: (context) => NavigatorScreen())
                );
              },
            ),
            ElevatedButton(
              child: const Text('Outside tab view'),
              onPressed: () {
                // 画面全体を覆いたい場合はrootNavigator: trueを指定します
                Navigator.of(context, rootNavigator: true).push<void>(
                  MaterialPageRoute(builder: (context) => NavigatorScreen())
                );
              },
            ),
            ElevatedButton(
              child: const Text('Horizontal slide animation'),
              onPressed: () {
                Navigator.of(context, rootNavigator: true).push<void>(
                  // 横からスライドするアニメーション
                  CupertinoPageRoute(builder: (context) => NavigatorScreen())
                );
              },
            ),
          ],
          mainAxisSize: MainAxisSize.min,
        )
      ),
    );
  }
}
