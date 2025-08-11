import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/character.dart';
import '../../../domain/usecases/search_characters.dart';

class SearchCubit extends Cubit<List<Character>> {
  final SearchCharacters searchCharacters;

  SearchCubit(this.searchCharacters) : super([]);

  Future<void> search(String query, {String? status, String? species}) async {
    if (query.isEmpty && (status == null || status.isEmpty) && (species == null || species.isEmpty)) {
      emit([]);
      return;
    }
    final result = await searchCharacters(
      query: query,
      status: status,
      species: species,
    );
    result.fold(
      (failure) => emit([]),
      (characters) => emit(characters),
    );
  }
}
