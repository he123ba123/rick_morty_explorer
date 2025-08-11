import '../entities/character.dart';
import '../repositories/character_repository.dart';

class ToggleFavorite {
  final CharacterRepository repository;

  ToggleFavorite(this.repository);

  Future<void> call(Character character) async {
    await repository.toggleFavorite(character);
  }
}
