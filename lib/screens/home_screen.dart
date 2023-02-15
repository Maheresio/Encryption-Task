import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import '../helper/decryption.dart';
import '../helper/encryption.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController dropDownController = TextEditingController();
  TextEditingController textController = TextEditingController();
  TextEditingController keyController = TextEditingController();
  bool isPressed = false;
  String result = '';

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).viewPadding;
    final deviceHeight =
        MediaQuery.of(context).size.height - padding.top - padding.bottom;
    final deviceWidth = MediaQuery.of(context).size.width;
    final textScale = MediaQuery.of(context).textScaleFactor;

    var items = [
      'Caesar Cipher',
      'Monoalphabetic Cipher',
      'Polyalphabetic Cipher',
      'playfair',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Encryption & Decryption'),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: SizedBox(
          width: deviceWidth,
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: deviceWidth * .02,
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: deviceHeight * .05,
                    ),
                    SizedBox(
                      width: deviceWidth * .8,
                      child: CustomDropdown(
                          borderRadius: BorderRadius.circular(
                            20,
                          ),
                          items: items,
                          controller: dropDownController,
                          hintText: 'Select Your Technique',
                          hintStyle: TextStyle(
                            height: deviceHeight * .0035,
                          ),
                          onChanged: (val) {}),
                    ),
                    SizedBox(height: deviceHeight * .05),
                    SizedBox(
                      width: deviceWidth * .8,
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        controller: textController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                style: BorderStyle.solid,
                              ),
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: deviceWidth * .04,
                              vertical: deviceHeight * .02,
                            ),
                            labelText: 'Your Text',
                            filled: true,
                            //<-- SEE HERE
                            fillColor: Colors.white,
                            labelStyle: const TextStyle(
                              color: Color(
                                0xFFA7A7A7,
                              ),
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.never),
                      ),
                    ),
                    SizedBox(
                      height: deviceHeight * .05,
                    ),
                    SizedBox(
                      width: deviceWidth * .8,
                      child: TextFormField(
                        keyboardType:
                            dropDownController.text.toString() == items[3]
                                ? TextInputType.text
                                : TextInputType.number,
                        controller: keyController,
                        enabled: dropDownController.text.toString() == items[1]
                            ? false
                            : true,
                        decoration: InputDecoration(
                            filled: true,
                            //<-- SEE HERE
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                style: BorderStyle.solid,
                              ),
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: deviceWidth * .04,
                              vertical: deviceHeight * .02,
                            ),
                            labelStyle: const TextStyle(
                              color: Color(
                                0xFFA7A7A7,
                              ),
                            ),
                            labelText: dropDownController.text.toString() == items[1]?'No Key':'Your Key',
                            floatingLabelBehavior: FloatingLabelBehavior.never),
                      ),
                    ),
                    SizedBox(
                      height: deviceHeight * .05,
                    ),
                    SizedBox(
                      width: deviceWidth * .8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          AnimatedButton(
                            //isSelected: isPressed,
                            text: 'Encrypt',
                            onPress: () {
                              setState(() {
                                if (dropDownController.text.toString() ==
                                    items[0]) {
                                  result = Encryption.caesarEncryption(
                                      value: textController.text.toString(),
                                      k: int.parse(
                                          keyController.text.toString()));
                                  isPressed = !isPressed;
                                } else if (dropDownController.text.toString() ==
                                    items[1]) {
                                  result = Encryption.monoEncryption(
                                      value: textController.text.toString());
                                  isPressed = !isPressed;
                                } else if (dropDownController.text.toString() ==
                                    items[2]) {
                                  result = Encryption.polyEncryption(
                                      value: textController.text.toString(),
                                      k: int.parse(
                                          keyController.text.toString()));
                                  isPressed = !isPressed;
                                } else if (dropDownController.text.toString() ==
                                    items[3]) {
                                  print('******************************************');

                                  result = Encryption.playfairEncryption(
                                      value: textController.text.toString(),
                                      k: keyController.text.toString());
                                  isPressed = !isPressed;
                                }
                                isPressed = !isPressed;
                              });
                            },
                            height: deviceHeight * .09,
                            width: deviceWidth * .35,
                            isReverse: true,
                            selectedTextColor: Theme.of(context).primaryColor,
                            transitionType: TransitionType.LEFT_TO_RIGHT,
                            textStyle: TextStyle(
                              fontSize: textScale * 25,
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                            ),
                            backgroundColor: Theme.of(context).primaryColor,
                            borderColor: Colors.white,
                            borderRadius: 20,
                            borderWidth: 2,
                          ),
                          const Spacer(),
                          AnimatedButton(
                            isSelected: isPressed,
                            text: 'Decrypt',
                            selectedBackgroundColor:
                                Theme.of(context).primaryColor,
                            onPress: () {
                              setState(() {
                                if (dropDownController.text.toString() ==
                                    items[0]) {
                                  result = Decryption.caesarDecryption(
                                      value: textController.text.toString(),
                                      k: int.parse(
                                          keyController.text.toString()));
                                  isPressed = !isPressed;
                                } else if (dropDownController.text.toString() ==
                                    items[1]) {
                                  result = Decryption.monoDecryption(
                                      value: textController.text.toString());
                                  isPressed = !isPressed;
                                } else if (dropDownController.text.toString() ==
                                    items[2]) {
                                  result = Decryption.polyDecryption(
                                      value: textController.text.toString(),
                                      k: int.parse(
                                          keyController.text.toString()));
                                  isPressed = !isPressed;
                                } else if (dropDownController.text.toString() ==
                                    items[3]) {
                                  result = Decryption.playfairDecryption(
                                      value: textController.text.toString(),
                                      key: keyController.text.toString());
                                  isPressed = !isPressed;
                                }
                                isPressed = !isPressed;
                              });
                            },
                            height: deviceHeight * .09,
                            width: deviceWidth * .35,
                            isReverse: true,
                            selectedTextColor: Colors.white,
                            transitionType: TransitionType.LEFT_TO_RIGHT,
                            textStyle: TextStyle(
                              fontSize: textScale * 25,
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w300,
                            ),
                            backgroundColor: Colors.white,
                            borderColor: Colors.white,
                            borderRadius: 20,
                            borderWidth: 2,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: deviceHeight * .03,
                    ),
                    AnimatedButton(
                      text: 'Reset',
                      onPress: () {
                        isPressed = false;

                        textController.clear();
                        keyController.clear();
                        dropDownController.clear();
                        setState(() {
                          result = '';
                        });
                      },
                      height: deviceHeight * .09,
                      width: deviceWidth * .35,
                      isReverse: true,
                      selectedTextColor: Theme.of(context).primaryColor,
                      transitionType: TransitionType.CENTER_LR_IN,
                      textStyle: TextStyle(
                        fontSize: textScale * 25,
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                      ),
                      backgroundColor: Colors.red,
                      borderColor: Colors.white,
                      borderRadius: 20,
                      borderWidth: 2,
                    ),
                    SizedBox(
                      height: deviceHeight * .05,
                    ),
                    SizedBox(
                      width: deviceWidth,
                      child: DefaultTextStyle(
                        style: TextStyle(
                          fontSize: textScale * 30,
                          color: Theme.of(context).primaryColor,
                          fontFamily: 'Agne',
                        ),
                        child: Center(
                          child: SelectableText(result),
                          // child: AnimatedTextKit(
                          //   animatedTexts: [
                          //     TypewriterAnimatedText(
                          //       result,
                          //     ),
                          //   ],
                          // ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    textController.dispose();
    dropDownController.dispose();
    keyController.dispose();
    super.dispose();
  }
}
