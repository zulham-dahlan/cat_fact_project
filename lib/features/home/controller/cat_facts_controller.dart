import 'package:cat_fact/data/services/cat_fact_service.dart';
import 'package:cat_fact/features/home/model/cat_fact_model.dart';
import 'package:get/get.dart';

class CatFactsController extends GetxController
    with StateMixin<List<CatFactModel>> {
  final catfactService = CatFactService();

  @override
  void onInit() {
    super.onInit();
    fetchCatFacts();
  }

  fetchCatFacts() async {
    change([], status: RxStatus.loading());

    try {
      final result = await catfactService.getListCatFact();

      if (result.isNotEmpty) {
        change(result, status: RxStatus.success());
      } else {
        change([], status: RxStatus.empty());
      }
    } catch (e) {
      change([], status: RxStatus.error(e.toString()));
    }
  }
}
