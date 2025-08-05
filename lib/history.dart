import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryList extends StatelessWidget {
  final List<List<String>> historyEntries;

  const HistoryList(this.historyEntries, {super.key});

  void HistoryList_usingBottomList(BuildContext x){
    showModalBottomSheet(
      context: x,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Bottom Sheet Title',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text('This bottom sheet was triggered from another file.'),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Close'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "History",
          style: GoogleFonts.acme(
            fontWeight: FontWeight.w800,
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        backgroundColor: Colors.blueGrey,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.delete_sweep_rounded, color: Colors.white),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: historyEntries.length,
        itemBuilder: (context, index) {
          return Expanded(
            child: Container(
              color: Colors.blueGrey[400],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Text(
                      historyEntries[index][0],
                      style: GoogleFonts.acme(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Text(
                      historyEntries[index][1],
                      style: GoogleFonts.acme(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

void HistoryList_usingBottombutton(BuildContext context,List<List<String>> historyEntries) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Card(
        child: ListView.builder(
          itemCount: historyEntries.length,
          itemBuilder: (context, index) {
            return Card(
              child: Container(
                color: Colors.blueGrey[400],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Text(
                        historyEntries[index][0],
                        style: GoogleFonts.acme(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Text(
                        historyEntries[index][1],
                        style: GoogleFonts.acme(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    },
  );
}
