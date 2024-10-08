import 'package:cached_network_image/cached_network_image.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretium_peter/controllers/utilities_controller.dart';
import 'package:pretium_peter/models/utlityModel.dart';

class UtilityPage extends StatelessWidget {
  UtilityPage({super.key});

  final UtilitiesController utilitiesController =
      Get.find<UtilitiesController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: const Text("Utilities"),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          utilitiesController.fetchUtilities();
        },
        child: SafeArea(
          child: Obx(() {
            return utilitiesController.loadingUtilities.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : utilitiesController.utilities.isNotEmpty
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: utilitiesController.utilities.length,
                        itemBuilder: (context, index) {
                          UtilityModel utility =
                              utilitiesController.utilities.elementAt(index);
                          return ListTile(
                            leading: CachedNetworkImage(
                              imageUrl: utility.icon,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                height: 200,
                                width: 200,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                      colorFilter: ColorFilter.mode(
                                          Colors.red, BlendMode.colorBurn)),
                                ),
                              ),
                              placeholder: (context, url) => FadeShimmer.round(
                                size: 60,
                                fadeTheme: FadeTheme.light,
                              ),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                            title: Text(utility.name),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Category: ${utility.category}"),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Low Limit: ${utility.highLimit}"),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text("High Limit: ${utility.highLimit}"),
                                  ],
                                ),
                                const Divider(),
                              ],
                            ),
                          );
                        })
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              utilitiesController.fetchUtilities();
                            },
                            child: const Center(
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.refresh,
                                    color: Colors.grey,
                                    size: 80,
                                  ),
                                  Text(
                                    "Refresh",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 30),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
          }),
        ),
      ),
    );
  }
}
