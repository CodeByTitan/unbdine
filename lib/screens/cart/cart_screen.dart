import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import './order_details.dart';
import './required_info.dart';
import './totalamt_card.dart';
import '../../widgets/back_screen_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  static const routeName = '/cart_screen';

  @override
  Widget build(BuildContext context) {
    Widget defSizedBox = SizedBox(
      height: MediaQuery.of(context).size.height * 0.01,
    );
    return KeyboardDismissOnTap(
      child: KeyboardVisibilityBuilder(
        builder: (
          context,
          isKeyboardVisible,
        ) {
          return Scaffold(
            appBar: AppBar(
              leading: const BackScreenButton(),
              title: const Text('Backpack/Cart'),
            ),
            body: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.65,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(15),
                  /* margin: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * 0.25,
                    ), */

                  child: ListView(
                    physics: isKeyboardVisible
                        ? const NeverScrollableScrollPhysics()
                        : const BouncingScrollPhysics(),
                    children: [
                      // order details
                      Text(
                        isKeyboardVisible ? '' : 'Order Details',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      Visibility(
                        visible: !isKeyboardVisible,
                        child: const OrderDetails(),
                      ),
                      const Divider(),
                      // Required Info
                      RequiredInfo(
                        defSizedBox: defSizedBox,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
                      )
                    ],
                  ),
                ),

                // total amount Card
                Visibility(
                  visible: !isKeyboardVisible,
                  child: TotalAmount(
                    defSizedBox: defSizedBox,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
