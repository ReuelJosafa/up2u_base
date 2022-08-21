import 'package:flutter/material.dart';

import '../../shared/components/custom_elevated_button_widget.dart';
import '../../shared/contants/constant_app_images.dart';
import '../home/home_page.dart';
import '../register/register_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _rememberMe = false;

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
            TextField(
              style: Theme.of(context).textTheme.headline3,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person),
                hintText: 'E-mail',
              ),
            ),
            const SizedBox(height: 22),
            TextField(
              style: Theme.of(context).textTheme.headline3,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.lock_outlined),
                suffixIcon: Icon(Icons.visibility_off_outlined),
                hintText: 'Senha',
              ),
            ),
            const SizedBox(height: 22),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Padding(
                padding: const EdgeInsets.only(right: 4),
                child: Row(children: [
                  Switch(
                      value: _rememberMe,
                      onChanged: (value) {
                        setState(() {
                          _rememberMe = !_rememberMe;
                        });
                      }),
                  Text('Lembre-me', style: Theme.of(context).textTheme.caption)
                ]),
              ),
              GestureDetector(
                onTap: () {},
                child: Text('Esqueceu a senha?',
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(decoration: TextDecoration.underline)),
              )
            ]),
            const SizedBox(height: 16),
            // teste(),
            const SizedBox(height: 16),
            CustomElevatedButton(
              title: 'Efetuar login',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
            ),
            const SizedBox(height: 20),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegisterPage()),
                  );
                },
                child: Text(
                  'Cadastrar',
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w500),
                )),
            const SizedBox(height: 20),
            _socialMidiasButton(
                icon: Icons.email_outlined,
                text: 'Efetuar login com o Gmail',
                onTap: () {}),
            _socialMidiasButton(
                icon: Icons.facebook_outlined,
                text: 'Efetuar login com o Facebook'),
            _socialMidiasButton(
                icon: Icons.whatsapp,
                text: 'Cadastre seu estabelecimento',
                color: Theme.of(context).primaryColor),
          ],
        ),
      ),
    );
  }

  Widget teste() {
    return Text.rich(
      // overflow: TextOverflow.ellipsis,
      maxLines: 2,
      textAlign: TextAlign.end,
      TextSpan(
        /* style: Theme.of(context)
                  .textTheme
                  .headline3!
                  .copyWith(fontWeight: FontWeight.w400, color: color), */
        children: [
          WidgetSpan(
              child: Switch(
                  value: _rememberMe,
                  onChanged: (value) {
                    setState(() {
                      _rememberMe = !_rememberMe;
                    });
                  })),
          TextSpan(
              text: 'Lembre-me', style: Theme.of(context).textTheme.caption),
          const WidgetSpan(child: SizedBox(width: 8, height: 8)),
          WidgetSpan(
              child: GestureDetector(
            onTap: () {},
            child: Text('Esqueceu a senha?',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(decoration: TextDecoration.underline)),
          ))
        ],
      ),
    );
  }

  Widget _socialMidiasButton(
      {required IconData icon,
      required String text,
      Color? color,
      void Function()? onTap}) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 22),
        child: GestureDetector(
          onTap: onTap,
          child: Text.rich(
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
            TextSpan(
              style: Theme.of(context)
                  .textTheme
                  .headline3!
                  .copyWith(fontWeight: FontWeight.w400, color: color),
              children: [
                WidgetSpan(child: Icon(icon)),
                const WidgetSpan(child: SizedBox(width: 8, height: 8)),
                TextSpan(
                    text: text,
                    style:
                        const TextStyle(decoration: TextDecoration.underline))
              ],
            ),
          ),
        ));
  }
}
