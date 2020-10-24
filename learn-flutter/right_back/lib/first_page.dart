import 'package:flutter/cupertino.dart';
import 'package:right_back/second_page.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: Icon(
          CupertinoIcons.home,
          color: CupertinoColors.white,
        ),
        middle: Text(
          'First Page',
          style: TextStyle(color: CupertinoColors.white),
        ),
        backgroundColor: CupertinoColors.activeBlue,
      ),
      child: Center(
        child: Container(
          width: 200,
          height: 200,
          color: CupertinoColors.activeBlue,
          child: CupertinoButton(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  CupertinoIcons.forward_fill,
                  color: CupertinoColors.white,
                ),
                Text(
                  'First Page, go next...',
                  style: TextStyle(color: CupertinoColors.white),
                )
              ],
            ),
            onPressed: () {
              Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => SecondPage()));
            },
          ),
        ),
      ),
    );
  }
}
