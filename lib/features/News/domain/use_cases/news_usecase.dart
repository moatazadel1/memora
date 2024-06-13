import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:memora/features/News/domain/repositories/newsRepo.dart';
import '../../../../core/failures/failures.dart';
import '../../data/models/NewsModel.dart';
@injectable
class NewsUseCase{
  NewsRepo newsRepo;
  NewsUseCase(this.newsRepo);
  Future<Either<Failures, NewsModel>>call()=>newsRepo.getNews();
}