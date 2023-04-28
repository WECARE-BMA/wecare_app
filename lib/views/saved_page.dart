import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wecare_app/components/kid_tile.dart';
import 'package:wecare_app/components/top_nav.dart';
import 'package:wecare_app/blocs/saved_bloc/saved_bloc.dart';
import 'package:wecare_app/blocs/saved_bloc/saved_event.dart';
import 'package:wecare_app/blocs/saved_bloc/saved_state.dart';
import 'package:wecare_app/views/details_page.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

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
            IconButton(onPressed: () {
            Navigator.popAndPushNamed(context, '/appScreen');
            }, icon: Icon(Icons.arrow_back, color: Colors.black,)),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                "Saved donations",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24
                )
              ),
            ),
            Expanded(
              child: BlocBuilder<SavedBloc, SavedState>(builder: (context, state) {
              if (state is SavedInitialState) {
                BlocProvider.of<SavedBloc>(context)
                            .add(GetKidsSaved());
            } else if (state is SavedLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is SavedFailState) {
              return Text(state.message);
            } else if (state is SavedSuccessState){
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
                  kid: state.KidL[index],
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