import 'package:flutter/material.dart';
import 'package:up2u_base/src/features/account/account_page.dart';
import 'package:up2u_base/src/features/promotions/promotions_page.dart';
import 'package:up2u_base/src/features/use_terms/use_terms_page.dart';
import 'package:up2u_base/src/features/users/users_page.dart';

import '../../shared/components/alert_dialog_action_button_widget.dart';
import '../../shared/components/custom_app_bar_widget.dart';
import '../../shared/constants/constant_app_images.dart';
import '../favorite/favorite_page.dart';
import 'components/custom_button_widget.dart';

class ProfilePage extends StatefulWidget {
  final bool isAnAdministrator;
  const ProfilePage({Key? key, required this.isAnAdministrator})
      : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int selectedIndex = 1;
  String userName = 'Lorem ipsum Silva';
  String email = 'loremipsum@gmail.com';

  void _logout() {}

  void _navigateTo(Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Center(child: Image.asset(ConstantAppImages.background, height: 352)),
          SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(height: 52),
              CustomButton(
                title: 'Conta',
                onTap: () => _navigateTo(AccountPage(
                  isAnAdministrator: widget.isAnAdministrator,
                )),
              ),
              if (widget.isAnAdministrator)
                CustomButton(
                  title: 'Promoções',
                  onTap: () => _navigateTo(const PromotionsPage()),
                ),
              if (widget.isAnAdministrator)
                CustomButton(
                  title: 'Usuários',
                  onTap: () => _navigateTo(const UsersPage()),
                ),
              if (!widget.isAnAdministrator)
                CustomButton(
                  title: 'Favoritos',
                  onTap: () => _navigateTo(const FavoritePage()),
                ),
              if (!widget.isAnAdministrator)
                CustomButton(
                  title: 'Sobre',
                  onTap: () {},
                ),
              CustomButton(
                title: 'Termos de Serviços',
                onTap: () =>
                    _navigateTo(const UseTermsPage(isOnlyVisualization: true)),
              ),
              CustomButton(
                title: 'Sair',
                rigthArrow: false,
                bottomDivider: false,
                titleUnderline: true,
                onTap: _showLogoutAlertDialog,
              ),
            ]),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    final textTheme = Theme.of(context).textTheme;

    return CustomAppBar(
      bottomRightRadius: 30,
      height: 145,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Material(
                borderRadius: BorderRadius.circular(40),
                elevation: 4,
                //TODO: Substituir por imagem do usuário e usar NetworkImage.
                child: const CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('images/profile_picture.jpeg')),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      userName,
                      maxLines: 2,
                      style: textTheme.headline3!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    Text(
                      email,
                      style: textTheme.bodyText1,
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showLogoutAlertDialog() {
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
              AlertDialogActionButton(
                  onPressed: () => Navigator.pop(context),
                  title: 'Voltar',
                  outlineBorder: true),
              const SizedBox(width: 8),
              AlertDialogActionButton(
                  onPressed: _logout, title: 'Sair', filled: true),
            ],
          );
        }));
  }
}
