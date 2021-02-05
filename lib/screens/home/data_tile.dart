import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:imd/models/imd.dart';
import 'package:imd/screens/Edit/editHome.dart';

class DataTile extends StatelessWidget {
  final Imd data;
  DataTile({this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => EditHome()));
        },
        child: Card(
            margin: EdgeInsets.fromLTRB(20.0, 0, 20.0, 5),
            child: Column(
              children: [
                Container(
                    height: 40,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    child: Text.rich(TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: data.uemail
                              .substring(0, data.uemail.indexOf("@")),
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.black54)),
                      TextSpan(
                          text: '',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ])),
                    color: Colors.grey[50]),
                CachedNetworkImage(
                  imageUrl: data.url,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(
                          value: downloadProgress.progress),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                /*Image.network(data.url, width: double.infinity),*/
                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Text(data.activity),
                  ),
                  subtitle: Text(
                      "Equipment: ${data.equipment}\nArea: ${data.area} \nGroup: ${data.group}"),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: data.optional != ''
                        ? Padding(
                            padding: const EdgeInsets.fromLTRB(16.0, 4, 12, 5),
                            child: Text('Description: ${data.optional}',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.6))),
                          )
                        : null,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
