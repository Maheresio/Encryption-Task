
import '../app_constants/constants.dart';

class Decryption {
  static caesarDecryption({required String value,  int? k}) {
    String text = value.toLowerCase();
    int? key = k;

    String cipher = '';

    for (int i = 0; i < text.length; ++i) {
      String char = text[i];
      if (char == ' ') {
        continue;
      } else {
        int valIndex = (AppConstants.alpha.indexOf(char) - key!) % 26;
        cipher += AppConstants.alpha[valIndex];
      }
    }
    return cipher;
  }

  static monoDecryption({
    required String value,
  }) {
    String text = value.toLowerCase();
    String cipher = '';

    for (int i = 0; i < text.length; ++i) {
      String char = text[i];
      if (char == ' ') {
        continue;
      } else {
        int valIndex = AppConstants.secondAlpha.indexOf(char);
        cipher += AppConstants.alpha[valIndex];
      }
    }
    return cipher;
  }

  static polyDecryption({required String value,  int? k}) {
    String text = value.toLowerCase();
    int? key = k;
    String cipher = '';

    for (int i = 0; i < text.length; ++i) {
      String char = text[i];
      if (char == ' ') {
        continue;
      } else {
        int valIndex = (AppConstants.alpha.indexOf(char) - key! + 26) % 26;
        key = valIndex;
        cipher += AppConstants.alpha[valIndex];
      }
    }
    return cipher;
  }

  static playfairDecryption({required String value,required String key}) {
    var text = '';
    var text1 = value;
    if(text1 == '') {
      // document.getElementById('result').innerHTML = error;
    }
    var keyresult = AppConstants.processKey(k: key);
    for(var i = 0; i < text1.length; i += 2){
      var pair1 = text1[i];
      var pair2 = text1[i + 1];
      var p1i, p1j, p2i, p2j;
      for(var stroka = 0; stroka < keyresult.length; stroka++) {
        for(var stolbec = 0; stolbec < keyresult[stroka].length; stolbec++){
          if (keyresult[stroka][stolbec] == pair1){
            p1i = stroka;
            p1j = stolbec;
          }
          if (keyresult[stroka][stolbec] == pair2){
            p2i = stroka;
            p2j = stolbec;
          }
        }
      }
      var coord1 = '', coord2 = '';

      if(p1i == p2i) {
        if(p1j == 0) {
          coord1 = keyresult[p1i][4];
        }
        else {
          coord1 = keyresult[p1i][p1j - 1];
        }
        if(p2j == 0) {
          coord2 = keyresult[p2i][4];
        }
        else {
          coord2 = keyresult[p2i][p2j - 1];
        }
      }
      if(p1j == p2j) {
        if(p1i == 0) {
          coord1 = keyresult[4][p1j];
        }
        else {
          coord1 = keyresult[p1i - 1][p1j];
        }
        if(p2i == 0) {
          coord2 = keyresult[4][p2j];
        }
        else {
          coord2 = keyresult[p2i - 1][p2j];
        }
      }
      if(p1i != p2i && p1j != p2j) {
        coord1 = keyresult[p1i][p2j];
        coord2 = keyresult[p2i][p1j];
      }
      text = text + coord1 + coord2;
    }
    List<String>tList=text.split('');

    for(var i = 0; i < tList.length; i++) {
      var count;
      if (AppConstants.flagAdd) {
        if(tList[i] == tList[i + 2] && (tList[i + 1] == 'X' || tList[i + 1] == 'Q')) {
          count = i + 1;
          //tList.splice(count, 1);
          tList.sublist(count,1);
        }
      }
      else if(AppConstants.flagAdd && AppConstants.isEnd && (AppConstants.flagX || !AppConstants.flagX)) {
        if(tList[i - 2] == tList[i] && (tList[i - 1] == 'X' || tList[i - 1] == 'Q')) {
          count = i + 1;
        }
        tList.sublist(count, 1);
      }
      else if(!AppConstants.flagAdd) {
        break;
      }
    }
    if(AppConstants.flagX) {
      tList.removeLast();
    }
    if(AppConstants.isEnd && !AppConstants.flagX) {
      tList.removeLast();
    }
    //tList = tList.join('');
    String result=tList.join('');
    return result;
  }


}
