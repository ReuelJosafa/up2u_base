import 'package:flutter/material.dart';
import 'package:up2u_base/src/features/use_terms/use_terms_page.dart';

import '../../shared/components/custom_checkbox_widget.dart';
import '../../shared/components/custom_elevated_button_widget.dart';
import '../../shared/contants/constant_app_images.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _checkbox = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Image.asset(ConstantAppImages.background, height: 352),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 32, top: 84, right: 32, bottom: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Cadastrar',
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(fontWeight: FontWeight.w500)),
                  const SizedBox(height: 32),
                  _inputTextField(title: 'Usuário', hintText: 'Fulano de Tal'),
                  _inputTextField(
                      title: 'E-mail', hintText: 'Fulano@gmail.com'),
                  _inputTextField(
                      title: 'Celular', hintText: '(xx) xxxxx-xxxx'),
                  _inputTextField(title: 'Senha', hintText: 'Fulano de Tal'),
                  _inputTextField(
                      title: 'Confirmar senha',
                      hintText: 'Fulano de Tal',
                      bottomPadding: 16),
                  _useTermsComponents(),
                  const SizedBox(height: 16),
                  CustomElevatedButton(title: 'Cadastrar', onPressed: () {}),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget retornaWidget() {
    return Container(
      height: 12,
      width: 12,
      color: Colors.red,
    );
  }

  Widget _inputTextField(
      {required String title,
      required String hintText,
      double bottomPadding = 22}) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.bodyText1),
          TextField(
            style: Theme.of(context).textTheme.headline3,
            decoration: InputDecoration(
              hintText: hintText,
            ),
          ),
        ],
      ),
    );
  }

  Widget _useTermsComponents() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomCheckbox(
          value: _checkbox,
          onChanged: (value) {},
        ),
        const SizedBox(width: 14),
        Text('Aceitar os',
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(fontWeight: FontWeight.w500)),
        TextButton(
          onPressed: () async {
            bool? returnBool = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const UseTermsPage()),
            );

            if (returnBool != null) {
              setState(() {
                _checkbox = returnBool;
              });
            }
          },
          child: Text('Termos de uso',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                  )),
        )
      ],
    );
  }
}
