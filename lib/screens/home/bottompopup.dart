import 'package:flutter/material.dart';
import '../../classes/food_class.dart';
import '../../data/dummy_data.dart';
import '../../widgets/custom_icon_btn.dart';

// TODO : Customize Texts and backgrounds

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
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height * 0.35,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(
        left: 25,
        right: 25,
        top: 10,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.foodName,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          //Quantity
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
          //Addons
          Text(
            'Addons : ',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          // TODO : add addon price to total
          // TODO : make addons selectable
          SizedBox(
            height: 30,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: addons.length,
              itemBuilder: (_, i) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[200],
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
          //Price
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
          Center(
            child: CustomIconButton(
              buttontext: 'Add to Cart',
              buttonIcon: const Icon(Icons.add_shopping_cart),
              buttonFunction: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
