import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:regena/News_Components/breaking_news_card.dart';
import 'package:regena/News_Components/models.dart';
import 'package:regena/News_Components/news_list_tile.dart';




class NewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF008000),
        title: Text(
          'Actualites',
          style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
              onPressed: (){},
              icon: Icon(
                Icons.notifications_outlined,
                color: Colors.white,))
          ],
      ),

    body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
  Text(
    "Breaking News",
    style: TextStyle(
      fontSize: 26.0,
      fontWeight: FontWeight.bold,
    ),
  ),
  SizedBox(height: 20.0),

  //CAROUSEL
  CarouselSlider.builder(
    itemCount: NewsData.breakingNewsData.length,
    itemBuilder: (context, index, id) => BreakingNewsCard(NewsData.breakingNewsData[index]),
    options: CarouselOptions(
      aspectRatio: 16 / 9,
      enableInfiniteScroll:false,
      enlargeCenterPage:true,
      autoPlay: true,
      autoPlayInterval: const Duration(seconds: 3),
      autoPlayCurve: Curves.fastOutSlowIn,
    )
    ),
    SizedBox(height: 40.0,),
    Text(
      "News Recentes",
      style: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),
    ),
    SizedBox(height: 16.0,),

    //CARDS POUR LES NEWS RECENTES
    Column(
      children: NewsData.recentNewsData
      .map((e) => NewsListTile(e))
      .toList(),
    )
],
        ),
      ), 
      ),

    );
  }
}

