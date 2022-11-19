import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});
  static const routeName = '/payment_screen';

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Payment'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              left: 20,
            ),
            child: Text(
              'Saved Cards',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Expanded(
            flex: 2,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (_, i) => Container(
                margin: const EdgeInsets.all(20),
                width: 250,
                decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Card ${i + 1}',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 10,
              left: 20,
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 15,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              'Add a new Payment Option',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              margin: const EdgeInsets.only(
                top: 15,
              ),
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (_, i) => Container(
                  margin: const EdgeInsets.only(
                    bottom: 10,
                    left: 15,
                    right: 15,
                  ),
                  height: 50,
                  decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Payment Option ${i + 1}',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
