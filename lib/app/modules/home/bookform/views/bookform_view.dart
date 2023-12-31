import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:get/get.dart';
import 'package:nusantara_recruitment/app/data/models/book.dart';
import 'package:nusantara_recruitment/app/routes/app_pages.dart';
import 'package:nusantara_recruitment/app/widgets/button.dart';
import 'package:nusantara_recruitment/app/widgets/form_input.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/bookform_controller.dart';

class BookformView extends GetView<BookformController> {
  const BookformView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Book? book = Get.arguments;
    if (book != null) {
      controller.setFieldFromObject(book);
    }
    const separator = SizedBox(
      height: 16,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(book == null ? 'Add Book' : 'Edit Book'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Form(
            key: controller.key,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                separator,
                FormInput(
                    useDecorationLabel: true,
                    hint: 'isbn',
                    label: 'ISBN',
                    inputType: TextInputType.number,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.numeric()
                    ]),
                    controller: controller.isbnController),
                separator,
                FormInput(
                    hint: 'title',
                    label: 'Title',
                    useDecorationLabel: true,
                    inputType: TextInputType.text,
                    validator: FormBuilderValidators.required(),
                    controller: controller.titleController),
                separator,
                FormInput(
                    hint: 'subtitle',
                    useDecorationLabel: true,
                    label: 'Subtitle',
                    validator: FormBuilderValidators.required(),
                    inputType: TextInputType.text,
                    controller: controller.subtitleController),
                separator,
                FormInput(
                    hint: 'author',
                    useDecorationLabel: true,
                    label: 'Author',
                    inputType: TextInputType.text,
                    validator: FormBuilderValidators.required(),
                    controller: controller.authorController),
                separator,
                FormInput(
                    hint: 'published',
                    label: 'Published',
                    useDecorationLabel: true,
                    validator: FormBuilderValidators.required(),
                    suffixIcon: IconButton(
                      onPressed: () => controller.datePicker(),
                      icon: const Icon(Icons.calendar_today),
                    ),
                    inputType: TextInputType.none,
                    readOnly: true,
                    controller: controller.publishedController.value),
                separator,
                FormInput(
                    //complete based on controller
                    hint: 'publisher',
                    label: 'Publisher',
                    useDecorationLabel: true,
                    validator: FormBuilderValidators.required(),
                    inputType: TextInputType.text,
                    controller: controller.publisherController),
                separator,
                FormInput(
                  hint: 'Pages',
                  label: 'Pages',
                  useDecorationLabel: true,
                  inputType: TextInputType.number,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.numeric()
                  ]),
                  controller: controller.pagesController,
                ),
                separator,
                FormInput(
                    hint: 'Description',
                    label: 'Description',
                    useDecorationLabel: true,
                    validator: FormBuilderValidators.required(),
                    inputType: TextInputType.multiline,
                    controller: controller.descriptionController),
                separator,
                FormInput(
                    hint: 'Website',
                    label: 'Website',
                    useDecorationLabel: true,
                    validator: FormBuilderValidators.required(),
                    inputType: TextInputType.url,
                    controller: controller.websiteController),
                separator,
                Obx(
                  () => SizedBox(
                    width: double.infinity,
                    child: DefaultButton(
                        onPressed: () async {
                          if (controller.key.currentState!.validate()) {
                            if (book != null) {
                              final result = await controller.updateBook(book);
                              if (result) {
                                Get.offNamedUntil(
                                    Routes.HOME, (route) => false);
                                Get.snackbar('Success', 'Book updated',
                                    snackPosition: SnackPosition.BOTTOM);
                              }
                            } else {
                              final isSuccess = await controller.addBook(
                                controller.isbnController.text,
                                controller.titleController.text,
                                controller.subtitleController.text,
                                controller.authorController.text,
                                controller.publishedController.value.text,
                                controller.publisherController.text,
                                controller.pagesController.text,
                                controller.descriptionController.text,
                                controller.websiteController.text,
                              );
                              if (isSuccess) {
                                Get.back();
                                Get.snackbar('Success', 'Success add book',
                                    snackPosition: SnackPosition.BOTTOM);
                              }
                            }
                          }
                        },
                        type: Type.primary,
                        child: controller.isLoading.value
                            ? SizedBox(
                                width: 2.h,
                                height: 2.h,
                                child: const CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )
                            : Text(book != null ? 'Edit Book' : 'Add Book')),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
