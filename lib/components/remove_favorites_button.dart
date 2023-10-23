import 'package:flutter/material.dart';
import 'package:namer_app/models/terms.dart';

class RemoveFavoritesButton extends StatelessWidget {
  const RemoveFavoritesButton({
    super.key,
    required this.termsModel,
  });

  final TermsModel termsModel;

  @override
  Widget build(BuildContext context) {
    final count = termsModel.getSelectedForRemove().length;
    var label = 'favorites';
    if (count == 1) {
      label = 'favorite';
    }

    return ElevatedButton.icon(
      icon: Icon(Icons.delete),
      onPressed: () {
        termsModel.removeSelected();
      },
      label: Text('Remove ${termsModel.getSelectedForRemove().length} $label'),
    );
  }
}
