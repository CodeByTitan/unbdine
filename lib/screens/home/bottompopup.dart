import 'package:flutter/material.dart';
import '../../classes/food_class.dart';
import '../../data/dummy_data.dart';
import '../../widgets/custom_icon_btn.dart';

class BottomPopUP extends StatefulWidget {
  final String foodName;
  final double foodPrice;
  final List<Addon> addons;
  const BottomPopUP({
    Key? key,
    required this.foodName,
    required this.foodPrice,
    required this.addons,
  }) : super(key: key);

  @override
  State<BottomPopUP> createState() => _BottomPopUPState();
}

int quantity = 1;

class _BottomPopUPState extends State<BottomPopUP> {
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.95,
      child: Column(
        children: [
          // food name
          Container(
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColorDark,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(widget.foodName),
          ),
          // cards
          Expanded(
            flex: 3,
            child: Scrollbar(
              controller: scrollController,
              thumbVisibility: true,
              child: ListView.builder(
                controller: scrollController,
                itemCount: 5,
                itemBuilder: (_, i) =>
                    FoodChoiceListTile(choiceName: 'choice ${i + 1}'),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(7.5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.5),
                color: Theme.of(context).backgroundColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Addons
                  Text(
                    'Addons : ',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  SizedBox(
                    height: 30,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: addons.length,
                      itemBuilder: (_, i) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(),
                        ),
                        alignment: Alignment.center,
                        height: 20,
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        margin: const EdgeInsets.only(
                          left: 10,
                        ),
                        child: Text(
                          addons[i].addonName,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                    ),
                  ),
                  // Quantity
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Quantity',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: (quantity < 2)
                                ? () {}
                                : () {
                                    setState(() {
                                      quantity--;
                                    });
                                  },
                            child: Icon(
                              Icons.remove,
                              color: Theme.of(context).primaryIconTheme.color,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            '$quantity',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                quantity++;
                              });
                            },
                            child: Icon(
                              Icons.add,
                              color: Theme.of(context).primaryIconTheme.color,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // Total
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Price',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      Text(
                        '\$ ${(widget.foodPrice * quantity).toStringAsFixed(2)}',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                  // add to cart Button
                  Center(
                    child: CustomIconButton(
                      buttontext: 'Add to Cart',
                      buttonIcon: const Icon(Icons.add_shopping_cart),
                      bottomPadding: 0,
                      buttonFunction: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
          // Addons
        ],
      ),
    );
  }
}

// food choice tile
class FoodChoiceListTile extends StatelessWidget {
  final String choiceName;
  const FoodChoiceListTile({
    Key? key,
    required this.choiceName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(7.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.5),
        color: Theme.of(context).backgroundColor,
      ),
      child: Column(
        children: [
          Text(
            choiceName,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'option 1',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Checkbox(
                value: false,
                onChanged: (x) {},
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'option 2',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Checkbox(
                value: false,
                onChanged: (x) {},
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'option 3',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Checkbox(
                value: false,
                onChanged: (x) {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
