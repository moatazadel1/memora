import 'package:injectable/injectable.dart';
import '../utilies/app_constansts.dart';
import 'package:http/http.dart' as http;

@injectable
class ApiManager {

   ApiManager();
   Future<http.Response> getData(String endPoint,
      {Map<String, dynamic>? params,Map<String, String>? heads}) async {
    Uri url=Uri.https(
        Constants.baseUrl,
        endPoint,params
        //
    );
    http.Response response=await http.get(url,headers:heads);
    return response;
    // {
    //   'X-Api-Key':Constatnts.apiKey
    // });
    // return dio.get(Constants.baseUrl + endPoint, queryParameters: params,options: Options(
    //   headers: heads
    // ));
  }

  // Future<Response> postData(String endPoint, {Map<String, dynamic>?body}) {
  //   return dio.post(Constants.baseUrl + endPoint, data: body);
  // }
}