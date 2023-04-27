import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wecare_app/components/kid_tile.dart';
import 'package:wecare_app/components/top_nav.dart';
import 'package:wecare_app/blocs/history_bloc/history_bloc.dart';
import 'package:wecare_app/blocs/history_bloc/history_event.dart';
import 'package:wecare_app/blocs/history_bloc/history_state.dart';
import 'package:wecare_app/views/details_page.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: screenWidth,
              height: screenHeight / 13,
              child: TopNav()
            ),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                "History of your donations",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24
                )
              ),
            ),
            Expanded(
              child: BlocBuilder<HistoryBloc, HistoryState>(builder: (context, state) {
              if (state is HistoryInitialState) {
              return Container(
                child: const Text(
                "History of your donations",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24
                )
                )
              );
            } else if (state is HistoryLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is HistoryFailState) {
              return Text(state.message);
            } else if (state is HistorySuccessState) {
              return ListView.builder(
              itemCount: state.KidL.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsPage(
                          kid: state.KidL[index])) ,
                    );
                  },
                child: KidTile(
                  name: state.KidL[index].name, 
                  image: state.KidL[index].imageUrl, 
                  age: state.KidL[index].age, 
                  description: state.KidL[index].description,
                )
                );
              }
            );
            }
            return Container();
          })
          )],
        ),
      ),
    );
  }
}