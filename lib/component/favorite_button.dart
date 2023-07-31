import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({super.key});

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(isFavorite ? 'Remove Favorite' : 'Add to Favorite'),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
        if (isFavorite) {
          showDialog(
            context: context,
            builder: (context) {
              return FractionallySizedBox(
                widthFactor: 0.8,
                heightFactor: 0.4,// Adjust this value as needed for different sizes
                child: AlertDialog(
                  content: const Center(
                    child: Text(
                      'Success add to favorite',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        // Close the dialog when the "Close" button is pressed
                        Navigator.of(context).pop();
                      },
                      child: const Text('Close'),
                    ),
                  ],
                ),
              );
            },
          );
        } else {
          showDialog(
            context: context,
            builder: (context) {
              return FractionallySizedBox(
                widthFactor: 0.8,
                heightFactor: 0.4,// Adjust this value as needed for different sizes
                child: AlertDialog(
                  content: const Center(
                    child: Text(
                      'Success remove from favorite',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        // Close the dialog when the "Close" button is pressed
                        Navigator.of(context).pop();
                      },
                      child: const Text('Close'),
                    ),
                  ],
                ),
              );
            },
          );
        }
      },
    );
  }
}