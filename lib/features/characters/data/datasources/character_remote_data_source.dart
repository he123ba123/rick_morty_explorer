import 'package:dio/dio.dart';
import '../../../../core/constants/api_constants.dart';
import '../../../../core/error/exceptions.dart';
import '../models/character_model.dart';

abstract class CharacterRemoteDataSource {
  Future<List<CharacterModel>> getCharacters(int page);
  Future<List<CharacterModel>> searchCharacters(String query, {String? status, String? species});
  Future<CharacterModel> getCharacterDetails(int id);
}

class CharacterRemoteDataSourceImpl implements CharacterRemoteDataSource {
  final Dio dio;

  CharacterRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<CharacterModel>> getCharacters(int page) async {
    try {
      final response = await dio.get("${ApiConstants.charactersEndpoint}?page=$page");
      if (response.statusCode == 200) {
        return (response.data['results'] as List)
            .map((json) => CharacterModel.fromJson(json))
            .toList();
      } else {
        throw ServerException();
      }
    } catch (_) {
      throw ServerException();
    }
  }

  @override
  Future<List<CharacterModel>> searchCharacters(String query, {String? status, String? species}) async {
    try {
      final params = {
        'name': query,
        if (status != null && status.isNotEmpty) 'status': status,
        if (species != null && species.isNotEmpty) 'species': species,
      };

      final response = await dio.get(ApiConstants.charactersEndpoint, queryParameters: params);

      if (response.statusCode == 200) {
        return (response.data['results'] as List)
            .map((json) => CharacterModel.fromJson(json))
            .toList();
      } else {
        throw ServerException();
      }
    } catch (_) {
      throw ServerException();
    }
  }

  @override
  Future<CharacterModel> getCharacterDetails(int id) async {
    try {
      final response = await dio.get("${ApiConstants.charactersEndpoint}/$id");
      if (response.statusCode == 200) {
        return CharacterModel.fromJson(response.data);
      } else {
        throw ServerException();
      }
    } catch (_) {
      throw ServerException();
    }
  }
}
