import 'package:blumenau/core/config/page_view_config.dart';
import 'package:blumenau/core/style/blumenau_duration.dart';
import 'package:flutter/material.dart';
import 'package:gesture_x_detector/gesture_x_detector.dart';

class PageViewGestureWrapper extends StatefulWidget {
  const PageViewGestureWrapper({
    super.key,
    required this.pageController,
    required this.child,
  });

  final PageController pageController;
  final Widget child;

  @override
  State<PageViewGestureWrapper> createState() => _PageViewGestureWrapperState();
}

class _PageViewGestureWrapperState extends State<PageViewGestureWrapper> {
  double _startX = 0;

  @override
  Widget build(BuildContext context) {
    return XGestureDetector(
        onMoveStart: (details) {
          _startX = details.localPos.dx;
        },
        onMoveUpdate: (details) {
          double deltaX = details.localPos.dx - _startX;
          if (deltaX > 0 &&
              deltaX > PageViewConfig.instance.pageViewSensability) {
            widget.pageController.previousPage(
              duration: BlumenauDuration.animationDuration,
              curve: Curves.easeInOut,
            );
          } else if (deltaX < 0 &&
              deltaX < -PageViewConfig.instance.pageViewSensability) {
            widget.pageController.nextPage(
              duration: BlumenauDuration.animationDuration,
              curve: Curves.easeInOut,
            );
          } else {
            widget.pageController.jumpTo(
              widget.pageController.offset - deltaX,
            );
            _startX = details.localPos.dx;
          }
        },
        child: widget.child);
  }
}
