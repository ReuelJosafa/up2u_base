import 'package:flutter/material.dart';

class CustomCardMenu extends StatelessWidget {
  final String image;
  final String title;
  final void Function() onNavigator;
  const CustomCardMenu(
      {Key? key,
      required this.image,
      required this.title,
      required this.onNavigator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onNavigator,
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          height: 110,
          width: 116,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(image, height: 46),
              Text(
                title,
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.headline3!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
