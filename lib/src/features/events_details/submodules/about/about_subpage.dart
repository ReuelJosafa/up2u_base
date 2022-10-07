import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:up2u_base/src/shared/constants/app_images.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../shared/components/alert_dialog_action_button_widget.dart';
import '../../../../shared/components/text_underlined_button_widget.dart';

class AboutSubpage extends StatefulWidget {
  final bool isAnAdministrator;
  const AboutSubpage({Key? key, required this.isAnAdministrator})
      : super(key: key);

  @override
  State<AboutSubpage> createState() => _AboutSubpageState();
}

class _AboutSubpageState extends State<AboutSubpage> {
  final contacts = [
    '+55 (00) 00000-0000',
    '(00) 00000-0000',
  ];
  final text = 'Lorem ipsum dolor sit amet consectetur adipiscing elit erat,'
      'finibus ridiculus augue accumsan parturient mauris nulla, cursus purus mi quam proin interdum eros';

  void _onTap() {}

  Future<void> _lauchWhatsapp(String phone) async {
    final wppUri = Uri.parse("whatsapp://send?phone=$phone&text=oi");

    if (await canLaunchUrl(wppUri)) {
      await launchUrl(wppUri);
    } else {
      throw 'Não foi possível concluir a operação';
    }
  }

  Future<void> _lauchIstagram() async {
    final instagramUri = Uri.parse('instagram://user?username=teslamotors');

    if (!await launchUrl(instagramUri)) {
      throw 'Não foi possível concluir a operação';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            textAlign: TextAlign.justify,
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(fontWeight: FontWeight.w300),
          ),
          const SizedBox(height: 24),
          Text('Contatos:', style: Theme.of(context).textTheme.headline4),
          const SizedBox(height: 8),
          for (var contact in contacts)
            contactsTile(
                title: contact,
                onTap: () async => _showSocialMediaAlertDialog(
                    socialMedia: 'Whatsapp',
                    onAcept: () async => _lauchWhatsapp(contact)),
                icon: const Icon(Icons.whatsapp, size: 24)),
          contactsTile(
            title: 'Nossa página no Instagram',
            onTap: () async => _showSocialMediaAlertDialog(
                socialMedia: 'Instragram',
                onAcept: () async => _lauchIstagram()),
            icon: SvgPicture.asset(AppImages.instagram, color: Colors.white),
          ),
          if (widget.isAnAdministrator)
            Align(
                alignment: Alignment.centerRight,
                child: TextUnderlinedButton(
                  onTap: _onTap,
                  title: 'Editar sobre',
                )),
        ],
      ),
    );
  }

  Widget contactsTile(
      {required String title, void Function()? onTap, required Widget icon}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: GestureDetector(
        onTap: onTap,
        child: Text.rich(
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          textAlign: TextAlign.start,
          TextSpan(
            style: Theme.of(context).textTheme.headline4,
            children: [
              WidgetSpan(child: icon),
              const WidgetSpan(child: SizedBox(width: 8, height: 8)),
              TextSpan(text: title)
            ],
          ),
        ),
      ),
    );
  }

  Future<T> _showSocialMediaAlertDialog<T>(
      {required String socialMedia, required void Function() onAcept}) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return showDialog(
        context: context,
        builder: ((context) {
          bool waiting = false;
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              backgroundColor: colorScheme.onBackground,
              title: Text(
                'Deseja abrir o $socialMedia?',
                style: textTheme.headline4!.copyWith(
                    color: colorScheme.surface, fontWeight: FontWeight.w600),
              ),
              content: Text(
                  'Ao confirmar esta ação você será direcionado(a) para o nosso $socialMedia.'),
              actionsOverflowAlignment: OverflowBarAlignment.center,
              actionsAlignment: MainAxisAlignment.center,
              actions: [
                AlertDialogActionButton(
                  onPressed: () => Navigator.pop(context, false),
                  title: 'Cancelar',
                  outlineBorder: true,
                ),
                AlertDialogActionButton(
                    onPressed: waiting
                        ? null
                        : () {
                            setState(
                              () {
                                waiting = true;
                              },
                            );

                            onAcept();

                            Future.delayed(const Duration(seconds: 5))
                                .then((_) => Navigator.pop(context));
                          },
                    title: 'Confirmar',
                    filled: true,
                    child: waiting
                        ? const SizedBox(
                            height: 26,
                            width: 26,
                            child: CircularProgressIndicator(
                                color: Colors.white, strokeWidth: 3))
                        : null),
              ],
            );
          });
        })).then((value) => value);
  }
}
