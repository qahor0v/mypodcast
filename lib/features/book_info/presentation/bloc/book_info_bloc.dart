import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/use_cases/fetch_vocabulary.dart';
import 'book_info_event.dart';
import 'book_info_state.dart';

class BookInfoBloc extends Bloc<BookInfoEvent, BookInfoState> {
  final FetchVocabulary fetchVocabulary;

  BookInfoBloc({required this.fetchVocabulary}) : super(BookInfoInitial()) {
    on<FetchVocabularyEvent>(_onFetchVocabulary);
  }

  Future<void> _onFetchVocabulary(
      FetchVocabularyEvent event, Emitter<BookInfoState> emit) async {
    emit(BookInfoLoading());
    try {
      final vocabulary = await fetchVocabulary(event.vocabularyLink);
      emit(BookInfoLoaded(vocabulary));
    } catch (e) {
      emit(BookInfoError(e.toString()));
    }
  }
}
