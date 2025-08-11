import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/character.dart';
import '../../../domain/repositories/character_repository.dart'
    show CharacterRepository;
import '../../../domain/usecases/toggle_favorite.dart';

class FavoritesCubit extends Cubit<List<Character>> {
  final ToggleFavorite toggleFavorite;
  final CharacterRepository repository;

  FavoritesCubit(this.toggleFavorite, this.repository) : super([]);

  Future<void> loadFavorites() async {
 
    final favorites = await repository.getFavorites();
    emit(favorites);
  }

  Future<void> toggle(Character character) async {
    await toggleFavorite(character);
    await loadFavorites();
  }
}
