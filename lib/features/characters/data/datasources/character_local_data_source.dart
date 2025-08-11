import 'package:hive/hive.dart';
import '../../../../core/error/exceptions.dart';
import '../models/character_model.dart';

abstract class CharacterLocalDataSource {
  Future<void> cacheCharacters(List<CharacterModel> characters, int page);
  Future<List<CharacterModel>> getCachedCharacters(int page);
  Future<void> toggleFavorite(CharacterModel character);
  Future<List<CharacterModel>> getFavorites();
}

class CharacterLocalDataSourceImpl implements CharacterLocalDataSource {
  final Box charactersBox;
  final Box favoritesBox;

  CharacterLocalDataSourceImpl({
    required this.charactersBox,
    required this.favoritesBox, required Box hiveBox,
  });

  @override
  Future<void> cacheCharacters(List<CharacterModel> characters, int page) async {
    await charactersBox.put(page.toString(), characters.map((c) => c.toJson()).toList());
  }

  @override
  Future<List<CharacterModel>> getCachedCharacters(int page) async {
    final cached = charactersBox.get(page.toString());
    if (cached != null) {
      return (cached as List).map((json) => CharacterModel.fromJson(json)).toList();
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> toggleFavorite(CharacterModel character) async {
    if (favoritesBox.containsKey(character.id)) {
      await favoritesBox.delete(character.id);
    } else {
      await favoritesBox.put(character.id, character.toJson());
    }
  }

  @override
  Future<List<CharacterModel>> getFavorites() async {
    return favoritesBox.values
        .map((json) => CharacterModel.fromJson(json))
        .toList()
        .cast<CharacterModel>();
  }
}
