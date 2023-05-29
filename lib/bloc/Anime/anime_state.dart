part of 'anime_bloc.dart';

abstract class AnimeState {}

class AnimeInitial extends AnimeState {}

class AnimeEror extends AnimeState {
  String erorText;
  AnimeEror({
    required this.erorText,
  });
}

class AnimeSuccess extends AnimeState {
  AnimeModel? animeModel;
  AnimeSuccess({
    this.animeModel,
  });
}

class AnimeLoading extends AnimeState {}
