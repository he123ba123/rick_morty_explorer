import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/character.dart';

abstract class CharacterRepository {
  Future<Either<Failure, List<Character>>> getCharacters(int page);
Future<Either<Failure, List<Character>>> searchCharacters(
  String query, {String? status, String? species}
);
  Future<Either<Failure, Character>> getCharacterDetails(int id);
  Future<void> toggleFavorite(Character character);
  Future<List<Character>> getFavorites();
}
