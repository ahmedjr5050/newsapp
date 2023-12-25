import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testbloc/data/models/articale/articale.dart';
import 'package:testbloc/data/repository/repo.dart';
class CharacterCubit extends Cubit<List<Articale>> {
  final CharacterRepository _repository = CharacterRepositoryImpl();

  CharacterCubit() : super([]);

  void loadCharacters() async {
    try {
      final characters = await _repository.fetchCharacters();
      emit(characters);
    } catch (error) {
      // يمكنك إضافة معالجة للأخطاء هنا
    }
  }
}
