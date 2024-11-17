import '../../domain/entities/vocabulary.dart';

abstract class BookInfoState {}

class BookInfoInitial extends BookInfoState {}

class BookInfoLoading extends BookInfoState {}

class BookInfoLoaded extends BookInfoState {
  final List<Vocabulary> vocabulary;

  BookInfoLoaded(this.vocabulary);
}

class BookInfoError extends BookInfoState {
  final String message;

  BookInfoError(this.message);
}
