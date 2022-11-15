import 'package:flutter/material.dart';
import 'package:unbdine/screens/cart/required_info.dart';

import '../../data/dummy_data.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: orderedFood.length,
        itemBuilder: (_, i) {
          return Center(
            child: Column(
              children: [
                Container(
                  /* height: 100,
                  width: 200, */
                  margin: const EdgeInsets.only(
                    bottom: 10,
                  ),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withAlpha(25),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // TODO : add image
                          Container(
                            height: 75,
                            width: 75,
                            color: Colors.black,
                          ),
                          // counter
                          Container(
                            height: 30,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .primaryColor
                                    .withAlpha(50),
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.remove,
                                    size: 14,
                                  ),
                                ),
                                Text(
                                  '${orderedFood[i].quantity}',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.add,
                                    size: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // info
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                orderedFood[i].foodName,
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              Text(
                                '\$ ${orderedFood[i].foodPrice}',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 30,
                        padding: const EdgeInsets.symmetric(
                          vertical: 0,
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        // addons
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Addons : ',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (_, j) => Padding(
                                  padding: const EdgeInsets.all(3),
                                  child: Text(
                                    '${orderedFood[i].addons[j].addonName}, ',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                ),
                                itemCount: orderedFood[i].addons.length,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: i == orderedFood.length - 1,
                  child: RequiredInfo(
                    defSizedBox: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
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
