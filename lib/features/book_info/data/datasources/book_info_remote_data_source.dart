import 'package:dio/dio.dart';
import '../../domain/entities/vocabulary.dart';

class BookInfoRemoteDataSource {
  final Dio dio;

  BookInfoRemoteDataSource(this.dio);

  Future<List<Vocabulary>> fetchVocabulary(String vocabularyLink) async {
    final response = await dio.get(vocabularyLink);

    if (response.statusCode == 200) {
      final List<String> words = (response.data as String).split(';');
      return words.map((word) => Vocabulary(word)).toList();
    } else {
      throw Exception('Failed to fetch vocabulary');
    }
  }
}
