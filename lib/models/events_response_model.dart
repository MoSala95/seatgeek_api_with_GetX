// To parse this JSON data, do
//
//     final eventsResponse = eventsResponseFromJson(jsonString);

import 'dart:convert';

EventsResponse eventsResponseFromJson(String str) =>
    EventsResponse.fromJson(json.decode(str));


class EventsResponse {
  EventsResponse({
    required this.events,
    required this.meta,
  });

  List<Event> events;
  Meta meta;

  factory EventsResponse.fromJson(Map<String, dynamic> json) => EventsResponse(
        events: List<Event>.from(json["events"].map((x) => Event.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
      );
}

class Event {
  Event({
    required this.id,
    required this.datetimeUtc,
    required this.performers,
    required this.isOpen,
    required this.datetimeLocal,
    required this.shortTitle,
    required this.visibleUntilUtc,
    required this.url,
    required this.score,
    required this.announceDate,
    required this.createdAt,
    required this.title,
    required this.description,
    required this.status,
    required this.venue
  });

  int id;
  DateTime datetimeUtc;
  List<Performer> performers;
  bool isOpen;
  DateTime datetimeLocal;
  String shortTitle;
  DateTime visibleUntilUtc;
  String url;
  double score;
  DateTime announceDate;
  DateTime createdAt;
  String title;
  String description;
  String status;
  Venue venue;
  factory Event.fromJson(Map<String, dynamic> json) => Event(
         id: json["id"],
        datetimeUtc: DateTime.parse(json["datetime_utc"]),
        performers: List<Performer>.from(
            json["performers"].map((x) => Performer.fromJson(x))),
        isOpen: json["is_open"],
        datetimeLocal: DateTime.parse(json["datetime_local"]),
        shortTitle: json["short_title"],
        visibleUntilUtc: DateTime.parse(json["visible_until_utc"]),
        url: json["url"],
        score: json["score"].toDouble(),
        announceDate: DateTime.parse(json["announce_date"]),
        createdAt: DateTime.parse(json["created_at"]),
        title: json["title"],
        description: json["description"],
        status: json["status"],
       venue: Venue.fromJson(json["venue"]),
      );
}

class Performer {
  Performer({
    required this.name,

    required this.shortName,
  });

  String name;

  String shortName;

  factory Performer.fromJson(Map<String, dynamic> json) => Performer(
        name: json["name"],

        shortName: json["short_name"],
      );
}
class Venue {
  Venue({
    required this.state,
    required this.nameV2,
    required this.name,
    required this.address,
    required this.city,
    required this.slug,
    required this.displayLocation

  });

  String state;
  String nameV2;
  String name;
  String address;
  String city;
  String slug;
  String displayLocation;

  factory Venue.fromJson(Map<String, dynamic> json) => Venue(
    state: json["state"],
    nameV2: json["name_v2"],
    name: json["name"],
    address: json["address"],
    city: json["city"],
    slug: json["slug"],
    displayLocation: json["display_location"],
  );

}
class Meta {
  Meta({
    required this.total,
    required this.took,
    required this.page,
    required this.perPage,
  });

  int total;
  int took;
  int page;
  int perPage;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        total: json["total"],
        took: json["took"],
        page: json["page"],
        perPage: json["per_page"],
      );
}
