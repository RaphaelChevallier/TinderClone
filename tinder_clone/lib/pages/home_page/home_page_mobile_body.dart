import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:swipable_stack/swipable_stack.dart';
import 'package:tinder_clone/components/match_profile_modal.dart';
import 'package:tinder_clone/components/my_bottom_app_bar.dart';
// import 'package:tinder_clone/components/my_tinder_clone_creation_tab.dart';
import 'package:tinder_clone/components/my_map.dart';

class HomePageMobileScaffold extends StatelessWidget {
  final _tinder_cloneTabController = PageController();

  HomePageMobileScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).colorScheme.surface;
    final mainColor = Theme.of(context).colorScheme.primary;

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
                          color: backgroundColor,
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(25))),
                      height: MediaQuery.of(context).size.height / 1.6,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          PlatformText(
                              "Let's get you started creating a tinder_clone!"),
                        ],
                      ),
                    ));
          },
          shape: const CircleBorder(),
          child: const Icon(Icons.person),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        // body: const MyMap(),
        body: Container(
          color: backgroundColor,
          child: Stack(
            children: [
              CustomPaint(
                painter: ShapesPainter(color: mainColor),
                child: Container(
                  height: 200,
                ),
              ),
              Center(
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(25)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 1.3,
                        child: SwipableStack(
                          horizontalSwipeThreshold: 0.8,
                          verticalSwipeThreshold: 0.8,
                          stackClipBehaviour: Clip.none,
                          onSwipeCompleted: (index, direction) {
                            print('$index, $direction');
                          },
                          detectableSwipeDirections: const {
                            SwipeDirection.right,
                            SwipeDirection.left,
                          },
                          builder: (context, properties) {
                            return const Stack(
                              children: [
                                MatchProfileModal(),
                                MatchProfileModal(),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        // drawer: const MyDrawer(),
        bottomNavBar: const MyBottomAppBar(),
      ),
      cupertino: (_, __) => CupertinoPageScaffoldData(body: const MyMap()),
    );
  }
}

const double _kCurveHeight = 35;

class ShapesPainter extends CustomPainter {
  final Color color;

  ShapesPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final p = Path();
    p.lineTo(0, size.height - _kCurveHeight);
    p.relativeQuadraticBezierTo(
        size.width / 2, 2 * _kCurveHeight, size.width, 0);
    p.lineTo(size.width, 0);
    p.close();

    canvas.drawPath(p, Paint()..color = color);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
