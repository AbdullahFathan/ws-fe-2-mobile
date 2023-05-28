import 'package:dio/dio.dart';
import 'package:ws2/models/anime_model.dart';

class AnimeRepository {
  final _dio = Dio();

  Future<AnimeModel?> getQuote(String characterName) async {
    try {
      var response = await _dio.get(
          "https://animechan.vercel.app/api/random/character?name=$characterName");

      if (response.statusCode == 200) {
        var data = response.data;

        return AnimeModel(
            anime: data["anime"],
            character: data["character"],
            quote: data["quote"]);
      }
    } catch (eror) {
      throw Exception("There is eror get anime data: ${eror.toString()}");
    }
    return null;
  }
}
