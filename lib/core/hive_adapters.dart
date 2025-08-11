import 'package:hive/hive.dart';
import '../features/characters/domain/entities/character.dart';

class CharacterAdapter extends TypeAdapter<Character> {
  @override
  final int typeId = 0;

  @override
  Character read(BinaryReader reader) {
    return Character(
      id: reader.read(),
      name: reader.read(),
      status: reader.read(),
      species: reader.read(),
      gender: reader.read(),
      origin: reader.read(),
      location: reader.read(),
      image: reader.read(),
      episodes: (reader.read() as List).cast<String>(),
      isFavorite: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, Character obj) {
    writer.write(obj.id);
    writer.write(obj.name);
    writer.write(obj.status);
    writer.write(obj.species);
    writer.write(obj.gender);
    writer.write(obj.origin);
    writer.write(obj.location);
    writer.write(obj.image);
    writer.write(obj.episodes);
    writer.write(obj.isFavorite);
  }
}
