import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:tinder_clone/components/match_profile_modal.dart';
import 'package:tinder_clone/components/my_bottom_app_bar.dart';
// import 'package:tinder_clone/components/my_tinder_clone_creation_tab.dart';
import 'package:tinder_clone/components/my_map.dart';

class HomePageMobileScaffold extends StatelessWidget {
  final _tinder_cloneTabController = PageController();
  HomePageMobileScaffold({super.key});

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
          onPressed: () {
            showBottomSheet(
                showDragHandle: true,
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(25.0)),
                ),
                builder: (
                  context,
                ) =>
                    Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surface,
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(25))),
                      height: MediaQuery.of(context).size.height / 1.6,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          PlatformText(
                              "Let's get you started creating a tinder_clone!"),
                          // SizedBox(
                          //   height: MediaQuery.of(context).size.height / 1.8,
                          //   child: PageView(
                          //     controller: _tinder_cloneTabController,
                          //     children: const [
                          //       // tinder_cloneCreationScreen(),
                          //       // tinder_cloneCreationScreen()
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),
                    ));
          },
          shape: const CircleBorder(),
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        // body: const MyMap(),
        body: Center(
            child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(25))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 1.5,
                child: PageView(
                  controller: _tinder_cloneTabController,
                  children: const [
                    MatchProfileModal()
                    // tinder_cloneCreationScreen()
                  ],
                ),
              ),
            ],
          ),
        )),
        // drawer: const MyDrawer(),
        bottomNavBar: const MyBottomAppBar(),
      ),
      cupertino: (_, __) => CupertinoPageScaffoldData(body: const MyMap()),
    );
  }
}
