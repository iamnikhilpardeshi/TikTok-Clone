import 'package:flutter/material.dart';

class TabsFollowing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            cursorColor: Colors.black,
            decoration: InputDecoration(
              hintText: "Search",
              prefixIcon: Icon(Icons.search),
              border: InputBorder.none,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.black26,
                  ),
                  title: const Text('Person UserName'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  trailing: IconButton(
                      icon: Icon(Icons.thumb_up),
                      onPressed: () {},
                      color: Colors.black38),
                  subtitle: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Person Name',
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.black26,
                  ),
                  title: const Text('Person UserName'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  trailing: IconButton(
                      icon: Icon(Icons.thumb_up),
                      onPressed: () {},
                      color: Colors.black38),
                  subtitle: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Person Name',
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
