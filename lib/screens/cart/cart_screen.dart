import 'package:flutter/material.dart';
import 'package:unbdine/widgets/back_screen_button.dart';
import 'package:unbdine/widgets/custom_icon_btn.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  static const routeName = '/cart_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackScreenButton(),
        title: const Text('Backpack/Cart'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            // purchased item list
            Expanded(
              flex: 3,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Center(
                    child: Container(
                      margin: const EdgeInsets.only(right: 8),
                      width: 150,
                      height: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  );
                },
              ),
            ),
            // stats
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Cafeteria current status',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Enter pickup time',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ],
                    ),
                    // payment method
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Select a payment method',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // items list
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${index + 1}. itemsName',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                          Text(
                            'pricing',
                            style:
                                Theme.of(context).textTheme.headline4!.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            // proceed to pay button
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: CustomIconButton(
                  buttontext: 'Proceed to Pay',
                  buttonIcon: const Icon(Icons.payment),
                  // TODO : pay function
                  buttonFunction: () {},
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
