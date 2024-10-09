import 'dart:io';

import 'package:url_launcher/url_launcher.dart';

class AppLinksHelper {
  static openWhatsapp({required String phone}) async {
    // String fallbackUrl = "https://wa.me/?text=hello";
    Uri? bundleUri;
    var contact = "+${phone}";
    var androidUrl = "whatsapp://send?phone=$contact&text=Hi, I need some help";
    var iosUrl =
        "https://wa.me/$contact?text=${Uri.parse('Hi, I need some help')}";
    String fallbackUrl = "https://whatsapp.com";
    try {
      if (Platform.isAndroid) {
        bundleUri = Uri.parse(
          androidUrl,
        );
      } else if (Platform.isIOS) {
        bundleUri = Uri.parse(
          iosUrl,
        );
      }
      var canLaunchNatively = await canLaunchUrl(
        bundleUri!,
      );

      if (canLaunchNatively) {
        launchUrl(bundleUri, mode: LaunchMode.externalApplication);
      } else {
        await launchUrl(Uri.parse(fallbackUrl),
            mode: LaunchMode.externalApplication);
      }
    } catch (e, st) {
      // Handle this as you prefer
    }
  }

  static launch({required String link}) async {
    print("link from helper$link");
    String protocolUrl;
    if (Platform.isIOS) {
      protocolUrl = link;
    } else {
      protocolUrl = '';
    }

    String fallbackUrl = link;

    try {
      Uri fbBundleUri = Uri.parse(protocolUrl);
      var canLaunchNatively = await canLaunchUrl(fbBundleUri);

      if (canLaunchNatively) {
        launchUrl(fbBundleUri, mode: LaunchMode.externalApplication);
      } else {
        await launchUrl(Uri.parse(fallbackUrl),
            mode: LaunchMode.externalApplication);
      }
    } catch (e, st) {
      // Handle this as you prefer
    }
  }
}
