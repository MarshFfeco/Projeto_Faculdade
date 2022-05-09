import 'package:fadba/values/Custom_color.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("ola"),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.home),
        onPressed: () {},
        backgroundColor: CustomColor().getCorPadraoAzul,
      ),
      bottomNavigationBar: BottomAppBar(
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
      ),
    );
  }
}
