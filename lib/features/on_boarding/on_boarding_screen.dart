import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ViewModel for onboarding state management
class OnBoardingViewModel extends ChangeNotifier {
  final PageController pageController = PageController();
  int _currentPage = 0;

  int get currentPage => _currentPage;

  void setCurrentPage(int page) {
    _currentPage = page;
    notifyListeners();
  }

  void animateToPage(int page) {
    pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}

// Onboarding Screen Widget
class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<OnBoardingViewModel>(
      create: (_) => OnBoardingViewModel(),
      child: Consumer<OnBoardingViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Onboarding'),
            ),
            body: PageView(
              controller: viewModel.pageController,
              onPageChanged: viewModel.setCurrentPage,
              children: const [
                _OnBoardingPage(
                  title: 'Welcome',
                  description: 'Welcome to our app! Let\'s get started.',
                ),
                _OnBoardingPage(
                  title: 'Features',
                  description: 'Discover amazing features to boost your productivity.',
                ),
                _OnBoardingPage(
                  title: 'Get Started',
                  description: 'Sign up or log in to continue.',
                ),
              ],
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: viewModel.currentPage > 0
                        ? () => viewModel.animateToPage(viewModel.currentPage - 1)
                        : null,
                    child: const Text('Back'),
                  ),
                  Row(
                    children: List.generate(3, (index) => _buildDot(index, viewModel.currentPage)),
                  ),
                  TextButton(
                    onPressed: viewModel.currentPage < 2
                        ? () => viewModel.animateToPage(viewModel.currentPage + 1)
                        : null,
                    child: const Text('Next'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDot(int index, int currentPage) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: index == currentPage ? Colors.blue : Colors.grey,
      ),
    );
  }
}

class _OnBoardingPage extends StatelessWidget {
  final String title;
  final String description;

  const _OnBoardingPage({
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Text(
              description,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
} 