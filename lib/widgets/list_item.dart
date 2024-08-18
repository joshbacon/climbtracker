import 'package:flutter/material.dart';
import 'package:climb_tracker/models/session.dart';
import 'package:climb_tracker/pages/session_page.dart';

class ListItem extends StatelessWidget {
  const ListItem(this.session, this.callback, {Key? key}) : super(key: key);
  final Session session;
  final Function callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SessionPage(session))
        ).then((value) {
          callback();
        });
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 115.0,
                child: Text(
                  session.getDateString(),
                  style: const TextStyle(color: Color.fromARGB(255, 226, 226, 226), fontSize: 20.0),
                ),
              ),
              const SizedBox( height: 5.0 ),
              Wrap(
                children: [
                  Wrap(
                    children: List.generate(session.getGreen(), (index) => const Icon(
                      Icons.square,
                      size: 24.0,
                      color: Colors.green,
                    )),
                  ),
                  Wrap(
                    children: List.generate(session.getYellow(), (index) => const Icon(
                      Icons.square,
                      size: 24.0,
                      color: Colors.yellow,
                    )),
                  ),
                  Wrap(
                    children: List.generate(session.getOrange(), (index) => const Icon(
                      Icons.square,
                      size: 24.0,
                      color: Colors.orange,
                    )),
                  ),
                  Wrap(
                    children: List.generate(session.getBlue(), (index) => const Icon(
                      Icons.square,
                      size: 24.0,
                      color: Colors.blue,
                    )),
                  ),
                  Wrap(
                    children: List.generate(session.getRed(), (index) => const Icon(
                      Icons.square,
                      size: 24.0,
                      color: Colors.red,
                    )),
                  ),
                  Wrap(
                    children: List.generate(session.getPurple(), (index) => const Icon(
                      Icons.square,
                      size: 24.0,
                      color: Colors.purple,
                    )),
                  ),
                  Wrap(
                    children: List.generate(session.getPink(), (index) => const Icon(
                      Icons.square,
                      size: 24.0,
                      color: Colors.pink,
                    )),
                  ),
                  Wrap(
                    children: List.generate(session.getGrey(), (index) => const Icon(
                      Icons.square,
                      size: 24.0,
                      color: Colors.grey,
                    )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}