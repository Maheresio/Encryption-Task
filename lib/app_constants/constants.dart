class AppConstants {
  static List<String> alpha = [
    'a',
    'b',
    'c',
    'd',
    'e',
    'f',
    'g',
    'h',
    'i',
    'j',
    'k',
    'l',
    'm',
    'n',
    'o',
    'p',
    'q',
    'r',
    's',
    't',
    'u',
    'v',
    'w',
    'x',
    'y',
    'z'
  ];


  static List<String>secondAlpha

  = [
    'j',
    'k',
    'l',
    'm',
    'n',
    'o',
    'p',
    'q',
    'r',
    's',
    't',
    'u',
    'v',
    'w',
    'x',
    'y',
    'z',
    'a',
    'b',
    'c',
    'd',
    'e',
    'f',
    'g',
    'h',
    'i'

  ];

  static var isChet = false;
  static var isEnd = false;
  static var flag = false;
  static var flagX = false;
  static var flagAdd = false;  static processKey({required String k}) {
    var key = k;
    //key = key.toUpperCase().replace(/\s/g, '').replace(/J/g, "I");
    key = key.toUpperCase()..replaceAll('S','')..replaceAll('J', 'I');
    var result = [];
    var temp = '';
    var alphabet = 'ABCDEFGHIKLMNOPQRSTUVWXYZ';
    for(var i = 0; i < key.length; i++) {
      if (alphabet.contains(key[i])) {
        alphabet = alphabet.replaceAll(key[i], '');
        temp += key[i];
      }
    }
    temp += alphabet;

    // temp = temp.split('');
    List<String> tList = temp.split('') ;
    while(tList.isNotEmpty) {
      // result.add(temp.splice(0,5));
      result.add(tList.sublist(0,5));
      tList.removeRange(0,5);
    }
    return result;
  }


}