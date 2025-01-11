import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo(
      'Busca la comida',
      'Exercitation voluptate cillum eu aute dolor irure aliquip.',
      'assets/images/1.png'),
  SlideInfo(
      'Entrega rápida',
      'Ullamco ullamco duis labore quis occaecat culpa laborum id incididunt.',
      'assets/images/2.png'),
  SlideInfo(
      'Disfruta la comida',
      'Ea officia exercitation voluptate nostrud amet esse ut exercitation deserunt est enim est.',
      'assets/images/3.png'),
];

class AppTutorialScreen extends StatefulWidget {
  static const name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageViewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;

      if(!endReached && page >= slides.length - 1.5) {
        setState(() {
          endReached = true;
        });
      } else if (endReached && page < slides.length ) {
        setState(() {
          endReached = false;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: BouncingScrollPhysics(),
            children: slides
                .map((slideData) => _Slide(
                      title: slideData.title,
                      caption: slideData.caption,
                      imageUrl: slideData.imageUrl,
                    ))
                .toList(),
          ),
          Positioned(
            top: 50.0,
            right: 20.0,
            child: TextButton(
              child: const Text('Salir'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),

          endReached ? Positioned(
            bottom: 30.0,
            right: 30.0,
            child: FadeInRight(
              from: 15,
              delay: const Duration(milliseconds: 600),
              child: FilledButton(onPressed: () => context.pop(), child: const Text('Comenzar')))
          ): const SizedBox(),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide(
      {required this.title, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imageUrl),
            const SizedBox(height: 20.0),
            Text(title, style: textStyle.titleLarge),
            const SizedBox(height: 10.0),
            Text(caption, style: textStyle.bodySmall),
          ],
        ),
      ),
    );
  }
}
