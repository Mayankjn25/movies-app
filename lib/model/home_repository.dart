import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies_app/model/movie_model.dart';
import 'package:movies_app/model/services/network_service.dart';
import 'package:movies_app/utils/helper/exception_handler.dart';

class HomeRepository {
  Future<List<MovieModel>> getMovieFeed() async {
    NetworkService controller = NetworkService();
    String url =
        "https://api.themoviedb.org/3/trending/all/week?api_key=fa0c92af3ea4daf346aace070bc25bf8";

    var response = await controller.getMovieFeed(path: url);

    List<MovieModel> movie = [];
    Box box = await Hive.openBox('news_box');

    if (response is APIException) {
    } else {
      response.data["results"].forEach((element) {
        if (element["title"] != null) {
          MovieModel movieFeed = MovieModel(
            adult: element["adult"] ?? false,
            backdropPath: element["backdrop_path"],
            genreIds: element["genre_ids"],
            id: element["id"] ?? "",
            originalLanguage: element["original_language"],
            originalTitle: element["original_title"] ?? "",
            overview: element["overview"],
            posterPath:
                "https://image.tmdb.org/t/p/w440_and_h660_face/${element["poster_path"]}",
            releaseDate: element["release_date"] ?? "",
            title: element["title"] ?? "",
            video: element["video"] ?? false,
            voteAverage: element["vote_average"],
            voteCount: element["vote_count"],
            popularity: element["popularity"],
            mediaType: element["media_type"],
          );

          movie.add(movieFeed);
        }
      });
      return movie;
    }
    return movie;
  }
}
