import 'package:flutter/material.dart';
import 'package:up2u_base/src/features/profile/components/custom_button_widget.dart';

import '../../shared/components/custom_app_bar_widget.dart';
import '../../shared/components/custom_elevated_button_widget.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  bool isAnAdministrator = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 26),
                _customEditTextFormField(
                    title: 'Nome', hintText: 'Lorem ipsum Silva'),
                _customEditTextFormField(
                    title: 'E-mail', hintText: 'loremipsum@gmail.com'),
                _customEditTextFormField(
                    title: 'Telefone', hintText: '(00) 00000-0000'),
                _customEditTextFormField(
                    title: 'Senha', hintText: '***********'),
                if (isAnAdministrator)
                  _customEditTextFormField(
                      title: 'CNPJ', hintText: '07070897070'),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  child:
                      CustomElevatedButton(title: 'Salvar', onPressed: () {}),
                ),
              ],
            ),
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
    return CustomAppBar(
      bottomRightRadius: 30,
      height: 255,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 30),
        child: SafeArea(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    debugPrint('Alterar imagem');
                  },
                  child: Material(
                    borderRadius: BorderRadius.circular(62),
                    elevation: 4,
                    //TODO: Substituir por imagem do usuário
                    child: CircleAvatar(
                      radius: 62,
                      backgroundImage: AssetImage('images/profile_picture.jpeg')

                      /*  const NetworkImage(
                          'https://images.pexels.com/photos/1085517/pexels-photo-1085517.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1') */
                      ,
                      child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.black26,
                              borderRadius: BorderRadius.circular(62)),
                          //TODO: Trocar para ícone do Figma
                          child: const Icon(Icons.edit)),
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                Text(
                  'Lorem ipsum Silva',
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
              ]),
        ),
      ),
    );
  }

  Widget _customEditTextFormField({
    required String title,
    required String hintText,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(fontWeight: FontWeight.w500),
          ),
          TextFormField(
            style: Theme.of(context).textTheme.bodyText1,
            decoration: InputDecoration(
                hintText: hintText,
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.onSecondary,
                        width: 1)),
                suffixIcon: const Icon(Icons.edit_outlined)),
          ),
        ],
      ),
    );
  }
}