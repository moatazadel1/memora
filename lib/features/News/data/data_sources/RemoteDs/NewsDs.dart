import '../../models/NewsModel.dart';

abstract class NewsDs{
  Future<NewsModel> getNews();
}