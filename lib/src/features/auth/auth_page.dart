import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../shared/components/custom_elevated_button_widget.dart';
import '../../shared/constants/constant_app_images.dart';
import '../../shared/utils/components_utils.dart';
import '../home/home_page.dart';
import '../register/register_page.dart';
import 'components/social_midia_button_widget.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final passwordFocus = FocusNode();
  bool _showPassword = true;
  bool _rememberMe = false;

  void _changeSwitchRemember(bool value) {
    setState(() {
      _rememberMe = !_rememberMe;
    });
  }

  void _changePasswordVisibily() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  void _forgetPassword() {}

  void _login() {
    bool isAnAdministrator = emailController.text == 'admin';
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => HomePage(
                isAnAdministrator: isAnAdministrator,
              )),
    );
  }

  void _loginWithGmail() {}

  void _loginWithFacebook() {}

  void _navigateToRegister() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RegisterPage()),
    );
  }

  void _registerEstabelishment() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 8),
            Image.asset(ConstantAppImages.logo, height: 218),
            Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController,
                      style: Theme.of(context).textTheme.headline3,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) =>
                          FocusScope.of(context).requestFocus(passwordFocus),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                                width: 1)),
                        prefixIcon: SvgPicture.asset(ConstantAppImages.person,
                            fit: BoxFit.none),
                        hintText: 'E-mail',
                      ),
                    ),
                    const SizedBox(height: 22),
                    TextFormField(
                      controller: passwordController,
                      style: Theme.of(context).textTheme.headline3,
                      obscureText: _showPassword,
                      keyboardType: TextInputType.visiblePassword,
                      focusNode: passwordFocus,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                                width: 1)),
                        prefixIcon: SvgPicture.asset(ConstantAppImages.lock,
                            fit: BoxFit.none),
                        suffixIcon: IconButton(
                            onPressed: _changePasswordVisibily,
                            icon: Icon(_showPassword
                                ? Icons.visibility_off_outlined
                                : Icons.visibility)),
                        hintText: 'Senha',
                      ),
                    ),
                  ],
                )),
            const SizedBox(height: 22),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              _buildSwitchTile(
                  value: _rememberMe, onChanged: _changeSwitchRemember),
              InkWell(
                onTap: _forgetPassword,
                child: Text('Esqueceu a senha?',
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(decoration: TextDecoration.underline)),
              )
            ]),
            const SizedBox(height: 16),
            CustomElevatedButton(
              title: 'Efetuar login',
              onPressed: _login,
            ),
            const SizedBox(height: 20),
            TextButton(
                onPressed: _navigateToRegister,
                child: Text(
                  'Cadastrar',
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w500),
                )),
            const SizedBox(height: 20),
            SocialMidiaButton(
                icon: SvgPicture.asset(ConstantAppImages.google),
                text: 'Efetuar login com o Gmail',
                onTap: _loginWithGmail),
            SocialMidiaButton(
                icon: SvgPicture.asset(ConstantAppImages.facebook),
                text: 'Efetuar login com o Facebook',
                onTap: _loginWithFacebook),
            SocialMidiaButton(
                icon:
                    Icon(Icons.whatsapp, color: Theme.of(context).primaryColor),
                text: 'Cadastre seu estabelecimento',
                color: Theme.of(context).primaryColor,
                textSameColor: true,
                onTap: _registerEstabelishment),
          ],
        ),
      ),
    );
  }

  Widget _buildSwitchTile(
      {required bool value, required void Function(bool)? onChanged}) {
    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: Row(children: [
        ComponentsUtils.buildSwitch(context,
            value: value, onChanged: onChanged),
        Text('Lembre-me', style: Theme.of(context).textTheme.caption)
      ]),
    );
  }
}
