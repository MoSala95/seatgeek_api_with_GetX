import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_events_app/globals/helpers.dart';
import 'package:live_events_app/models/events_response_model.dart';
class EventDetailsScreen extends StatelessWidget {
  final Event event ;
  final bool isFavorite;
  const EventDetailsScreen({Key? key,required this.event, required this.isFavorite}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(event.venue.name),
      actions: [

            isFavorite? const Icon(Icons.favorite,color: Colors.red,):const Icon(Icons.favorite,color: Colors.grey,)
      ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: ClipRRect(
                borderRadius:  BorderRadius.circular(8),
                child: Image.asset("assets/images/stadium.jpeg",height: 130,width: Get.width*.8,fit: BoxFit.fill,)
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(Helpers.formatDate(event.datetimeLocal),style: TextStyle(fontWeight: FontWeight.bold),),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal:16.0),
            child: Text(event.venue.displayLocation,overflow: TextOverflow.clip,style:  TextStyle(color: Colors.grey[600]),),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(event.description,style: TextStyle(fontWeight: FontWeight.bold),),
          ),
        ],
      ),
    );
  }
}
