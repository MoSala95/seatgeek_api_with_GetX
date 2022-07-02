
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_events_app/globals/global_enums.dart';
import 'package:live_events_app/shared_widgets/shimmer/shimmer_widget.dart';


class AppStateHandlerWidget extends StatelessWidget {
   final Widget child;
  final LoadingState state;
  final bool isGridShimmer;
  final bool withShimmerPadding;
  final Widget? onEmpty;
  final Widget? onWaiting;
  final Widget? shimmerWidget;

  final bool isShimmer;


  AppStateHandlerWidget(
      {required this.child,
        required this.state,
         this.isGridShimmer: false,
         this.onEmpty,
        this.onWaiting,
        this.withShimmerPadding: false,
        this.shimmerWidget,
         this.isShimmer = false,
      }
        );

  @override
  Widget build(BuildContext context) {
    return  Stack(
        children: [
          child,

            if (state == LoadingState.waiting )
            isShimmer == true
                ? ShimmerWidget(
              isGrid: isGridShimmer,
               widget: shimmerWidget ?? const SizedBox(),

            )
                :
               const Center(
                child: CircularProgressIndicator()

            )
          else if (state == LoadingState.error)
              const Center(child: Text("Error , something went wrong", style: TextStyle(color: Colors.red),))
            else if (state == LoadingState.empty)
              const Center(child: Text("there is nothing to show"))
]
    );
  }

}
