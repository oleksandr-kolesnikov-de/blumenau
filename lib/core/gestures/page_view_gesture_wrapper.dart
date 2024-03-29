/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

import 'dart:core';
import 'package:blumenau/core/config/page_view_config.dart';
import 'package:blumenau/core/style/blumenau_duration.dart';
import 'package:flutter/material.dart';
import 'package:gesture_x_detector/gesture_x_detector.dart';

// [PageViewGestureWrapper] is a widget that wraps contnet of [PageView] widget and adds a gesture to it.
// It allows to swipe pages in [PageView] widget even if the content is not scrollable.

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
  late double _corePositionX;
  late double _startPositionX;
  late double _startOffset;
  late double _pageWidth;
  late double _velocity;

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
    _corePositionX = details.localPos.dx;
    _startPositionX = details.localPos.dx;
    _startOffset = widget.pageController.offset;
    _pageWidth = MediaQuery.of(context).size.width;
  }

  void _handleMoveUpdate(MoveEvent details) {
    double deltaX = details.localPos.dx - _startPositionX;
    _velocity = deltaX.abs();
    widget.pageController.jumpTo(
      (widget.pageController.offset - deltaX > 0)
          ? (widget.pageController.offset - deltaX <
                  widget.pageController.position.maxScrollExtent)
              ? widget.pageController.offset - deltaX
              : widget.pageController.position.maxScrollExtent
          : 0,
    );
    _startPositionX = details.localPos.dx;
  }

  void _handleMoveEnd(MoveEvent details) {
    double deltaX = details.localPos.dx - _corePositionX;
    if (_shouldMoveToPreviousPage(deltaX)) {
      widget.pageController.animateTo(
        (_startOffset - _pageWidth > 0) ? _startOffset - _pageWidth : 0,
        duration: BlumenauDuration.animationDuration,
        curve: Curves.easeInOut,
      );
    } else if (_shouldMoveToNextPage(deltaX)) {
      widget.pageController.animateTo(
        _startOffset + _pageWidth,
        duration: BlumenauDuration.animationDuration,
        curve: Curves.easeInOut,
      );
    } else {
      widget.pageController.animateTo(
        _startOffset,
        duration: BlumenauDuration.animationDuration,
        curve: Curves.easeInOut,
      );
    }
  }

  bool _shouldMoveToPreviousPage(double deltaX) {
    return deltaX > PageViewConfig.instance.distanceSensitivity ||
        (deltaX > 0 && _velocity > PageViewConfig.instance.velocitySensitivity);
  }

  bool _shouldMoveToNextPage(double deltaX) {
    return deltaX < -PageViewConfig.instance.distanceSensitivity ||
        (deltaX < 0 && _velocity > PageViewConfig.instance.velocitySensitivity);
  }
}

// App name uppercase
// clean code!
// test doesn't work
// hide api keys
// weather use case
// integration test