import 'package:flutter/material.dart';
import '../../classes/addon_class.dart';
import '../../classes/choices_class.dart';
import '../../widgets/custom_icon_btn.dart';

class BottomPopUP extends StatefulWidget {
  final String foodId;
  final String foodName;
  final double foodPrice;
  final List<Addon> addons;
  final List<Choice> choices;
  const BottomPopUP({
    Key? key,
    required this.foodId,
    required this.foodName,
    required this.foodPrice,
    required this.addons,
    required this.choices,
  }) : super(key: key);

  @override
  State<BottomPopUP> createState() => _BottomPopUPState();
}

class _BottomPopUPState extends State<BottomPopUP> {
  ScrollController scrollController = ScrollController();
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.95,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // food name
          Container(
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.foodName,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                GestureDetector(
                  child: Icon(
                    Icons.close,
                    color: Theme.of(context).primaryIconTheme.color,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
          // cards
          Expanded(
            flex: 3,
            child: Scrollbar(
              controller: scrollController,
              thumbVisibility: true,
              child: ListView.builder(
                controller: scrollController,
                itemCount: widget.choices.length,
                itemBuilder: (_, i) => Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  margin: const EdgeInsets.all(7.5),
                  height: 175,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.5),
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          widget.choices[i].choiceName,
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: 18,
                                  ),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: widget.choices[i].choiceOptions.length,
                          itemBuilder: (_, j) => ChoiceOptionRow(
                            choiceOptionID: widget
                                .choices[i].choiceOptions[j].choiceOptionID,
                            choiceOptionName: widget
                                .choices[i].choiceOptions[j].choiceOptionName,
                            choiceOptionPrice: widget
                                .choices[i].choiceOptions[j].choiceOptionPrice,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
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
                color: Theme.of(context).scaffoldBackgroundColor,
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
                      itemCount: widget.addons.length,
                      itemBuilder: (_, i) => AddonChip(
                        addonID: widget.addons[i].addonID,
                        addonName: widget.addons[i].addonName,
                        addonPrice: widget.addons[i].addonPrice,
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
                        /* myCart.add(
                          MyCart(
                            foodID: widget.foodId,
                            foodName: widget.foodName,
                            foodPrice: widget.foodPrice * quantity,
                            foodImgUrl: 'foodImgUrl',
                            quantity: quantity,
                            addons: [],
                            choices: [],
                          ),
                        ); */
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ChoiceOptionRow extends StatefulWidget {
  final String choiceOptionID;
  final String choiceOptionName;
  final double choiceOptionPrice;
  const ChoiceOptionRow({
    super.key,
    required this.choiceOptionID,
    required this.choiceOptionName,
    required this.choiceOptionPrice,
  });

  @override
  State<ChoiceOptionRow> createState() => _ChoiceOptionRowState();
}

late bool choiceAdded;

class _ChoiceOptionRowState extends State<ChoiceOptionRow> {
  @override
  void initState() {
    choiceAdded = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${widget.choiceOptionName} (\$${widget.choiceOptionPrice})',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        Checkbox(
          value: choiceAdded,
          onChanged: (value) {
            setState(() {
              choiceAdded = value!;
            });
          },
        ),
      ],
    );
  }
}

class AddonChip extends StatefulWidget {
  final String addonID;
  final String addonName;
  final double addonPrice;
  const AddonChip({
    super.key,
    required this.addonID,
    required this.addonName,
    required this.addonPrice,
  });

  @override
  State<AddonChip> createState() => _AddonChipState();
}

late bool addonAdded;

class _AddonChipState extends State<AddonChip> {
  @override
  void initState() {
    addonAdded = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          addonAdded = !addonAdded;
        });
      },
      child: Container(
        width: 50,
        margin: const EdgeInsets.only(
          left: 10,
        ),
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(),
          color: addonAdded ? Theme.of(context).primaryColor : null,
        ),
        alignment: Alignment.center,
        child: Text(
          widget.addonName,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );
  }
}
