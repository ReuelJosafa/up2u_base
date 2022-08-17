import 'package:flutter/material.dart';

class AttandenceListSubpage extends StatefulWidget {
  const AttandenceListSubpage({Key? key}) : super(key: key);

  @override
  State<AttandenceListSubpage> createState() => _AttandenceListSubpageState();
}

class _AttandenceListSubpageState extends State<AttandenceListSubpage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 8),
      itemCount: 30,
      itemBuilder: (context, index) {
        return _buildAttandanceListTile(
            name: 'lorem ipsum Exemplo',
            isPresent: index != 1,
            showData: index == 0,
            onTap: () {});
      },
    );
  }

  Widget _buildAttandanceListTile(
      {required String name,
      required bool isPresent,
      required bool showData,
      void Function()? onTap}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showData)
          Padding(
            padding: const EdgeInsets.only(left: 15, bottom: 16, top: 28),
            child: Text(
              '15/06',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(fontWeight: FontWeight.w300),
            ),
          ),
        ListTile(
          onTap: onTap,
          title: Text(
            name,
            style: Theme.of(context)
                .textTheme
                .headline3!
                .copyWith(fontWeight: FontWeight.w300),
          ),
          trailing: Container(
            alignment: Alignment.center,
            width: 90,
            height: 24,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              color:
                  isPresent ? const Color(0xFFFBBC05) : const Color(0xFFE83E3E),
            ),
            child: Text(
              isPresent ? 'Presente' : 'Ausente',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(fontWeight: FontWeight.w300, color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}
