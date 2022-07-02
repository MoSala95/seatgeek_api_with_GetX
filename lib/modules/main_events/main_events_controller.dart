import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:live_events_app/globals/app_storage.dart';
import 'package:live_events_app/globals/global_enums.dart';
import 'package:live_events_app/models/events_response_model.dart';
import 'package:live_events_app/services/events_service/abstract_events_api_service.dart';

class MainEventsController extends GetxController {

  LoadingState loadingState = LoadingState.done;

  final eventsApiService= Get.find<AbstractEventsApiService>();

  List<Event> events = [];
  Timer? timer;

  ScrollController scrollController = ScrollController();
  final TextEditingController searchTextController = TextEditingController();
  int currentResultPage = 1;
   int? lastResultPage;
  late FocusNode focusNode;

  AppStorage appStorage= AppStorage();

  List<int> favoriteList = [];

   @override
  void onInit() {
    // TODO: implement onInit
     focusNode = FocusNode();
     readUserLikes();
     getEvents();
     loadMoreEvents();
    super.onInit();
  }

  void loadMoreEvents() {
    scrollController.addListener(() async {

      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels &&
          currentResultPage <= lastResultPage!) {
        print("load more searched events");
        if (searchTextController.value.text.isNotEmpty) {
          await searchEvents(value: searchTextController.value.text);
        }
        else{
          getEvents();
        }

      }
    });
  }

  Future<void> getEvents() async {
    loadingState = LoadingState.waiting;

    update();

    final result = await eventsApiService.getEventsPerPage(page: currentResultPage);
    result.fold((l) {
      loadingState = LoadingState.error;
      update();
    }, (eventsResponse) {
      handleSuccessResponse(eventsResponse:eventsResponse);

    });
  }

  Future<void> handleNewSearch({required String value}) async {
    if (timer != null) timer!.cancel();

    timer = Timer(const Duration(seconds: 1), () async {

      if (value.isNotEmpty) {
        events.clear();
        currentResultPage = 1;
        await searchEvents(value: value);
      }

    });
  }
  Future<void> searchEvents({required String value}) async {
    loadingState = LoadingState.waiting;
     update();

    final result = await eventsApiService.getSearchedEvents(
        query: value, page: currentResultPage);
    result.fold((l) {
      loadingState = LoadingState.error;
      update();
    }, (eventsResponse) {
      handleSuccessResponse(eventsResponse: eventsResponse);

      debugPrint("searched events success");
    });
  }

  handleSuccessResponse({required EventsResponse eventsResponse}){
    events.addAll(eventsResponse.events);
    loadingState = events.isEmpty
        ? LoadingState.empty
        : LoadingState.done;

    lastResultPage = eventsResponse.meta.total;
    if (currentResultPage <= lastResultPage!) {
      currentResultPage++;
    }
    update();
  }

  void cancelSearch(){
     searchTextController.clear();
    focusNode.unfocus();
    events.clear();
    currentResultPage = 1;
    getEvents();
  }

  Future <void>saveUserLikes() async{
  // await readUserLikes();
   if(favoriteList.isNotEmpty) {
     appStorage.saveItemInStorage(
         key: AppStorageKeys.favoriteList, value: jsonEncode(favoriteList));
   }

  }

  Future<void> readUserLikes()async {
    String? result= await  appStorage.readItemFromStorage(key: AppStorageKeys.favoriteList);
    if(result !=null){
      //favoriteList.clear();
      final List val = jsonDecode(result);
      favoriteList.addAll( val.map((e) => e as int).toList());
    }

  }
  bool checkIsFavorite({required int eventId}){
    if( favoriteList.contains(eventId)){
      return true;
    }
    return false;
  }
  handleFavoriteAction({required int eventId}){
    if( favoriteList.contains(eventId)){
      favoriteList.remove(eventId);
    }else{
      favoriteList.add(eventId);
    }
    saveUserLikes();
    update();
  }

}