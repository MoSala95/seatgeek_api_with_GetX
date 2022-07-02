
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class VerticalListShimmerWidget extends StatelessWidget {
  VerticalListShimmerWidget() : super();

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.all(0),
      itemCount: 6,
      itemBuilder: (BuildContext context, int index) {
        return  Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          margin:  EdgeInsets.symmetric(horizontal: 10),
          // height: 155.h,
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      color:  Colors.white,
                      width: 1)),
              color:  Colors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: const CustomWidget.rectangular(height: 120,
                  width: 100),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child:  Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        CustomWidget.rectangular(height: 10,
                          width: 100),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        CustomWidget.rectangular(height: 10,
                          width: 150,),
                      ],
                    ),
                    const SizedBox(
                      height: 15
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        CustomWidget.rectangular(height: 10,
                          width: 150,),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}


class CustomWidget extends StatelessWidget {

  final double width;
  final double height;
  final ShapeBorder shapeBorder;

  const CustomWidget.rectangular({
    this.width = double.infinity,
    required this.height
  }): this.shapeBorder = const RoundedRectangleBorder();

  const CustomWidget.circular({
    this.width = double.infinity,
    required this.height,
    this.shapeBorder = const CircleBorder()
  });

  @override
  Widget build(BuildContext context)  => Shimmer.fromColors(
    baseColor: Colors.grey[350]!,
    highlightColor: Colors.grey[300]!,
    period: Duration(seconds: 2),
    child: Container(
      width: width,
      height: height,
      decoration: ShapeDecoration(
        color: Colors.grey[400]!,
        shape: shapeBorder,

      ),
    ),
  );
}