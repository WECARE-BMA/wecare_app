import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wecare_app/blocs/nav_bloc/nav_bloc_bloc.dart';
import 'package:wecare_app/views/history_page.dart';
import 'package:wecare_app/views/home_page.dart';
import 'package:wecare_app/views/profile_page.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({super.key});

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  List _pages = [HistoryPage(), HomePage(), ProfilePage()];
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NavBloc, NavState>(
        builder: (context, state) {
          if (state is PageLoading) {
            return Center(
              child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor),
            );
          } else if (state is HomePageLoaded) {
            return HomePage();
          } else if (state is ProfilePageLoaded) {
            return ProfilePage();
          } else if (state is HistroyPageLoaded) {
            return HistoryPage();
          }

          return Container();
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          (index) => print(index);
          context.read<NavBloc>().add(ClickedPageButton(index: index));
        },
        selectedItemColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
