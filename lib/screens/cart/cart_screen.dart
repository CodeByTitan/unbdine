import 'package:flutter/material.dart';
import 'package:unbdine/screens/cart/order_details.dart';
import 'package:unbdine/screens/cart/required_info.dart';
import 'package:unbdine/screens/cart/totalamt_card.dart';
import 'package:unbdine/widgets/back_screen_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  static const routeName = '/cart_screen';

  @override
  Widget build(BuildContext context) {
    Widget defSizedBox = SizedBox(
      height: MediaQuery.of(context).size.height * 0.01,
    );
    return Scaffold(
      appBar: AppBar(
        leading: const BackScreenButton(),
        title: const Text('Backpack/Cart'),
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(15),
            /* margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height * 0.25,
            ), */

            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                // order details
                Text(
                  'Order Details',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                const OrderDetails(),
                const Divider(),
                // Required Info
                RequiredInfo(
                  defSizedBox: defSizedBox,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                )
              ],
            ),
          ),

          // total amount Card
          TotalAmount(
            defSizedBox: defSizedBox,
          ),
        ],
      ),
    );
  }
}
