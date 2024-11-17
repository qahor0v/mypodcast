import '../../domain/entities/vocabulary.dart';
import '../../domain/repositories/book_info_repository.dart';
import '../datasources/book_info_remote_data_source.dart';

class BookInfoRepositoryImpl implements BookInfoRepository {
  final BookInfoRemoteDataSource remoteDataSource;

  BookInfoRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Vocabulary>> fetchVocabulary(String vocabularyLink) {
    return remoteDataSource.fetchVocabulary(vocabularyLink);
  }
}
