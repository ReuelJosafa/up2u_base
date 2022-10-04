import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:up2u_base/src/features/use_terms/use_terms_page.dart';

import '../../shared/components/commom_text_form_field_widget.dart';
import '../../shared/components/custom_elevated_button_widget.dart';
import '../../shared/constants/app_images.dart';
import 'components/use_terms_checkbox_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController userController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final emailFocus = FocusNode();
  final phoneFocus = FocusNode();
  final passwordFocus = FocusNode();
  final passwordConfirmationFocus = FocusNode();

  bool _areTermsAccept = false;

  Future<void> _navigateToUseTerms() async {
    bool? wasAccepted = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const UseTermsPage()),
    );

    if (wasAccepted != null) {
      setState(() {
        _areTermsAccept = wasAccepted;
      });
    }
  }

  final phoneMaskFormatter = MaskTextInputFormatter(
      mask: '(##) #####-####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  @override
  void dispose() {
    super.dispose();
    userController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    emailFocus.dispose();
    phoneFocus.dispose();
    passwordFocus.dispose();
    passwordConfirmationFocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Image.asset(AppImages.background, height: 352),
          Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Cadastrar',
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(fontWeight: FontWeight.w500)),
                    const SizedBox(height: 32),
                    CommmomTextFormField(
                      controller: userController,
                      title: 'Nome completo',
                      titleStyle: Theme.of(context).textTheme.bodyText1,
                      hintText: 'Fulano de Tal',
                      inputStyle: Theme.of(context).textTheme.headline3,
                      topPadding: 0,
                      bottomPadding: 22,
                      onFieldSubmitted: (_) =>
                          FocusScope.of(context).requestFocus(emailFocus),
                    ),
                    CommmomTextFormField(
                        controller: emailController,
                        title: 'E-mail',
                        titleStyle: Theme.of(context).textTheme.bodyText1,
                        hintText: 'Fulano@gmail.com',
                        focusNode: emailFocus,
                        inputStyle: Theme.of(context).textTheme.headline3,
                        topPadding: 0,
                        bottomPadding: 22,
                        onFieldSubmitted: (_) =>
                            FocusScope.of(context).requestFocus(phoneFocus),
                        keyboardType: TextInputType.emailAddress),
                    CommmomTextFormField(
                        inputFormatters: [phoneMaskFormatter],
                        controller: phoneNumberController,
                        title: 'Celular',
                        titleStyle: Theme.of(context).textTheme.bodyText1,
                        hintText: '(xx) xxxxx-xxxx',
                        focusNode: phoneFocus,
                        inputStyle: Theme.of(context).textTheme.headline3,
                        topPadding: 0,
                        bottomPadding: 22,
                        onFieldSubmitted: (_) =>
                            FocusScope.of(context).requestFocus(passwordFocus),
                        keyboardType: TextInputType.phone),
                    CommmomTextFormField(
                        controller: passwordController,
                        title: 'Senha',
                        titleStyle: Theme.of(context).textTheme.bodyText1,
                        hintText: 'Fulano de Tal',
                        focusNode: passwordFocus,
                        inputStyle: Theme.of(context).textTheme.headline3,
                        topPadding: 0,
                        bottomPadding: 22,
                        onFieldSubmitted: (_) => FocusScope.of(context)
                            .requestFocus(passwordConfirmationFocus),
                        keyboardType: TextInputType.visiblePassword),
                    CommmomTextFormField(
                      controller: confirmPasswordController,
                      title: 'Confirmar senha',
                      titleStyle: Theme.of(context).textTheme.bodyText1,
                      hintText: 'Fulano de Tal',
                      bottomPadding: 16,
                      focusNode: passwordConfirmationFocus,
                      inputStyle: Theme.of(context).textTheme.headline3,
                      topPadding: 0,
                      onFieldSubmitted: (_) {
                        //TODO: submeter fomulário.
                      },
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                    ),
                    UseTermsCheckbox(
                        onPressed: _navigateToUseTerms,
                        checkboxValue: _areTermsAccept),
                    const SizedBox(height: 16),
                    CustomElevatedButton(
                        title: 'Cadastrar',
                        onPressed: _areTermsAccept ? () {} : null),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
