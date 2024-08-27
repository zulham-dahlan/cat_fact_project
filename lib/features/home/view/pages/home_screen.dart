import 'package:cat_fact/features/home/controller/cat_facts_controller.dart';
import 'package:cat_fact/features/home/model/cat_fact_model.dart';
import 'package:cat_fact/features/login/model/user_model.dart';
import 'package:cat_fact/features/logout/view/widget/button_logout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  static const String routeName = "/home_screen";
  final CatFactsController catFactsController = Get.put(CatFactsController());

  @override
  Widget build(BuildContext context) {
    final UserModel user = Get.find<UserModel>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Text(
            "Halo, ${user.username}",
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
            ),
            maxLines: 1,
          ),
        ),
        actions: [ButtonLogout()],
      ),
      body: catFactsController.obx(
          (state) => RefreshIndicator(
                onRefresh: () async {
                  catFactsController.fetchCatFacts();
                },
                child: ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemBuilder: (context, index) {
                    CatFactModel catFactModel = state![index];
                    return Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black45)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                const TextSpan(
                                  text: 'Cat Fact ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                                TextSpan(
                                  text: '#${index + 1}',
                                  style: const TextStyle(
                                      color: Colors.orange,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            catFactModel.text,
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: state?.length ?? 0,
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 8,
                    );
                  },
                ),
              ),
          onEmpty: const Center(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                "Data Empty",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
          ),
          onError: (e) => Center(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    e.toString(),
                    maxLines: 3,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.red),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          onLoading: const Center(
            child: CircularProgressIndicator(
              color: Colors.orange,
            ),
          )),
    );
  }
}
