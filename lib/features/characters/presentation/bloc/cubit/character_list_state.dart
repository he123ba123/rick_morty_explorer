import '../../../domain/entities/character.dart';

enum CharacterListStatus { initial, loading, loaded, error }

class CharacterListState {
  final CharacterListStatus status;
  final List<Character> characters;
  final String? errorMessage;
  final int currentPage;
  final bool hasReachedMax;

  const CharacterListState({
    this.status = CharacterListStatus.initial,
    this.characters = const [],
    this.errorMessage,
    this.currentPage = 1,
    this.hasReachedMax = false,
  });

  CharacterListState copyWith({
    CharacterListStatus? status,
    List<Character>? characters,
    String? errorMessage,
    int? currentPage,
    bool? hasReachedMax,
  }) {
    return CharacterListState(
      status: status ?? this.status,
      characters: characters ?? this.characters,
      errorMessage: errorMessage ?? this.errorMessage,
      currentPage: currentPage ?? this.currentPage,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }
}
