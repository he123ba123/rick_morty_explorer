import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/character.dart';
import '../../domain/repositories/character_repository.dart';
import '../datasources/character_local_data_source.dart';
import '../datasources/character_remote_data_source.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterRemoteDataSource remoteDataSource;
  final CharacterLocalDataSource localDataSource;
  final NetworkInfo networkInfo;
  final Box favoritesBox; 

  CharacterRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
    required this.favoritesBox,
  });

  @override
  Future<Either<Failure, List<Character>>> getCharacters(int page) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteCharacters = await remoteDataSource.getCharacters(page);
        await localDataSource.cacheCharacters(remoteCharacters, page);
        return Right(remoteCharacters);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localCharacters = await localDataSource.getCachedCharacters(page);
        return Right(localCharacters);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<Character>>> searchCharacters(
    String query, {String? status, String? species}
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteCharacters = await remoteDataSource.searchCharacters(
          query,
          status: status,
          species: species,
        );
        return Right(remoteCharacters);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }


  @override
  Future<Either<Failure, Character>> getCharacterDetails(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteCharacter = await remoteDataSource.getCharacterDetails(id);
        return Right(remoteCharacter);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<void> toggleFavorite(Character character) async {
    final key = character.id.toString();
    if (favoritesBox.containsKey(key)) {
      await favoritesBox.delete(key); 
    } else {
      await favoritesBox.put(key, character); 
    }
  }

  @override
  Future<List<Character>> getFavorites() async {
    return favoritesBox.values.cast<Character>().toList();
  }
}
