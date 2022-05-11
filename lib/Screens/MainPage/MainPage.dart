import 'package:fadba/values/Custom_color.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView(children: [
        Container(
          decoration: BoxDecoration(color: Colors.red),
          width: width * 0.5,
          height: height * 0.3,
        ),
        Container(
          width: width * 0.9,
          height: height * 0.1,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25), color: Colors.blue),
          child: Column(
            children: [
              const Text("Chamada"),
              Row(
                children: [
                  Flexible(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(35)),
                          color: Colors.green),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(Icons.hail),
                            ),
                            Text(
                              "Estudo",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(35)),
                          color: Colors.black),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(Icons.house),
                            ),
                            Text(
                              "Capela",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(35)),
                          color: Colors.yellow),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(Icons.door_back_door),
                            ),
                            Text(
                              "Quarto",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Container(
          decoration: const BoxDecoration(color: Colors.green),
          width: double.infinity,
          height: height * 0.5,
        ),
      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.home),
        onPressed: () {},
        backgroundColor: CustomColor().getCorPadraoAzul,
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      color: Colors.white,
      child: IconTheme(
        data: const IconThemeData(color: Colors.black54),
        child: Padding(
          padding: const EdgeInsets.all(12.00),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Icon(
                  Icons.circle_outlined,
                ),
                Icon(
                  Icons.notifications_active,
                ),
                Icon(
                  Icons.book_outlined,
                ),
                Icon(
                  Icons.calendar_month_outlined,
                ),
                SizedBox(width: 20)
              ]),
        ),
      ),
    );
  }
}
