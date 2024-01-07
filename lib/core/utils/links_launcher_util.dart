import 'package:url_launcher/url_launcher_string.dart';

class AppLinkLauncher {
  AppLinkLauncher._internal();

  static final AppLinkLauncher _instance = AppLinkLauncher._internal();

  factory AppLinkLauncher() => _instance;

  launchURl(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  makePhoneCall({required String phoneNumber}) async {
    if (await canLaunchUrlString('tel:$phoneNumber')) {
      await launchUrlString('tel:$phoneNumber');
    } else {
      throw 'Could not call $phoneNumber';
    }
  }

  sendSMS(String phoneNumber) async {
    if (await canLaunchUrlString('sms:$phoneNumber')) {
      await launchUrlString('sms:$phoneNumber');
    } else {
      throw 'Could not call $phoneNumber';
    }
  }

  openWhatsApp({required String whatsAppNumber}) async {
    if (await canLaunchUrlString('whatsapp://send?phone=$whatsAppNumber')) {
      // debugPrint('\n\n canLaunchUrlString: ${canLaunchUrlString('whatsapp://send?phone=$whatsAppNumber')} \n\n');
      await launchUrlString('whatsapp://send?phone=$whatsAppNumber');
      // debugPrint('\n\n after canLaunchUrlString: ${canLaunchUrlString('whatsapp://send?phone=$whatsAppNumber')} \n\n');
    } else {
      throw 'Could not call $whatsAppNumber';
    }
  }

  Future<void> sendEmail({required String email}) async {
    if (await canLaunchUrlString("mailto:$email")) {
      await launchUrlString("mailto:$email");
    } else {
      throw 'Could not launch';
    }
  }

/* async {
  final Email email = Email(
    body: '',
    subject: 'دعم فني',

    /// todo add receiver mail
//    cc: [AppRepo.contactUsModel.email],
    recipients: [recipient],
    isHTML: false,
  );
  await FlutterEmailSender.send(email);
}*/
}
