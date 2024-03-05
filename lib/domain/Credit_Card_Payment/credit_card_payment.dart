import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:mini_mall/application/tools/MyText.dart';

class CreditCardPayment extends StatefulWidget {
  const CreditCardPayment({super.key});

  @override
  State<StatefulWidget> createState() => CreditCardPaymentState();
}

class CreditCardPaymentState extends State<CreditCardPayment> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        automaticallyImplyLeading: false,
        title: Text(
          'Credit Card Payment',
          style: subHeadingStyle,
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            CreditCardWidget(
              height: MediaQuery.of(context).size.height * 0.3,
              chipColor: const Color.fromARGB(255, 199, 190, 109),
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              bankName: 'Federal Bank',
              showBackView: isCvvFocused,
              obscureCardNumber: true,
              obscureCardCvv: true,
              isHolderNameVisible: true,
              onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    CreditCardForm(
                      formKey: formKey,
                      obscureCvv: true,
                      obscureNumber: true,
                      cardNumber: cardNumber,
                      cvvCode: cvvCode,
                      isHolderNameVisible: true,
                      isCardNumberVisible: true,
                      isExpiryDateVisible: true,
                      cardHolderName: cardHolderName,
                      expiryDate: expiryDate,
                      inputConfiguration: InputConfiguration(
                        cardNumberTextStyle: titleHeadStyle,
                        cardHolderTextStyle: titleHeadStyle,
                        expiryDateTextStyle: titleHeadStyle,
                        cvvCodeTextStyle: titleHeadStyle,
                        cardNumberDecoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.blueAccent),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelText: 'Account Number',
                          hintText: 'XXXX XXXX XXXX XXXX',
                          hintStyle: titleHeadStyle,
                          labelStyle: titleHeadStyle,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),

                        // expry date
                        expiryDateDecoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.blueAccent),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            labelText: 'Expired Date',
                            hintText: 'XX/XX',
                            hintStyle: titleHeadStyle,
                            labelStyle: titleHeadStyle),

                        //cvv
                        cvvCodeDecoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.blueAccent),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            labelText: 'CVV',
                            hintText: 'XXX',
                            hintStyle: titleHeadStyle,
                            labelStyle: titleHeadStyle),
                        // card holder
                        cardHolderDecoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.blueAccent),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            labelText: 'Card Holder',
                            hintStyle: titleHeadStyle,
                            labelStyle: titleHeadStyle),
                      ),
                      onCreditCardModelChange: onCreditCardModelChange,
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          print('valid');
                          Navigator.pop(context);
                        } else
                          print('invalid');
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: <Color>[
                              Color.fromARGB(255, 134, 175, 212),
                              Color.fromARGB(255, 19, 35, 124),
                              Color.fromARGB(255, 3, 154, 165),
                            ],
                            begin: Alignment(-1, -4),
                            end: Alignment(1, 4),
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        alignment: Alignment.center,
                        child: const Text(
                          'Validate',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'halter',
                            fontSize: 14,
                            package: 'flutter_credit_card',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
