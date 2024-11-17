import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/podcast.dart';

class PodcastModel {
  final String podcastId;
  final String name;
  final String duration;
  final String textLink;
  final String imageLink;
  final String pdfLink;
  final String audioLink;
  final String releaseDate;
  final String synopsis;
  final String details;
  final String vocabularyLink;

  PodcastModel({
    required this.podcastId,
    required this.name,
    required this.duration,
    required this.textLink,
    required this.imageLink,
    required this.pdfLink,
    required this.audioLink,
    required this.releaseDate,
    required this.synopsis,
    required this.details,
    required this.vocabularyLink,
  });

  factory PodcastModel.fromFirestore(DocumentSnapshot doc) {
    return PodcastModel(
      podcastId: doc.id,
      name: doc["name"],
      duration: doc["duration"],
      textLink: doc["textLink"],
      imageLink: doc["imageLink"],
      pdfLink: doc["pdfLink"],
      audioLink: doc["audioLink"],
      releaseDate: doc["releaseDate"],
      synopsis: doc["synopsis"],
      details: doc["details"],
      vocabularyLink: doc["vocabularyLink"],
    );
  }

  Podcast toEntity() {
    return Podcast(
      podcastId: podcastId,
      name: name,
      duration: duration,
      textLink: textLink,
      imageLink: imageLink,
      pdfLink: pdfLink,
      audioLink: audioLink,
      releaseDate: releaseDate,
      synopsis: synopsis,
      details: details,
      vocabularyLink: vocabularyLink,
    );
  }
}
