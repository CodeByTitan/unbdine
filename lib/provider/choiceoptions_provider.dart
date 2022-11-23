import 'package:flutter/material.dart';
import '../classes/choices_class.dart';

class ChoiceOptionsProvider with ChangeNotifier {
  List<ChoiceOptions> _selectedChoicesList = [];
  List<ChoiceOptions> get selectedChoicesList {
    return [..._selectedChoicesList];
  }

  double get totalPrice {
    var total = 0.0;
    for (var element in _selectedChoicesList) {
      total += element.choiceOptionPrice;
    }
    return total;
  }

  addChoicesOptions(ChoiceOptions choiceOption) {
    _selectedChoicesList.add(
      ChoiceOptions(
        choiceOptionID: choiceOption.choiceOptionID,
        choiceOptionName: choiceOption.choiceOptionName,
        choiceOptionPrice: choiceOption.choiceOptionPrice,
      ),
    );
    notifyListeners();
  }

  Future<void> removeChoiceOption(String id) async {
    try {
      final existingCOid =
          _selectedChoicesList.indexWhere((list) => list.choiceOptionID == id);
      _selectedChoicesList.removeAt(existingCOid);
      notifyListeners();
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  void clearChoices() {
    _selectedChoicesList = [];
    notifyListeners();
  }
}
