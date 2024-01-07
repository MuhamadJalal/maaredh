class Validator {
  Validator._internal();

  static final Validator _instance = Validator._internal();

  factory Validator() => _instance;

  bool isTextLengthNotValid(String text, {int validLength = 1}) => text.length < validLength;

  bool isTextMatches(String firstString, String secondString) => firstString == secondString;

  bool isPhoneValid(String phone) => phone.length == 11 && isNumeric(phone);

  bool isWebsiteValid(String website) {
    // String p = r"/\b(?:(?:https?|ftp):\/\/|www\.)[-a-z0-9+&@#\/%?=~_|!:,.;]*[-a-z0-9+&@#\/%=~_|]/i";
    //
    // RegExp regExp =  RegExp(p);
    //
    // debugPrint('\n\n\n website $website \n\n\n');
    // return regExp.hasMatch(website);

    return website.startsWith('http') && (website.contains('.io') || website.contains('.com'));
  }

  bool isEmail(String em) {
    String? p = r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

    RegExp regExp = RegExp(p);

    return regExp.hasMatch(em);
  }

  bool isNumeric(String str) {
    String? engNum = replaceArabicNumber(str);

    if (engNum == null) {
      return false;
    }

    return double.tryParse(engNum) != null;
  }

  String? replaceArabicNumber(String input) {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const arabic = ["٠", "١", "٢", "٣", "٤", "٥", "٦", "٧", "٨", "٩"];

    for (int i = 0; i < english.length; i++) {
      input = input.replaceAll(arabic[i], english[i]);
    }

    return input;
  }

  String? removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    RegExp exp2 = RegExp(r"&[^>]*;", multiLine: true, caseSensitive: true);
    var text = htmlText.replaceAll(exp, '');
    return text.replaceAll(exp2, '');
  }
}
