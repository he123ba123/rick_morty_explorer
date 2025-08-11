import 'package:flutter_bloc/flutter_bloc.dart';
import 'character_list_state.dart';
import '../../../domain/usecases/get_characters.dart';

class CharacterListCubit extends Cubit<CharacterListState> {
  final GetCharacters getCharacters;
  bool _isLoading = false;

  CharacterListCubit(this.getCharacters) : super(const CharacterListState());

  Future<void> loadCharacters({int page = 1}) async {
    if (_isLoading) return;
    if (state.hasReachedMax && page != 1) return;

    _isLoading = true;

    if (page == 1) {
      emit(state.copyWith(
        status: CharacterListStatus.loading,
        characters: [],
        currentPage: 1,
        hasReachedMax: false,
      ));
    } else {
      emit(state.copyWith(status: CharacterListStatus.loading));
    }

    final result = await getCharacters(page);

    result.fold(
      (failure) {
        emit(state.copyWith(
          status: CharacterListStatus.error,
          errorMessage: "Failed to load characters",
        ));
        _isLoading = false;
      },
      (characters) {
final allCharacters = page == 1
    ? characters
    : [...state.characters, ...characters];


        emit(state.copyWith(
          status: CharacterListStatus.loaded,
          characters: allCharacters,
          currentPage: page + 1,
          hasReachedMax: characters.isEmpty,
        ));
        _isLoading = false;
      },
    );
  }
}
