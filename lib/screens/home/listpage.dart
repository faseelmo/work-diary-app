import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:imd/models/imd.dart';
import 'package:imd/screens/home/data_tile.dart';

class DataList extends StatefulWidget {
  @override
  _DataListState createState() => _DataListState();
}

class _DataListState extends State<DataList> {
  @override
  Widget build(BuildContext context) {
    final imd = Provider.of<List<Imd>>(context);
    //print(imd.documents);

    return Scaffold(
      body: Center(
        child: imd == null
            ? Container()
            : ListView.builder(
                cacheExtent: 9999,
                itemCount: imd.length,
                itemBuilder: (context, index) {
                  return DataTile(data: imd[index]);
                },
              ),
      ),
    );
  }
}
