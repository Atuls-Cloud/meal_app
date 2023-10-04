import 'package:flutter/material.dart';
import '../dummy_data.dart';

//import 'dart:js';
//import 'package:youtube_data_api/models/video.dart';
//import 'package:youtube_data_api/models/video_data.dart';
//import '../utils/constants.dart';
//import 'package:youtube_data_api/youtube_data_api.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';
// import 'package:youtube_api/youtube_api.dart';

//New Imports
// import 'package:flutter_feather_icons/flutter_feather_icons.dart';
// import 'package:url_launcher/url_launcher.dart';

class MealDetailScreen extends StatelessWidget {
  final toggleFavorite;
  final Function isFavorite;
  const MealDetailScreen(this.toggleFavorite, this.isFavorite, {super.key});

  static const routeName = '/meal-detail';

  Widget buildSectionTitle(String text, BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child,
    );
  }
//Youtube Player........
  // YoutubePlayerController ytControl = YoutubePlayerController(
  //     initialVideoId: '',
  //     flags: const YoutubePlayerFlags(autoPlay: false, mute: false));

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere(
      (meal) => meal.id == mealId,
    );
//Youtube Player........
    // String query = selectedMeal.title;
    // List<dynamic> results = [];
    // //YoutubeDataApi youtubeDataApi = YoutubeDataApi();
    // YoutubeAPI yt = YoutubeAPI(Constants.apiKey, maxResults: 1, type: "video");
    // results = yt.search(query) as List;
//OR.............
    // List videoResult =
    //     youtubeDataApi.fetchSearchVideo(query, Constants.apiKey) as List;
    // videoResult.forEach((element) {
    //   if (element is Video) {
    //     Video video = element;
    //   }
    // } else if(element is Channel){
    //   Channel channel = element;
    // } else if(element is PlayList){
    //   PlayList playList = element;
    // }
    // });

    return Scaffold(
      appBar: AppBar(title: Text(selectedMeal.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle('Ingredients', context),
            buildContainer(
              ListView.builder(
                itemBuilder: ((context, index) {
                  return Card(
                    color: Theme.of(context).colorScheme.secondary,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(selectedMeal.ingredients[index]),
                    ),
                  );
                }),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSectionTitle('Steps', context),
            buildContainer(
              ListView.builder(
                itemBuilder: ((context, index) => Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text('# ${(index + 1)}'),
                          ),
                          title: Text(selectedMeal.steps[index]),
                        ),
                        const Divider(),
                      ],
                    )),
                itemCount: selectedMeal.steps.length,
              ),
            ),

//Youtube Player.....
            //buildSectionTitle('Recipie', context),
            // buildContainer(
            //   YoutubePlayer(
            //     controller: ytControl,
            //     showVideoProgressIndicator: true,
            //     progressIndicatorColor: Colors.red,
            //     // topActions: [
            //     //   const SizedBox(
            //     //     width: 8,
            //     //   ),
            //     //   Text(ytControl.metadata.title),
            //     // ],
            //   ),
            // ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => toggleFavorite(mealId),
        child: Icon(isFavorite(mealId) ? Icons.star : Icons.star_border),
      ),
    );
  }
}
