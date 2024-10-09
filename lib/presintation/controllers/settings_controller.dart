// import 'package:dartz/dartz.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:ingaz_project/language/language_controller.dart';
// import 'package:ingaz_project/model/contact_us_model.dart';
// import 'package:ingaz_project/model/error_message_model.dart';
// import 'package:ingaz_project/model/social_media_model.dart';
// import 'package:ingaz_project/repository/settings_repository.dart';
//
// class SettingsController extends GetxController {
//   List<SocialMediaData> socialMediaData = [];
//
//   bool isLoading = false;
//   final languageController = Get.put(LanguageController());
//   getSocialMediaData() async {
//     isLoading = true;
//     update();
//     Either<ErrorMessageModel, SocialMediaModel> response =
//         await SettingsRepository.getSocialLinks();
//     isLoading = false;
//     update();
//     response.fold(
//         (l) => Get.defaultDialog(
//             title: "",
//             content: Text(
//               l.message,
//               style: TextStyle(overflow: TextOverflow.ellipsis),
//             )), (r) {
//       r.data!.forEach(
//         (element) {
//           socialMediaData.add(element);
//         },
//       );
//
//       update();
//     });
//   }
//
//   @override
//   void onInit() {
//     getSocialMediaData();
//     getContactData();
//     super.onInit();
//   }
//
//   ContactData? contactUsData;
//
//   getContactData() async {
//     isLoading = true;
//     update();
//     Either<ErrorMessageModel, ContactUsModel> response =
//         await SettingsRepository.getContactUs();
//     response.fold((l) => Get.defaultDialog(content: Text(l.message)), (r) {
//       contactUsData = r.data![0];
//     });
//     print("ContactUsModel response ${contactUsData}");
//
//     isLoading = false;
//     update();
//   }
// }
