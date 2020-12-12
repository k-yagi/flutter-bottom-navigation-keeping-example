import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../pages/pages.dart';

class _TabInfo {
  const _TabInfo(this.label, this.icon, this.page);

  final String label;
  final IconData icon;
  final Widget page;
}

class BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tabInfo = [
      _TabInfo(
        'Home',
        Icons.home,
        HomePage()
      ),
      _TabInfo(
        'Navigators',
        Icons.navigation,
        NavigatorPage()
      )
    ];

    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: tabInfo.map((e) {
          return BottomNavigationBarItem(label: e.label, icon: Icon(e.icon));
        }).toList(),
        border: Border(
          top: BorderSide(color: Theme.of(context).dividerColor),
        ),
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) {
            // タブ内のウィジェットがtabBarに覆われてしまうため、SafeAreaでナビゲーションバー分のパディングを取ります
            return SafeArea(
              // タブごとの表示内容のウィジェットを指定します
              child: tabInfo[index].page,
              // ステータスバー分のパディングを取ろうとするので無効にします
              top: false,
            );
          }
        );
      },
    );
  }
}
