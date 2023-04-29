import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wecare_app/blocs/nav_bloc/nav_bloc_bloc.dart';
import 'package:wecare_app/views/history_page.dart';
import 'package:wecare_app/views/home_page.dart';
import 'package:wecare_app/views/profile_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({super.key});

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
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
          } else if (state is HistoryPageLoaded) {
            return HistoryPage();
          }

          return Container();
        },
      ),
      bottomNavigationBar: BlocBuilder<NavBloc, NavState>(
        builder: (context, state) {
          return ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0)),
            child: BottomNavigationBar(
              currentIndex: context.select((NavBloc bloc) => bloc.currentIndex),
              unselectedItemColor: Colors.grey,
              selectedItemColor: Theme.of(context).primaryColor,
              selectedLabelStyle: TextStyle(color: Colors.black),
              elevation: 0,
              backgroundColor: Colors.white,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(Icons.receipt_long_rounded),
                    label: AppLocalizations.of(context)!.historybn),
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_rounded),
                    label: AppLocalizations.of(context)!.home),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person_2),
                    label: AppLocalizations.of(context)!.profile),
              ],
              onTap: (index) =>
                  context.read<NavBloc>().add(ClickedPageButton(index: index)),
            ),
          );
        },
      ),
    );
  }
}
