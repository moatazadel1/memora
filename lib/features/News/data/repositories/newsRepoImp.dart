import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:memora/core/failures/failures.dart';
import 'package:memora/features/News/data/data_sources/RemoteDs/NewsDs.dart';
import 'package:memora/features/News/data/models/NewsModel.dart';
import 'package:memora/features/News/domain/repositories/newsRepo.dart';
@Injectable(as: NewsRepo)
class NewsRepoImp implements NewsRepo{
  NewsDs newsDs;

  NewsRepoImp(this.newsDs);

  @override
  Future<Either<Failures, NewsModel>> getNews()async {
    try{
      var newsModel= await newsDs.getNews();
      return right(newsModel);
    }catch(e){
      return left(Failures(e.toString()));
    }
  }



}