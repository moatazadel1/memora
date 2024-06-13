import 'package:dartz/dartz.dart';
import 'package:memora/core/failures/failures.dart';
import 'package:memora/features/News/data/models/NewsModel.dart';

abstract class NewsRepo{
  Future<Either<Failures,NewsModel>> getNews();
}