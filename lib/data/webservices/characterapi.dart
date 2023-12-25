import 'package:dio/dio.dart';
import 'package:testbloc/data/models/articale/articale.dart';


class CharacterApiProvider {
  final Dio _dio = Dio(); // إنشاء كائن Dio

  Future<List<Articale>> fetchCharacters() async {
    try {
      final response =
          await _dio.get('https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=557fcf3d9de44314a0d7e582dab2948f');

      // تحويل البيانات من JSON إلى قائمة من كائنات Character
      final List<dynamic> data = response.data['results'];
      final List<Articale> articaletest =
          data.map((json) => Articale.fromJson(json)).toList();

      return articaletest;
    } catch (error) {
      throw Exception('Failed to load characters: $error');
    }
  }
}
