import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/character.dart';
import '../repositories/character_repository.dart';

class GetCharacterDetails {
  final CharacterRepository repository;

  GetCharacterDetails(this.repository);

  Future<Either<Failure, Character>> call(int id) {
    return repository.getCharacterDetails(id);
  }
}
