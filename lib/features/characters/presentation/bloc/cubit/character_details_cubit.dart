import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/network/network_info.dart';
import '../../../domain/entities/character.dart';
import '../../../domain/usecases/get_character_details.dart';
part 'character_details_state.dart';

class CharacterDetailsCubit extends Cubit<CharacterDetailsState> {
  final GetCharacterDetails getCharacterDetails;
  final NetworkInfo networkInfo;

  CharacterDetailsCubit(this.getCharacterDetails, this.networkInfo)
      : super(CharacterDetailsInitial());

  Future<void> loadCharacterDetails(int id) async {
    emit(CharacterDetailsLoading());

    if (!await networkInfo.isConnected) {
      emit(CharacterDetailsError("No internet connection"));
      return;
    }

    final result = await getCharacterDetails(id);
    result.fold(
      (failure) => emit(CharacterDetailsError("Failed to load character")),
      (character) => emit(CharacterDetailsLoaded(character)),
    );
  }
}
