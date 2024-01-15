import 'package:flutter/material.dart';
import 'package:flutter_grundlagen/application/theme_service.dart';
import 'package:flutter_grundlagen/presentation/widgets/buttons_example.dart';
import 'package:flutter_grundlagen/presentation/widgets/container_text_example.dart';
import 'package:flutter_grundlagen/presentation/widgets/media_query_example.dart';
import 'package:flutter_grundlagen/presentation/widgets/page_view_example.dart';
import 'package:flutter_grundlagen/presentation/widgets/profile_picture.dart';
import 'package:flutter_grundlagen/presentation/widgets/rectangular_image.dart';
import 'package:flutter_grundlagen/presentation/widgets/row_expanded_example.dart';
import 'package:provider/provider.dart';

class WidgetsExamplesPage extends StatelessWidget {
  const WidgetsExamplesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text('Widgets examples'),
        leading: const Icon(Icons.home, size: 30),
        centerTitle: true,
        backgroundColor: Colors.blue[200],
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const ContainerTextExample(),
              const SizedBox(height: 10),
              const RowExpandedExample(),
              const SizedBox(height: 30),
              const ProfilePicture(),
              const SizedBox(height: 30),
              const RectImage(),
              const SizedBox(height: 30),
              const MediaQueryExample(),
              const SizedBox(height: 30),
              const PageViewExample(),
              const SizedBox(height: 30),
              const ButtonsExample(),
              const SizedBox(height: 30),
              Switch(
                  value: Provider.of<ThemeService>(context, listen: false).isDarkModeOn,
                  onChanged: (value) {
                    Provider.of<ThemeService>(context, listen: false).toggleTheme();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
