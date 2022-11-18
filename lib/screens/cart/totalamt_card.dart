import 'package:flutter/material.dart';

import '../payment/payment_screen.dart';
import '../../widgets/custom_icon_btn.dart';

class TotalAmount extends StatelessWidget {
  final Widget defSizedBox;
  const TotalAmount({
    Key? key,
    required this.defSizedBox,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.only(
          top: 20,
          left: 40,
          right: 40,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.amber[700],
        ),
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Sub Total'),
                    Text('\$Amount'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Addons'),
                    Text('\$Amount'),
                  ],
                ),
                defSizedBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Grand Total',
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                    ),
                    Text(
                      '\$Amount',
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                    ),
                  ],
                ),
                defSizedBox,
                const Divider(
                  color: Colors.blueGrey,
                  thickness: 0.4,
                ),
                defSizedBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                    ),
                    Text(
                      '\$Amount',
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                    ),
                  ],
                ),
                const Spacer(),
                CustomIconButton(
                  buttontext: 'Proceed to Pay',
                  buttonIcon: const Icon(Icons.payment),
                  bottomPadding: 15,
                  buttonFunction: () {
                    Navigator.of(context).pushNamed(PaymentScreen.routeName);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
