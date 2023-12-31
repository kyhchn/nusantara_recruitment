import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nusantara_recruitment/app/core/theme/colors.dart';
import 'package:nusantara_recruitment/app/core/theme/typography.dart';
import 'package:nusantara_recruitment/app/modules/home/controllers/books_controller.dart';
import 'package:nusantara_recruitment/app/routes/app_pages.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BooksView extends GetView<BooksController> {
  const BooksView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.scrollController.addListener(() {
      if (controller.scrollController.offset ==
          controller.scrollController.position.maxScrollExtent) {
        controller.nextPage();
      }
    });
    return Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Nusantara Recruitment'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Obx(() => controller.books.isNotEmpty
              ? ListView.builder(
                  controller: controller.scrollController,
                  itemBuilder: (context, index) {
                    if (index < controller.books.length) {
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                              side:
                                  const BorderSide(color: CustomColor.primary),
                              borderRadius: BorderRadius.circular(12)),
                          title: Text(
                            controller.books[index].title,
                            style: TypographyStyles.h4,
                          ),
                          subtitle: Text(controller.books[index].publisher),
                          onTap: () => Get.toNamed(Routes.BOOKDETAIL,
                              arguments: controller.books[index]),
                        ),
                      );
                    } else {
                      return controller.hasMore.value
                          ? Center(
                              child: SizedBox(
                                  width: 2.h,
                                  height: 2.h,
                                  child: const CircularProgressIndicator()),
                            )
                          : const Text('No more Data');
                    }
                  },
                  itemCount: controller.books.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                )
              : const Center(
                  child: Text('Books still empty, please add some books'),
                )),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Get.toNamed(Routes.BOOKFORM),
          child: const Icon(Icons.add),
        ));
  }
}
