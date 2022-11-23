class Choice {
  final String choiceID;
  final String choiceName;
  final List<ChoiceOptions> choiceOptions;

  Choice({
    required this.choiceID,
    required this.choiceName,
    required this.choiceOptions,
  });
}

class ChoiceOptions {
  final String choiceOptionID;
  final String choiceOptionName;
  final double choiceOptionPrice;

  ChoiceOptions({
    required this.choiceOptionID,
    required this.choiceOptionName,
    required this.choiceOptionPrice,
  });
}
