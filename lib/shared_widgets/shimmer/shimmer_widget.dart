import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

// ignore: must_be_immutable
class ShimmerWidget extends StatelessWidget {
  final bool isGrid;
   final Widget widget;

  ShimmerWidget({
    required this.isGrid,
     required this.widget,
    });
  int offset = 0;
  int time = 1000;

  @override
  Widget build(BuildContext context) {
    return buildListView(this.time, this.offset);
  }

  Widget buildWidgetView({required Widget child}) {
    offset += 5;
    time = 800 + offset;
    return Shimmer.fromColors(
      highlightColor:  Colors.grey[200]!,
      baseColor:  Colors.grey[350]!,
      child: child,
      period: Duration(milliseconds: time),
    );
  }

  Widget buildListView(int time, int offset) {

    return  widget;
  }
}
