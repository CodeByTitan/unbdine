class Choice {
  final String choiceID;
  final String choiceName;
  final List<ChoiceOption> choiceOptions;

  Choice({
    required this.choiceID,
    required this.choiceName,
    required this.choiceOptions,
  });
}

class ChoiceOption {
  final String choiceOptionID;
  final String choiceOptionName;
  final double choiceOptionPrice;
  ChoiceOption({
    required this.choiceOptionID,
    required this.choiceOptionName,
    required this.choiceOptionPrice,
  });
}
