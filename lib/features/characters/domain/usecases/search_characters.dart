import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/character.dart';
import '../repositories/character_repository.dart';

class SearchCharacters {
  final CharacterRepository repository;

  SearchCharacters(this.repository);

  Future<Either<Failure, List<Character>>> call({
    required String query,
    String? status,
    String? species,
  }) {
    return repository.searchCharacters(query, status: status, species: species);
  }
}
