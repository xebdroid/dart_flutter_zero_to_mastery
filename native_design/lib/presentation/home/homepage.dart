import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:native_design/presentation/home/plattform_wrapper.dart';
import 'package:native_design/theme.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  double value = 0;

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
        backgroundColor: Colors.grey[200],
        appBar: PlatformAppBar(
          title: const Text('some other examples', style: toolbarTextStyle),
          cupertino: (_, __) => CupertinoNavigationBarData(
            transitionBetweenRoutes: false,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            PlatformSlider(
                value: value,
                onChanged: (v) {
                  setState(() {
                    value = v;
                  });
                }),
            PlatformIconButton(
              onPressed: () => print('pressed'),
              //icon: const Icon(Icons.info),
              materialIcon: const Icon(Icons.info),
              cupertinoIcon: const Icon(CupertinoIcons.info),
            ),
            Icon(PlatformIcons(context)
                .info), // Hier wird für die Platform das entsprechende icon gesetzt
            const SizedBox(
              height: 30,
            ),
            PlatformCircularProgressIndicator(),
            const SizedBox(
              height: 30,
            ),
            // Verschiedene widgets für die verschiedenen platformen
            PlatformWidget(
              cupertino: (_, __) =>
                  Container(height: 20, width: 40, color: Colors.redAccent),
              material: (_, __) =>
                  Container(height: 20, width: 40, color: Colors.blueAccent),
            ),
            const SizedBox(
              height: 30,
            ),
            // Eigener Wrapper für die verschiedenen platformen ohne package
            PlatWrapper(
              cupertino:
                  Container(height: 20, width: 40, color: Colors.redAccent),
              material:
                  Container(height: 20, width: 40, color: Colors.blueAccent),
            ),
            const SizedBox(
              height: 30,
            ),
            PlatformWidgetBuilder(
              material: (_, child, __) => InkWell(
                child: child,
                onTap: () {
                  print('tap android');
                },
              ),
              cupertino: (_, child, __) => GestureDetector(
                child: child,
                onTap: () {
                  print('tap ios');
                },
              ),
              child: Container(
                color: Colors.teal,
                height: 50,
                width: 100,
                child: const Center(child: Text('button')),
              ),
            )
          ]),
        ));
  }
}
