import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Setting screen"),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:ingaz_project/controller/settings_controller.dart';
// import 'package:ingaz_project/core/app_constance/app_colors.dart';
// import 'package:ingaz_project/core/size_and_navigation/media_query.dart';
// import 'package:ingaz_project/helpers/app_links_helper.dart';
// import 'package:ingaz_project/helpers/shimmer_helper.dart';
// import 'package:ingaz_project/local_data_source/authentication_storing/save_user_info.dart';
// import 'package:ingaz_project/view/screens/complaint_track_screen.dart';
// import 'package:ingaz_project/view/screens/login_screen.dart';
// import 'package:ingaz_project/view/screens/privacy_policy_screen.dart';
// import 'package:ingaz_project/view/screens/profile_screen.dart';
// import 'package:ingaz_project/view/screens/terms_and_cond_screen.dart';
//
// class SettingsScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           elevation: 0,
//           backgroundColor: AppColors.whiteColor,
//           foregroundColor: AppColors.baseColor,
//           leading: Container(),
//           title: const Text(
//             "الإعدادات",
//           ),
//         ),
//         body: WillPopScope(
//           onWillPop: () async {
//             return false;
//           },
//           child: GetBuilder<SettingsController>(
//               init: SettingsController(),
//               builder: (settingsController) {
//                 return settingsController.isLoading
//                     ? ShimmerHelper.listShimmer()
//                     : Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: SingleChildScrollView(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const SizedBox(height: 20),
//                         SettingsTile(
//                           title: 'الملف الشخصي',
//                           onTap: () {
//                             Get.to(ProfileScreen());
//                           },
//                           icon: null,
//                         ),
//                         SettingsTile(
//                           title: 'سياسة الخصوصية',
//                           onTap: () {
//                             // Navigate to Privacy Page
//                             Get.to(const PrivacyPolicyScreen());
//                           },
//                           icon: null,
//                         ),
//                         SettingsTile(
//                           title: 'الشروط و الاحكام',
//                           onTap: () {
//                             // Navigate to Terms Page
//                             Get.to(const TermsAndCondScreen());
//                           },
//                           icon: null,
//                         ),
//                         const SizedBox(
//                           height: 22,
//                         ),
//                         const Text(
//                           "تواصل معنا",
//                           style: TextStyle(
//                             fontSize: 22,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 16,
//                         ),
//                         SettingsTile(
//                           title: 'الشكاوى',
//                           onTap: () {
//                             // Navigate to Terms Page
//                             Get.to(ComplaintTrackScreen());
//                           },
//                           icon: null,
//                         ),
//                         const SizedBox(
//                           height: 16,
//                         ),
//                         SettingsTile(
//                             title:
//                             '${settingsController.contactUsData!.phoneOne}',
//                             onTap: () {
//                               // Navigate to Terms Page
//                             },
//                             icon: const Icon(
//                               Icons.phone,
//                               color: AppColors.baseColor,
//                             )),
//                         const SizedBox(
//                           height: 16,
//                         ),
//                         SettingsTile(
//                             title:
//                             '${settingsController.contactUsData!.phoneTow}',
//                             onTap: () {
//                               // Navigate to Terms Page
//                             },
//                             icon: const Icon(
//                               Icons.phone,
//                               color: AppColors.baseColor,
//                             )),
//                         const SizedBox(
//                           height: 16,
//                         ),
//                         SettingsTile(
//                             title:
//                             '${settingsController.contactUsData!.email}',
//                             onTap: () {
//                               // Navigate to Terms Page
//                             },
//                             icon: const Icon(
//                               Icons.email_outlined,
//                               color: AppColors.baseColor,
//                             )),
//                         const SizedBox(
//                           height: 16,
//                         ),
//                         Container(
//                           padding:
//                           const EdgeInsets.symmetric(vertical: 15),
//                           margin: const EdgeInsets.symmetric(vertical: 8),
//                           height: height(context) * 0.08,
//                           width: double.maxFinite,
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: settingsController.isLoading
//                               ? Center(
//                             child: CircularProgressIndicator(),
//                           )
//                               : ListView.builder(
//                             itemCount: settingsController
//                                 .socialMediaData.length,
//                             scrollDirection: Axis.horizontal,
//                             itemBuilder: (context, index) {
//                               return InkWell(
//                                 onTap: () {
//                                   AppLinksHelper.launch(
//                                       link: settingsController
//                                           .socialMediaData[index]
//                                           .url!);
//                                 },
//                                 child: Padding(
//                                   padding:
//                                   const EdgeInsets.symmetric(
//                                       horizontal: 12),
//                                   child: SizedBox(
//                                     height: 50,
//                                     width: 50,
//                                     child: Image.network(
//                                         "${settingsController.socialMediaData[index].image}"),
//                                   ),
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 22,
//                         ),
//                         SettingsTile(
//                           title: "تسجيل الخروج",
//                           onTap: () {
//                             UserInfoPreference.deleteUserInfo();
//                             Get.offAll(LoginScreen());
//                           },
//                           icon: const Icon(
//                             Icons.logout,
//                             color: AppColors.baseColor,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               }),
//         ));
//   }
// }
//
// class SettingsTile extends StatelessWidget {
//   final String title;
//   final VoidCallback onTap;
//   Widget? icon;
//
//   SettingsTile(
//       {Key? key, required this.title, required this.onTap, required this.icon})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: const EdgeInsets.symmetric(vertical: 15),
//         margin: const EdgeInsets.symmetric(vertical: 8),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(10),
//           boxShadow: [
//             // BoxShadow(
//             //   color: AppColors.greyColor,
//             //   blurRadius: 1,
//             //   // offset: Offset(0, 2),
//             // ),
//           ],
//         ),
//         child: Row(
//           children: [
//             icon ?? Container(),
//             const SizedBox(
//               width: 12,
//             ),
//             Text(
//               title,
//               style: const TextStyle(
//                 fontSize: 18,
//               ),
//             ),
//
//             // Icon(Icons.arrow_forward_ios, color: Colors.grey),
//           ],
//         ),
//       ),
//     );
//   }
// }
