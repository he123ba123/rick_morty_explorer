import 'package:hive/hive.dart';
import '../../domain/entities/character.dart';

part 'character_model.g.dart'; 

@HiveType(typeId: 0)
class CharacterModel extends Character {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String status;

  @HiveField(3)
  final String species;

  @HiveField(4)
  final String gender; 

  @HiveField(5)
  final String image;

  @HiveField(6)
  final String origin;

  @HiveField(7)
  final String location;

  @HiveField(8)
  final List<String> episodes;

  CharacterModel({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.gender, 
    required this.image,
    required this.origin,
    required this.location,
    required this.episodes,
  }) : super(
          id: id,
          name: name,
          status: status,
          species: species,
          gender: gender, 
          image: image,
          origin: origin,
          location: location,
          episodes: episodes,
        );

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      species: json['species'],
      gender: json['gender'], 
      image: json['image'],
      origin: json['origin']?['name'] ?? '',
      location: json['location']?['name'] ?? '',
      episodes: (json['episode'] as List<dynamic>).cast<String>(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'status': status,
      'species': species,
      'gender': gender, 
      'image': image,
      'origin': origin,
      'location': location,
      'episode': episodes,
    };
  }
}
