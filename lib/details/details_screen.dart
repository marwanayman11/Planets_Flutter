import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:planets/details/web_view.dart';
import 'package:planets/models/planet.dart';

class DetailsScreen extends StatelessWidget {
  final Planet planet;

  const DetailsScreen(this.planet, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(planet.name),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: planet.imgSrc.img,
              placeholder: (context, url) => const Image(
                  image: AssetImage("assets/images/placeholder.jpg")),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(right: 8.0, left: 8.0,top: 8.0),
              child: Card(
                child: ListTile(
                  title: const Text(
                    "Planet order",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(planet.planetOrder.toString()),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(right: 8.0, left: 8.0,top: 8.0),
              child: Card(
                child: ListTile(
                  title: const Text(
                    "Planet name",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(planet.name),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(right: 8.0, left: 8.0,top: 8.0),
              child: Card(
                child: ListTile(
                  title: const Text(
                    "Planet description",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(planet.description),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(right: 8.0, left: 8.0,top: 8.0),
              child: Card(
                child: ListTile(
                  title: const Text(
                    "Planet mass",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(planet.basicDetails.mass),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(right: 8.0, left: 8.0,top: 8.0),
              child: Card(
                child: ListTile(
                  title: const Text(
                    "Planet volume",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(planet.basicDetails.volume),
                ),
              ),
            ),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                child: Card(
                  child: ListTile(
                    title: const Text(
                      "Planet Wikipedia link",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    WebViewScreen(planet.wikiLink)));
                      },
                      child: Text(planet.wikiLink,
                          style: const TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline)),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
