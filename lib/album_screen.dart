import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:rest_apis/Models/custom_album_model.dart';
import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AlbumScreen extends StatefulWidget {
  const AlbumScreen({super.key});

  @override
  State<AlbumScreen> createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  List<CustomAlbumModel> albums = [];
  Future<List<CustomAlbumModel>> getAlbumApi() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      albums.clear();
      for (Map i in data) {
        // print(i);
        albums.add(
            CustomAlbumModel(id: i['id'], title: i['title'], url: i['url']));
      }
      return albums;
    } else {
      return albums;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Albums'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getAlbumApi(),
                builder:
                    (context, AsyncSnapshot<List<CustomAlbumModel>> snapshot) {
                  return ListView.builder(
                      itemCount: albums.length,
                      itemBuilder: (context, index) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: LoadingAnimationWidget.threeArchedCircle(
                              color: const Color.fromARGB(255, 16, 16, 16),
                              size: 200,
                            ),
                          );
                        } else {
                          return Card(
                            child: ListTile(
                              // title:Text(albums[index].title)

                              title: Text(snapshot.data![index].id.toString()),
                              subtitle: Text(snapshot.data![index].title),
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    snapshot.data![index].url.toString()),
                              ),
                            ),
                          );
                        }
                      });
                }),
          )
        ],
      ),
    );
  }
}
