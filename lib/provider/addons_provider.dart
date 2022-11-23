import 'package:flutter/material.dart';

import '../classes/addon_class.dart';

class AddonProvider with ChangeNotifier {
  List<Addon> _selectedAddonsList = [];
  List<Addon> get selectedAddonsList {
    return [..._selectedAddonsList];
  }

  double get totalPrice {
    var total = 0.0;
    for (var element in _selectedAddonsList) {
      total += element.addonPrice;
    }
    return total;
  }

  Future<void> addAddon(Addon addon) async {
    final selectedAddon = Addon(
      addonID: addon.addonID,
      addonName: addon.addonName,
      addonPrice: addon.addonPrice,
    );
    _selectedAddonsList.add(selectedAddon);
    notifyListeners();
  }

  Future<void> removeAddon(String id) async {
    try {
      final existingAddonId =
          _selectedAddonsList.indexWhere((list) => list.addonID == id);
      _selectedAddonsList.removeAt(existingAddonId);
      notifyListeners();
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  void clearAddon() {
    _selectedAddonsList = [];
    notifyListeners();
  }
}
