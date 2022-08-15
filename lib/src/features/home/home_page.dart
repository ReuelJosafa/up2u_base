import 'package:flutter/material.dart';
import 'package:up2u_base/src/features/profile/profile_page.dart';

import '../../shared/components/custom_app_bar_widget.dart';
import '../../shared/components/custom_outline_input_text_widget.dart';
import '../../shared/components/events_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: (value) {
          setState(() {
            print(value);
            selectedIndex = value;
          });
        },
        controller: controller,
        children: [
          _homePage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: _bottomNavBar(),
    );
  }

  Widget _homePage() {
    return Scaffold(
      appBar: _appBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 16),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(),
              EventsWidget(),
              EventsWidget(),
              EventsWidget(),
            ]),
      ),
    );
  }

  PreferredSizeWidget _appBar() {
    return CustomAppBar(
      bottomLeftRadius: 18,
      bottomRightRadius: 18,
      height: 226,
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: SafeArea(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 2),
                  //TODO: substituir por imagem do usuário
                  leading: const CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 24,
                  ),
                  title: Text(
                    'Bem-vindo, Fulado de Tal',
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  subtitle: Row(
                    children: [
                      // TODO: Substituir por ícone do Figma
                      const Icon(Icons.place),
                      Text(
                        'Teste',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //TODO: Adicionar ações de input
                      const Expanded(
                        child: CustomOutlineInputText(),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.filter_list_alt))
                    ],
                  ),
                ),
              ]),
        ),
      ),
    );
  }

  Widget _bottomNavBar() {
    final colorScheme = Theme.of(context).colorScheme;

    return BottomNavigationBar(
      showUnselectedLabels: false,
      selectedIconTheme: const IconThemeData(color: Colors.white),
      backgroundColor: colorScheme.surface,
      selectedItemColor: Colors.white,
      unselectedItemColor: Theme.of(context).primaryColor,
      currentIndex: selectedIndex,
      onTap: (value) => setState(() {
        controller.animateToPage(value,
            duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
        /* if (value == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProfilePage()),
          );
        } */
        selectedIndex = value;
      }),
      items: const [
        //TODO: Substituir por ícones do Figma
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Conta'),
      ],
    );
  }
}
