import 'package:flutter/material.dart';
import 'package:news_app/models/prothomalo.dart';
import 'package:intl/intl.dart';
import 'package:news_app/services/api_manager.dart';

class Portal extends StatefulWidget {
  final apiUrl;
  const Portal({Key? key, this.apiUrl}) : super(key: key);

  @override
  _PortalState createState() => _PortalState();
}

class _PortalState extends State<Portal> {
  Future<Welcome>? _newsModel;

  @override
  void initState() {
    _newsModel = APIManager().getNews(widget.apiUrl);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<Welcome>(
          future: _newsModel,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.articles!.length,
                  itemBuilder: (context, index) {
                    var article = snapshot.data!.articles![index];
                    var formattedTime = DateFormat('dd MMM - HH:mm')
                        .format(article.publishedAt!);

                    return Container(
                      height: 100,
                      margin: const EdgeInsets.all(8),
                      child: Row(
                        children: <Widget>[
                          Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: AspectRatio(
                                aspectRatio: 1,
                                child: Image.network(
                                  article.urlToImage!,
                                  fit: BoxFit.cover,
                                )),
                          ),
                          const SizedBox(width: 16),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                //Text(formattedTime),
                                Text(
                                  article.title!,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  article.description!,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
