import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nusantara_recruitment/app/core/theme/typography.dart';
import 'package:nusantara_recruitment/app/core/utils/utils.dart';
import 'package:nusantara_recruitment/app/routes/app_pages.dart';
import 'package:nusantara_recruitment/app/widgets/button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/bookdetail_controller.dart';

class BookdetailView extends GetView<BookdetailController> {
  const BookdetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Books Detail'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(2.h),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/book.png',
                width: 30.w,
              ),
              SizedBox(
                height: 3.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    controller.book.value.title,
                    style: TypographyStyles.h2
                        .copyWith(color: Colors.grey.shade900),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(controller.book.value.subtitle,
                      style: TypographyStyles.b2
                          .copyWith(color: Colors.grey.shade600)),
                ],
              ),
              SizedBox(
                height: 3.h,
              ),
              commonTile('ISBN', controller.book.value.isbn),
              commonTile('Publisher', controller.book.value.publisher),
              commonTile('Author', controller.book.value.author),
              commonTile('Pages', controller.book.value.pages.toString()),
              commonTile('Published Date',
                  formatDate(controller.book.value.published)),
              commonTile('Website', controller.book.value.website),
              commonTile(
                  'Inputted at', formatDate(controller.book.value.createdAt)),
              commonTile(
                  'Updated at', formatDate(controller.book.value.updatedAt)),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: DefaultButton(
                          onPressed: () => Get.toNamed(Routes.BOOKFORM,
                              arguments: controller.book.value),
                          type: Type.secondary,
                          child: const Text('Update')),
                    ),
                    SizedBox(
                      width: 2.h,
                    ),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: DefaultButton(
                          onPressed: (){
                            controller.deleteBook();
                          },
                          type: Type.warning,
                          child: const Text('Delete')),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container commonTile(String title, String value,
      {Widget suffix = const SizedBox(), bool isCentered = false}) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 1.h),
      child: Row(
        crossAxisAlignment:
            isCentered ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 40.w,
            child: Text(
              title,
              style: TypographyStyles.b2.semibold(color: Colors.grey.shade700),
            ),
          ),
          Expanded(
              child: Text(value,
                  style: TypographyStyles.b2
                      .copyWith(color: Colors.grey.shade700))),
          suffix
        ],
      ),
    );
  }
}
