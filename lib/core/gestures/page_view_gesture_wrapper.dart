/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

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
  late double _startPositionX;

  @override
  Widget build(BuildContext context) {
    return XGestureDetector(
      onMoveStart: _handleMoveStart,
      onMoveUpdate: _handleMoveUpdate,
      onMoveEnd: _handleMoveEnd,
      child: widget.child,
    );
  }

  void _handleMoveStart(MoveEvent details) {
    _startPositionX = details.localPos.dx;
  }

  void _handleMoveUpdate(MoveEvent details) {
    double deltaX = details.localPos.dx - _startPositionX;
    if (_shouldMoveToPreviousPage(deltaX)) {
      widget.pageController.previousPage(
        duration: BlumenauDuration.animationDuration,
        curve: Curves.easeInOut,
      );
    } else if (_shouldMoveToNextPage(deltaX)) {
      widget.pageController.nextPage(
        duration: BlumenauDuration.animationDuration,
        curve: Curves.easeInOut,
      );
    } else {
      widget.pageController.jumpTo(
        widget.pageController.offset - deltaX,
      );
      _startPositionX = details.localPos.dx;
    }
  }

  void _handleMoveEnd(MoveEvent details) {
    double deltaX = details.localPos.dx - _startPositionX;
    if (_shouldMoveToPreviousPage(deltaX)) {
      widget.pageController.previousPage(
        duration: BlumenauDuration.animationDuration,
        curve: Curves.easeInOut,
      );
    } else if (_shouldMoveToNextPage(deltaX)) {
      widget.pageController.nextPage(
        duration: BlumenauDuration.animationDuration,
        curve: Curves.easeInOut,
      );
    } else {
      widget.pageController.animateTo(
        widget.pageController.offset,
        duration: BlumenauDuration.animationDuration,
        curve: Curves.easeInOut,
      );
    }
  }

  bool _shouldMoveToPreviousPage(double deltaX) {
    return deltaX > 0 && deltaX > PageViewConfig.instance.pageViewSensitivity;
  }

  bool _shouldMoveToNextPage(double deltaX) {
    return deltaX < 0 && deltaX < -PageViewConfig.instance.pageViewSensitivity;
  }
}

// trypin
// App name uppercase
// weather
// integration test
// update service