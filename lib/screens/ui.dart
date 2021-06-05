import 'package:flutter/material.dart';
import 'package:solar_ar/model/planet.dart';
import 'package:solar_ar/screens/planet_details.dart';

const _duration = Duration(milliseconds: 300);
const _initialPage = 5.0;

class UI extends StatefulWidget {
  @override
  _UIState createState() => _UIState();
}

class _UIState extends State<UI> {
  final _pagePlanetController = PageController(
    viewportFraction: 0.35,
    initialPage: _initialPage.toInt(),
  );
  final _pageTextController = PageController(initialPage: _initialPage.toInt());
  double _currentPage = _initialPage;
  double _textPage = _initialPage;

  void _coffeeScrollListener() {
    setState(() {
      _currentPage = _pagePlanetController.page;
    });
  }

  void _textScrollListener() {
    setState(() {
      _textPage = _currentPage;
    });
  }

  @override
  void initState() {
    _pagePlanetController.addListener(_coffeeScrollListener);
    _pageTextController.addListener(_textScrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _pagePlanetController.removeListener(_coffeeScrollListener);
    _pageTextController.removeListener(_textScrollListener);
    _pageTextController.dispose();
    _pagePlanetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Positioned(
            left: 20,
            right: 20,
            bottom: -size.height * 0.2,
            height: size.height * 0.3,
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      color: Color(0xFFF7B708),
                      blurRadius: 90,
                      offset: Offset.zero,
                      spreadRadius: 45)
                ],
              ),
            ),
          ),
          Transform.scale(
            scale: 1.6,
            alignment: Alignment.bottomCenter,
            child: PageView.builder(
              controller: _pagePlanetController,
              onPageChanged: (value) {
                if (value < planets.length) {
                  _pageTextController.animateToPage(value,
                      duration: _duration, curve: Curves.easeOut);
                }
              },
              scrollDirection: Axis.vertical,
              itemCount: planets.length,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return const SizedBox.shrink();
                }
                final planet = planets[index - 1];
                final result = _currentPage - index + 1;
                final value = -0.4 * result + 1;
                final opacity = value.clamp(0.0, 1.0);
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 650),
                        pageBuilder: (context, animation, _) {
                          return FadeTransition(
                            opacity: animation,
                            child: PlanetDetails(
                              planet: planet,
                            ),
                          );
                        },
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Transform(
                      alignment: Alignment.bottomCenter,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..translate(
                          0.0,
                          MediaQuery.of(context).size.height /
                              2.6 *
                              (1 - value).abs(),
                        )
                        ..scale(value),
                      child: Opacity(
                        opacity: opacity,
                        child: Hero(
                          tag: planet.name,
                          child: Image.asset(
                            planet.image,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 100,
            child: TweenAnimationBuilder<double>(
              tween: Tween(begin: 1.0, end: 0.0),
              builder: (context, value, child) {
                return Transform.translate(
                  offset: Offset(0.0, -100 * value),
                  child: child,
                );
              },
              duration: _duration,
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      itemCount: planets.length,
                      controller: _pageTextController,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final opacity =
                            (1 - (index - _textPage).abs()).clamp(0.0, 1.0);
                        return Opacity(
                          opacity: opacity,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.2),
                            child: Hero(
                              tag: 'text_${planets[index].name}',
                              child: Material(
                                child: Text(
                                  planets[index].name,
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  AnimatedSwitcher(
                    duration: _duration,
                    child: planets[_currentPage.toInt()].name == 'SUN'
                        ? Text('')
                        : Text(
                            '${planets[_currentPage.toInt()].distFromSun} Km From The 🌞',
                            style: TextStyle(fontSize: 20),
                            key: Key(planets[_currentPage.toInt()].name),
                          ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
