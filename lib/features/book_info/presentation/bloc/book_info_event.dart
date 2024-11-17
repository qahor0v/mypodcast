abstract class BookInfoEvent {}

class FetchVocabularyEvent extends BookInfoEvent {
  final String vocabularyLink;

  FetchVocabularyEvent(this.vocabularyLink);
}
