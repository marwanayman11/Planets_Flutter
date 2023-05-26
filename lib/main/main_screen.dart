import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planets/details/details_screen.dart';
import 'package:planets/main/cubit/cubit.dart';
import 'package:planets/models/planet.dart';

import 'cubit/states.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(
        builder: (context, state) {
          var cubit = MainCubit.get(context);
          return Scaffold(
              appBar: AppBar(
                title: const Text("Planets"),
              ),
              body: cubit.planets.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.count(
                          physics: const BouncingScrollPhysics(),
                          crossAxisCount: 2,
                          childAspectRatio: 1 / 1.5,
                          children: List.generate(
                              cubit.planets.length,
                              (index) =>
                                  planetItem(cubit.planets[index], context))),
                    ));
        },
        listener: (context, state) {});
  }
}

Widget planetItem(Planet planet, BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => DetailsScreen(planet)));
    },
    child: Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        children: [
          Expanded(
            flex: 6,
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              width:double.infinity ,
              imageUrl: planet.imgSrc.img,
              placeholder: (context, url) =>
                  const Image(image: AssetImage("assets/images/placeholder.jpg"), fit: BoxFit.cover,
                    width:double.infinity ,),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:8.0),
            child: Text(
              planet.planetOrder.toString(),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              planet.name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    ),
  );
}
