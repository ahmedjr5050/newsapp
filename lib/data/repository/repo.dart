import 'package:testbloc/data/models/articale/articale.dart';
import 'package:testbloc/data/webservices/characterapi.dart';

abstract class CharacterRepository {
  Future<List<Articale>> fetchCharacters();
}

class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterApiProvider _apiProvider = CharacterApiProvider();

  @override
  Future<List<Articale>> fetchCharacters() {
    return _apiProvider.fetchCharacters();
  }
}
