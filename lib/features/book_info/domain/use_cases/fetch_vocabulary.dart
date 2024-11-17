import '../entities/vocabulary.dart';
import '../repositories/book_info_repository.dart';

class FetchVocabulary {
  final BookInfoRepository repository;

  FetchVocabulary(this.repository);

  Future<List<Vocabulary>> call(String vocabularyLink) {
    return repository.fetchVocabulary(vocabularyLink);
  }
}
