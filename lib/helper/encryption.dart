import '../app_constants/constants.dart';

class Encryption {
  //encrypt cipher ceaser

  static caesarEncryption({required String value, int? k}) {
    String text = value.toLowerCase();
    int? key = k;

    String cipher = '';

    for (int i = 0; i < text.length; ++i) {
      String char = text[i];
      if (char == ' ') {
        continue;
      } else {
        int valIndex = (AppConstants.alpha.indexOf(char) + key!) % 26;
        cipher += AppConstants.alpha[valIndex];
      }
    }
    return cipher;
  }

  static monoEncryption({
    required String value,
  }) {
    String text = value.toLowerCase();
    String cipher = '';

    for (int i = 0; i < text.length; ++i) {
      String char = text[i];
      if (char == ' ') {
        continue;
      } else {
        int valIndex = AppConstants.alpha.indexOf(char);
        cipher += AppConstants.secondAlpha[valIndex];
      }
    }
    return cipher;
  }

  static polyEncryption({required String value, int? k}) {
    String text = value.toLowerCase();
    int? key = k;
    String cipher = '';

    for (int i = 0; i < text.length; ++i) {
      String char = text[i];
      if (char == ' ') {
        continue;
      } else {
        int valIndex = ((AppConstants.alpha.indexOf(char) + key!) % 26);
        key = AppConstants.alpha.indexOf(char);
        cipher += AppConstants.alpha[valIndex];
      }
    }
    return cipher;
  }

  static playfairEncryption({required String value, required String k}) {
    var keyresult = AppConstants.processKey(k: k);
    var str = value;
    if (str == '') {
      // warning
    }
    // var err = 'ERRORX';
    var textPhrase, separator;
    //str = str.toUpperCase().replace(/\s/g, '').replace(/J/g, "I");
    str = str.toUpperCase()
      ..replaceAll('S', '')
      ..replaceAll('J', 'I');

    if (str.isEmpty) {
    } else {
      textPhrase = str[0];
    }
    var help = 0;
    AppConstants.flagAdd = false;
    for (var i = 1; i < str.length; i++) {
      if (str[i - 1] == str[i]) {
        if (str[i] == 'X') {
          separator = 'Q';
        } else {
          separator = 'X';
        }
        textPhrase += separator + str[i];
        help = 1;
      } else {
        textPhrase += str[i];
      }
      if (help == 1) {
        AppConstants.flagAdd = true;
      }
    }

    if (textPhrase.length % 2 != 0) {
      if (textPhrase[textPhrase.length - 1] == 'X') {
        textPhrase += 'Q';
        AppConstants.isEnd = true;
        AppConstants.flagX = false;
      } else {
        textPhrase += 'X';
        AppConstants.isEnd = true;
        AppConstants.flagX = true;
      }
    }

    var enCodeStr = '';
    for (var i = 0; i < textPhrase.length; i += 2) {
      var pair1 = textPhrase[i];
      var pair2 = textPhrase[i + 1];
      var p1i, p1j, p2i, p2j;
      for (var stroka = 0; stroka < keyresult.length; stroka++) {
        for (var stolbec = 0; stolbec < keyresult[stroka].length; stolbec++) {
          if (keyresult[stroka][stolbec] == pair1) {
            p1i = stroka;
            p1j = stolbec;
          }
          if (keyresult[stroka][stolbec] == pair2) {
            p2i = stroka;
            p2j = stolbec;
          }
        }
      }
      var coord1 = '', coord2 = '';
      print('////////////////');
      print(p2i);
      print(p2j);
      if (p1i == p2i) {
        if (p1j == 4) {
          coord1 = keyresult[p1i][0];
        } else {
          coord1 = keyresult[p1i][p1j + 1];
        }
        if (p2j == 4) {
          coord2 = keyresult[p2i][0];
        } else {
          coord2 = keyresult[p2i][p2j + 1];
        }
      }
      if (p1j == p2j) {
        if (p1i == 4) {
          coord1 = keyresult[0][p1j];
        } else {
          coord1 = keyresult[p1i + 1][p1j];
        }
        if (p2i == 4) {
          coord2 = keyresult[0][p2j];
        } else {
          coord2 = keyresult[p2i + 1][p2j];
        }
      }
      if (p1i != p2i && p1j != p2j) {
        coord1 = keyresult[p1i][p2j];
        coord2 = keyresult[p2i][p1j];
      }
      enCodeStr = enCodeStr + coord1 + coord2;
    }
    // enCodeStr;
    return enCodeStr;
  }
}
