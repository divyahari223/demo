import 'package:flutter/material.dart';
import 'package:pattom_cafe/register.dart';
import 'package:pattom_cafe/signup.dart';
class onboarding extends StatefulWidget {
  const onboarding({super.key});

  @override
  State<onboarding> createState() => _onboardingState();
}

class _onboardingState extends State<onboarding> {
 final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: [
              OnboardingPage(
                image: 'assets/fruits.jpg',
                title: 'Welcome',
                description: 'Explore the world of fruits!',
              ),
              OnboardingPage(
                image: 'assets/vegetable.png',
                title: 'Discover',
                description: 'Dive into the goodness of veggies!',
              ),
              OnboardingPage(
                image: 'assets/delivery.png',
                title: 'Get Started',
                description: 'With door to door delivery!.',

              ),
            ],
          ),
          Positioned(
            bottom: 20.0,
            left: 20.0,
            right: 20.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _currentPage != 2
                    ? TextButton(
                        onPressed: () {
                          _pageController.jumpToPage(2);
                        },
                        child: Text('SKIP',style: TextStyle(color: Colors.black)),
                      )
                    : SizedBox.shrink(),
                Row(
                  children: List.generate(3, (index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 4.0),
                      width: _currentPage == index ? 12.0 : 8.0,
                      height: _currentPage == index ? 12.0 : 8.0,
                      decoration: BoxDecoration(
                        color: _currentPage == index ? Colors.blue : Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    );
                  }),
                ),
                _currentPage == 2
                    ? TextButton(
                        onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>signup()));
                        },
                        child: Text('START',style: TextStyle(color: Colors.black)),
                      )
                    : TextButton(
                        onPressed: () {
                          _pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
                        },
                        child: Text('NEXT',style: TextStyle(color: Colors.black),),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  OnboardingPage({
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image, height: 300),
        SizedBox(height: 30.0),
        Text(
          title,
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16.0),
        Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
      ],
    );
  }
}

