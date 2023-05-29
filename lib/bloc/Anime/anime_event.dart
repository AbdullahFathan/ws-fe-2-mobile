part of 'anime_bloc.dart';

abstract class AnimeEvent {}

class GetQuoteEvent extends AnimeEvent {
  String characterName;
  GetQuoteEvent({
    required this.characterName,
  });
}
