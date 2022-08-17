import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../shared/components/custom_app_bar_widget.dart';
import 'submodules/about/about_subpage.dart';
import 'submodules/list/attandence_list_subpage.dart';
import 'submodules/menu/menu_subpage.dart';

class EventsDetailPage extends StatefulWidget {
  const EventsDetailPage({Key? key}) : super(key: key);

  @override
  State<EventsDetailPage> createState() => _EventsDetailPageState();
}

class _EventsDetailPageState extends State<EventsDetailPage> {
  List<String> imagesUrl = [
    'https://media.gettyimages.com/photos/crowd-of-people-at-concert-waving-arms-in-the-air-picture-id130899584?s=612x612',
    'https://media.tacdn.com/media/attractions-splice-spp-674x446/07/2a/43/cc.jpg',
    'https://images.unsplash.com/photo-1492684223066-81342ee5ff30?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGFydHl8ZW58MHx8MHx8&w=1000&q=80'
  ];

  int currentImageindex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: _appBar(),
        body: TabBarView(children: [
          Center(child: Text('Page1')),
          MenuSubpage(),
          AttandenceListSubpage(),
          AboutSubpage()
        ]),
      ),
    );
  }

  PreferredSizeWidget _appBar() {
    return CustomAppBar(
      bottomRightRadius: 30,
      bottomLeftRadius: 30,
      height: 357,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 180,
                  width: double.maxFinite,
                  child: PageView.builder(
                      itemCount: imagesUrl.length,
                      pageSnapping: true,
                      onPageChanged: ((value) {
                        setState(() {
                          currentImageindex = value;
                        });
                      }),
                      itemBuilder: (context, pagePosition) {
                        return Container(
                            margin: EdgeInsets.all(0),
                            child: Image.network(imagesUrl[pagePosition],
                                fit: BoxFit.cover));
                      }),
                ),
                Positioned.fill(
                  bottom: 16,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                            List<Widget>.generate(imagesUrl.length, (index) {
                          return Container(
                            margin: const EdgeInsets.all(3),
                            width: currentImageindex == index ? 10 : 5,
                            height: currentImageindex == index ? 10 : 5,
                            decoration: const BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                          );
                        })),
                  ),
                ),
                Positioned(
                  top: 46,
                  left: 16,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back_ios_new_outlined),
                  ),
                ),
              ],
            ),
            // const SizedBox(height: 16),
            ListTile(
              minVerticalPadding: 15,
              leading: Container(
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  height: 46,
                  width: 46),
              title: Text('Festa lorem ipsum'),
              subtitle: Text('Rua exemplo - SP'),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: _buildCustomElevatedButton(
                        onPressed: () {}, child: Text('Ir para o local')),
                  ),
                  _buildCustomElevatedButton(
                      onPressed: () {}, child: Icon(Icons.credit_card)),
                  _buildCustomElevatedButton(
                      onPressed: () {}, child: Icon(Icons.wifi)),
                ],
              ),
            ),
            TabBar(
              labelPadding: EdgeInsets.symmetric(horizontal: 0),
              indicatorColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 5,
              // indicatorPadding: EdgeInsets.symmetric(horizontal: 16),
              labelColor: Theme.of(context).colorScheme.secondary,
              labelStyle: Theme.of(context).textTheme.headline3!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
              padding: EdgeInsets.symmetric(horizontal: 16),
              tabs: [
                Tab(text: 'Início'),
                Tab(text: 'Cardápio'),
                Tab(text: 'Lista'),
                Tab(text: 'Sobre'),
              ],
            )
          ]),
    );
  }

  Widget _buildCustomElevatedButton(
      {required void Function()? onPressed, required Widget child}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            primary: Theme.of(context).colorScheme.secondary,
            elevation: 0,
            textStyle: Theme.of(context).textTheme.button,
            fixedSize: const Size.fromHeight(37),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(90),
            ),
          ),
          child: child),
    );
  }
}
