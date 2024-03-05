import 'package:flutter/material.dart';
import 'package:mini_mall/application/tools/MyText.dart';
import 'package:mini_mall/application/tools/gyap.dart';
import 'package:mini_mall/application/tools/my_button.dart';
import 'package:mini_mall/application/tools/my_payment_methods_tile.dart';

class MyPaymentPage extends StatelessWidget {
  const MyPaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Payment Methods',
                style: subHeadingStyle,
              ),
              Gyap(
                height: 30,
              ),
              MyPaymentMethodTile(
                  ontap: () {
                    Navigator.pushNamed(context, 'UPIpage');
                  },
                  text: 'UPI',
                  subtitle: 'Pay by any UPI Apps',
                  icon: Icons.phone_android_rounded),
              MyPaymentMethodTile(
                  ontap: () {
                    Navigator.pushNamed(context, 'creditcardPage');
                  },
                  text: 'Credit/Debit/ATM cards',
                  subtitle: 'Add and secure cards as per RBI guidelines',
                  icon: Icons.credit_card),
              MyPaymentMethodTile(
                  ontap: () {},
                  text: 'Net Banking',
                  subtitle:
                      'Net banking is too slow..You can use UPI apps or Cards or better experience',
                  icon: Icons.house),
              Gyap(
                height: 30,
              ),
              MyButton(
                onTap: () {
                  Navigator.pushReplacementNamed(context, 'shopPage');
                },
                size: 10,
                child: Text(
                  'Back to Shop',
                  style: titleHeadStyle,
                ),
              ),
              Gyap(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
