import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bottomNavIndexProvider = StateProvider((ref) => 0);

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    print("Whole Page Built!");
    return Scaffold(
        appBar: AppBar(
          title: const Text("Dartbucket"),
        ),
        body: Consumer(
          builder: (context, ref, child) {
            print('Index Stack Built!');
            final currentIndex = ref.watch(bottomNavIndexProvider);
            return IndexedStack(
              index: currentIndex,
              children: const [
                Center(
                  child: Icon(
                    Icons.home,
                    size: 100,
                  ),
                ),
                Center(
                  child: Icon(
                    Icons.settings,
                    size: 100,
                  ),
                ),
                Center(
                  child: Icon(
                    Icons.account_box,
                    size: 100,
                  ),
                )
              ],
            );
          },
        ),
        bottomNavigationBar: Consumer(
          builder: (context, ref, child) {
            print("Bottom Navigation Built!");
            final currentIndex = ref.watch(bottomNavIndexProvider);
            return NavigationBar(
              selectedIndex: currentIndex,
              destinations: const [
                NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
                NavigationDestination(
                    icon: Icon(Icons.settings), label: 'Settings'),
                NavigationDestination(
                    icon: Icon(Icons.account_box), label: 'Profile'),
              ],
              onDestinationSelected: (value) {
                ref
                    .read(bottomNavIndexProvider.notifier)
                    .update((state) => value);
              },
            );
          },
        ));
  }
}
