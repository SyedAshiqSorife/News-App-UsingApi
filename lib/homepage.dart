import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:news_app/newsportal/portal.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildItem("assets/images/prothomalo.png"),
            const SizedBox(
              height: 20,
            ),
            _buildItem("assets/images/bbc.png"),
            const SizedBox(
              height: 20,
            ),
            _buildItem("assets/images/thedailystar.png"),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(
    String imgPath,
  ) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      child: InkWell(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => const Portal()));
          },
          child: Center(
            child: Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              height: MediaQuery.of(context).size.height * .2,
              width: MediaQuery.of(context).size.width * .9,
              decoration: BoxDecoration(
                color: const Color(0xff7c94b6),
                image: DecorationImage(
                  image: AssetImage(
                    imgPath,
                  ),
                  //fit: BoxFit.fill,
                ),
                border: Border.all(
                  color: Colors.white,
                  width: 8,
                ),
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          )),
    );
  }
}
