import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PaymentDetailsScreen extends StatelessWidget {
  const PaymentDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                color: Colors.blueGrey.shade800,
                height: MediaQuery.of(context).size.height * 0.3,
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(
                      top: 15, start: 10, end: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 85.0),
                      const Text(
                        'Add New Card',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.0,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.725,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    )),
                margin: const EdgeInsetsDirectional.only(top: 175),
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(
                      start: 30, top: 30, end: 30, bottom: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 80.0,
                      ),
                      const Text(
                        'Card Number',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          CardNumberFormatter(),
                        ],
                        decoration: InputDecoration(
                          hintText: 'xxxx xxxx xxxx xxxx',
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Colors.grey.shade200,
                              width: 2.0,
                            ),
                          ),
                        ),
                        maxLength: 19,
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Expire Date',
                                style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 3,
                                child: TextFormField(
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    CardExpirationFormatter(),
                                  ],
                                  decoration: InputDecoration(
                                    hintText: 'MM/YY',
                                    fillColor: Colors.grey.shade200,
                                    filled: true,
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: const BorderSide(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide(
                                        color: Colors.grey.shade200,
                                        width: 2.0,
                                      ),
                                    ),
                                  ),
                                  keyboardType: TextInputType.number,
                                  maxLength: 5,
                                ),
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'CVV',
                                style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 3,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: '548',
                                    fillColor: Colors.grey.shade200,
                                    filled: true,
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: const BorderSide(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide(
                                        color: Colors.grey.shade200,
                                        width: 2.0,
                                      ),
                                    ),
                                  ),
                                  keyboardType: TextInputType.number,
                                  maxLength: 3,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        'Name',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Enter Your Name',
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Colors.grey.shade200,
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Center(
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.07,
                          width: MediaQuery.of(context).size.width * 0.5,
                          decoration: BoxDecoration(
                            color: Colors.blueGrey.shade800,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: const Center(
                            child: Text(
                              'Add Card',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 80,
                left: 60,
                right: 60,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: MediaQuery.of(context).size.height / 4.5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            image: const DecorationImage(
                                image: NetworkImage(
                                  'https://pbs.twimg.com/profile_images/1214220012979920898/N4tFtfjN_400x400.png',
                                ),
                                fit: BoxFit.cover)),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// give space between 4 digits
class CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue previousValue,
    TextEditingValue nextValue,
  ) {
    var inputText = nextValue.text;

    if (nextValue.selection.baseOffset == 0) {
      return nextValue;
    }

    var bufferString = StringBuffer();
    for (int i = 0; i < inputText.length; i++) {
      bufferString.write(inputText[i]);
      var nonZeroIndexValue = i + 1;
      if (nonZeroIndexValue % 4 == 0 && nonZeroIndexValue != inputText.length) {
        bufferString.write(' ');
      }
    }

    var string = bufferString.toString();
    return nextValue.copyWith(
      text: string,
      selection: TextSelection.collapsed(
        offset: string.length,
      ),
    );
  }
}

// implement text field formatter for expire credit card date like this MM/YY
class CardExpirationFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final newValueString = newValue.text;
    String valueToReturn = '';

    for (int i = 0; i < newValueString.length; i++) {
      if (newValueString[i] != '/') valueToReturn += newValueString[i];
      var nonZeroIndex = i + 1;
      final contains = valueToReturn.contains(RegExp(r'\/'));
      if (nonZeroIndex % 2 == 0 &&
          nonZeroIndex != newValueString.length &&
          !(contains)) {
        valueToReturn += '/';
      }
    }
    return newValue.copyWith(
      text: valueToReturn,
      selection: TextSelection.fromPosition(
        TextPosition(offset: valueToReturn.length),
      ),
    );
  }
}
