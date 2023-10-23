import 'package:flutter/material.dart';
import 'package:namer_app/components/remove_favorites_button.dart';
import 'package:namer_app/components/favorites_list_control_button.dart';
import 'package:namer_app/models/terms.dart';
import 'package:provider/provider.dart';

class FavoritesPages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var termsModel = context.watch<TermsModel>();
    if (termsModel.getFavorites().isEmpty) {
      return Center(
        child: Text('No favorites yet'),
      );
    }

    return Column(
      children: [
        Container(
          color: Theme.of(context).colorScheme.secondaryContainer,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child:
                Text('You have ${termsModel.getFavorites().length} favorites'),
          ),
        ),
        Align(
          alignment: AlignmentDirectional.centerEnd,
          child: FavoritesListControlButton(termsModel: termsModel),
        ),
        Expanded(
          child: ListView(
            children: [
              for (var pair in termsModel.getFavorites())
                CheckboxListTile(
                  title: Text(pair.asLowerCase),
                  value: termsModel.getSelectedForRemove().contains(pair),
                  onChanged: (bool? value) {
                    if (value == true) {
                      termsModel.selectForRemove(pair);
                    } else {
                      termsModel.unselectForRemove(pair);
                    }
                  },
                )
            ],
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Visibility(
            visible: termsModel.getSelectedForRemove().isNotEmpty,
            child: RemoveFavoritesButton(
              termsModel: termsModel,
            ),
          ),
        ),
      ],
    );
  }
}
