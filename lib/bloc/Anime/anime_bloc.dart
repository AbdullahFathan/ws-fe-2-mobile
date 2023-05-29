import 'package:bloc/bloc.dart';

import 'package:ws2/repository/anime_repository.dart';

import '../../models/anime_model.dart';

part 'anime_event.dart';
part 'anime_state.dart';

class AnimeBloc extends Bloc<AnimeEvent, AnimeState> {
  AnimeBloc() : super(AnimeInitial()) {
    final _animerepo = AnimeRepository();
    on<GetQuoteEvent>((event, emit) async {
      try {
        emit(AnimeLoading());
        var response = await _animerepo.getQuote(event.characterName);

        response != null
            ? emit(AnimeSuccess(animeModel: response))
            : emit(AnimeEror(erorText: "Faild get quotes"));
      } catch (eror) {
        emit(AnimeEror(erorText: eror.toString()));
      }
    });
  }
}
