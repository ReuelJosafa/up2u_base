import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../shared/components/custom_app_bar_widget.dart';
import '../../shared/components/custom_elevated_button_widget.dart';
import '../../shared/components/commom_text_form_field_widget.dart';
import '../../shared/constants/app_images.dart';
import '../../shared/utils/components_utils.dart';

class AccountPage extends StatefulWidget {
  final bool isAnAdministrator;
  const AccountPage({Key? key, required this.isAnAdministrator})
      : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  String name = 'Lorem ipsum Silva';

  void _onChangeImage() {
    debugPrint('Alterar imagem');
  }

  void _saveChanges() {
    debugPrint('Alterar imagem');
  }

  final phoneMaskFormatter = MaskTextInputFormatter(
      mask: '(##) #####-####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 26),
                  const CommmomTextFormField(
                      title: 'Nome',
                      hintText: 'Lorem ipsum Silva',
                      suffixIcon: Icon(Icons.edit_outlined)),
                  const CommmomTextFormField(
                    title: 'E-mail',
                    hintText: 'loremipsum@gmail.com',
                    keyboardType: TextInputType.emailAddress,
                    suffixIcon: Icon(Icons.edit_outlined),
                  ),
                  CommmomTextFormField(
                      onChanged: (p0) {
                        debugPrint(phoneMaskFormatter.getUnmaskedText());
                      },
                      title: 'Telefone',
                      hintText: '(00) 00000-0000',
                      inputFormatters: [phoneMaskFormatter],
                      keyboardType: TextInputType.phone,
                      suffixIcon: const Icon(Icons.edit_outlined)),
                  const CommmomTextFormField(
                      title: 'Senha',
                      hintText: '***********',
                      suffixIcon: Icon(Icons.edit_outlined)),
                  if (widget.isAnAdministrator)
                    const CommmomTextFormField(
                        readOnly: true, title: 'CNPJ', hintText: '07070897070'),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    child: CustomElevatedButton(
                        title: 'Salvar', onPressed: _saveChanges),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        // bottomRightRadius: 30,
        height: 255,
        child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 30),
            child: SafeArea(
                child: Stack(fit: StackFit.expand, children: [
              Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: _onChangeImage,
                      child: Material(
                          borderRadius: BorderRadius.circular(62),
                          elevation: 4,
                          color: Colors.transparent,
                          borderOnForeground: false,
                          //TODO: Substituir por imagem do usuário e usar NewtworkImage.
                          child: CircleAvatar(
                              radius: 62,
                              backgroundColor: Colors.white,
                              backgroundImage: const AssetImage(
                                  'images/profile_picture.jpeg'),
                              child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.4),
                                    borderRadius: BorderRadius.circular(62)),
                                child: SvgPicture.asset(
                                    AppImages.editPhoto,
                                    fit: BoxFit.scaleDown),
                              ))),
                    ),
                    const SizedBox(height: 18),
                    Text(name,
                        style: Theme.of(context)
                            .textTheme
                            .headline2!
                            .copyWith(fontWeight: FontWeight.w500))
                  ]),
              Positioned(
                top: 16,
                child: ComponentsUtils.buildArrowBack(context),
              ),
            ]))));
  }
}
