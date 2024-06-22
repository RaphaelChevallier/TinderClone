import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:tinder_clone/components/my_bottom_app_bar.dart';
import 'package:tinder_clone/components/my_drawer.dart';
import 'package:tinder_clone/components/my_map.dart';

class HomePageDesktopScaffold extends StatelessWidget {
  const HomePageDesktopScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
          backgroundColor: Colors.transparent,
          material: (_, __) =>
              MaterialAppBarData(forceMaterialTransparency: true),
          cupertino: (_, __) => CupertinoNavigationBarData(
                backgroundColor: Colors.transparent,
                border: null,
              )),
      material: (_, __) => MaterialScaffoldData(
        extendBodyBehindAppBar: true,
        extendBody: true,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          shape: const CircleBorder(),
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: const MyMap(),
        drawer: const MyDrawer(),
        bottomNavBar: const MyBottomAppBar(),
      ),
      cupertino: (_, __) => CupertinoPageScaffoldData(body: const MyMap()),
    );
  }
}
