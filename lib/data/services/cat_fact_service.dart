import 'package:cat_fact/features/home/model/cat_fact_model.dart';
import 'package:dio/dio.dart';

class CatFactService {
  final dio = Dio();

  Future<List<CatFactModel>> getListCatFact() async {
    Response response = await dio.get('https://cat-fact.herokuapp.com/facts');

    if (response.statusCode == 200) {
      List<dynamic> data = response.data;

      List<CatFactModel> catFacts =
          data.map((item) => CatFactModel.fromJson(item)).toList();

      return catFacts;
    } else {
      throw Exception("failed to retrieve data from server");
    }
  }
}
