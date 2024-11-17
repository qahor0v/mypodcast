import '../entities/vocabulary.dart';

abstract class BookInfoRepository {
  Future<List<Vocabulary>> fetchVocabulary(String vocabularyLink);
}
