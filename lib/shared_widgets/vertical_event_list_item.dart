
import 'package:flutter/material.dart';

import 'package:live_events_app/globals/helpers.dart';
import 'package:live_events_app/models/events_response_model.dart';


class VerticalEventWidget extends StatelessWidget {
   final Event event;
  final Function() onCardPressed;
   final Function() onFavoritePressed;

   final bool isFavorite;
   final double? imageWidth;
  final double? imageHeight;

  const VerticalEventWidget({Key? key,
     required this.event,
     this.imageHeight,
    this.imageWidth,
    this.isFavorite=false,
   required this.onCardPressed,
    required this.onFavoritePressed,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      child: GestureDetector(
        onTap:onCardPressed,
        child: Container(

          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      color: Colors.white,
                      width: 1)),
              color:Colors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0,top: 15),
                    child: ClipRRect(
                      borderRadius:  BorderRadius.circular(8),
                        child: Image.asset("assets/images/stadium.jpeg",height: 130,width: 100,fit: BoxFit.fill,)
                    ),
                  ),
                    Positioned(top:0 ,
                     left:0,
                     child:IconButton(
                       onPressed: onFavoritePressed,
                         icon:isFavorite? const Icon(Icons.favorite,color: Colors.red,):const Icon(Icons.favorite,color: Colors.grey,))
                 )

                ],
              ),
              const SizedBox(
                width: 16
              ),
              Expanded(
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical:8.0),
                      child: Text(event.title),
                    ),
                    Text(event.venue.displayLocation,overflow: TextOverflow.clip,style:  TextStyle(color: Colors.grey[600]),),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical:8.0),
                      child: Text(Helpers.formatDate(event.datetimeLocal),style: TextStyle(color: Colors.grey[600]),),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}
