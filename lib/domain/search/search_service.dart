import 'package:dartz/dartz.dart';
import 'package:netflix/domain/core/failures/main_failure.dart';
import 'package:netflix/domain/search/model/search_respose/search_respose.dart';

abstract class SearchService {
  Future<Either<MainFailure, SearchRespose>> searchMovies({
    required String movieQuery,
  });
}
