import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:memora/core/api/api_manager.dart';
import 'package:memora/core/api/endpoints.dart';
import 'package:memora/core/utilies/app_constansts.dart';
import 'package:memora/features/News/data/data_sources/RemoteDs/NewsDs.dart';
import 'package:memora/features/News/data/models/NewsModel.dart';
@Injectable(as: NewsDs)
class NewsDsImp implements NewsDs{
  ApiManager api;

  NewsDsImp(this.api);

  @override
  Future<NewsModel> getNews()async {
    var response= await api.getData(EndPoints.newsEndPoint,
        params: {
      'q':'Alzheimer',
          "language":"en"
    },
       heads: {
      'X-Api-Key':Constants.apiKey
    }
    );
    var json=jsonDecode(response.body);
    return NewsModel.fromJson(json);
  }

}