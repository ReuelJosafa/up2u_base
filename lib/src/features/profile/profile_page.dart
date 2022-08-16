import 'package:flutter/material.dart';
import 'package:up2u_base/src/features/account/account_page.dart';
import 'package:up2u_base/src/features/promotions/promotions_page.dart';
import 'package:up2u_base/src/features/use_terms/use_terms_page.dart';
import 'package:up2u_base/src/features/users/users_page.dart';

import '../../shared/components/custom_app_bar_widget.dart';
import '../../shared/contants/constant_app_images.dart';
import '../favorite/favorite_page.dart';
import 'components/custom_button_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int selectedIndex = 1;
  bool isAnAdministrator = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Stack(
        children: [
          Center(child: Image.asset(ConstantAppImages.background, height: 352)),
          SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(height: 52),
              CustomButton(
                title: 'Conta',
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AccountPage())),
              ),
              if (isAnAdministrator)
                CustomButton(
                  title: 'Promoções',
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PromotionsPage())),
                ),
              if (isAnAdministrator)
                CustomButton(
                  title: 'Usuários',
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UsersPage())),
                ),
              if (!isAnAdministrator)
                CustomButton(
                  title: 'Favoritos',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FavoritePage()));
                  },
                ),
              if (!isAnAdministrator)
                CustomButton(
                  title: 'Sobre',
                  onTap: () {},
                ),
              CustomButton(
                title: 'Termos de Serviços',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const UseTermsPage(isOnlyVisualization: true)));
                },
              ),
              CustomButton(
                title: 'Sair',
                rigthArrow: false,
                bottomDivider: false,
                titleUnderline: true,
                onTap: _logoutAlertDialog,
              ),
            ]),
          ),

          //TODO: Remover Switch, pois sua finalidade é alternar entre usuário e administrador

          Switch(
              value: isAnAdministrator,
              onChanged: ((value) => setState(() {
                    isAnAdministrator = value;
                  }))),
        ],
      ),
    );
  }

  PreferredSizeWidget _appBar() {
    final textTheme = Theme.of(context).textTheme;

    return CustomAppBar(
      bottomRightRadius: 30,
      height: 145,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 30),
        child: SafeArea(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 9),
                Row(
                  children: [
                    Material(
                      borderRadius: BorderRadius.circular(50),
                      elevation: 4,
                      //TODO: Substituir por imagem do usuário
                      child: const CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              AssetImage('images/profile_picture.jpeg')

                          /* NetworkImage(
                              'https://images.pexels.com/photos/1085517/pexels-photo-1085517.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1') */
                          ),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Lorem ipsum Silva',
                          style: textTheme.headline4,
                        ),
                        Text(
                          'loremipsum@gmail.com',
                          style: textTheme.subtitle2,
                        ),
                      ],
                    ),
                  ],
                ),
              ]),
        ),
      ),
    );
  }

  void _logoutAlertDialog() {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            backgroundColor: colorScheme.onBackground,
            title: Text(
              'Tem certeza que deseja sair da conta?',
              style: textTheme.headline4!.copyWith(
                  color: colorScheme.surface, fontWeight: FontWeight.w600),
            ),
            actionsOverflowAlignment: OverflowBarAlignment.center,
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              _actionButton(
                  onPressed: () => Navigator.pop(context),
                  title: 'Voltar',
                  outlineBorder: true),
              const SizedBox(width: 8),
              _actionButton(onPressed: () {}, title: 'Sair', filled: true),
            ],
          );
        }));
  }

  Widget _actionButton(
      {required void Function()? onPressed,
      required String title,
      bool filled = false,
      bool outlineBorder = false}) {
    final textTheme = Theme.of(context).textTheme;

    return OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
            fixedSize: const Size(118, 37),
            backgroundColor: filled
                ? Theme.of(context).buttonTheme.colorScheme!.background
                : null,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            side: outlineBorder
                ? BorderSide(
                    color: Theme.of(context).buttonTheme.colorScheme!.outline,
                    width: 1)
                : null),
        child: Text(title,
            style: textTheme.headline4!.copyWith(
                color: filled
                    ? Theme.of(context).colorScheme.onPrimary
                    : Theme.of(context).buttonTheme.colorScheme!.outline,
                fontWeight: FontWeight.w300)));
  }
}
