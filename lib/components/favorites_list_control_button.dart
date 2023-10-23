import 'package:flutter/material.dart';
import 'package:namer_app/models/terms.dart';

class FavoritesListControlButton extends StatelessWidget {
  const FavoritesListControlButton({
    super.key,
    required this.termsModel,
  });

  final TermsModel termsModel;

  @override
  Widget build(BuildContext context) {
    if (termsModel.getSelectedForRemove().isEmpty) {
      return TextButton.icon(
        onPressed: () {
          termsModel.selectAllForRemove();
        },
        icon: Icon(Icons.select_all),
        label: Text('Select All'),
      );
    }

    return TextButton.icon(
      onPressed: () {
        termsModel.clearSelectedForRemove();
      },
      icon: Icon(Icons.clear),
      label: Text('Clear'),
    );
  }
}
