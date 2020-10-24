import 'package:flutter/material.dart';

class ExpansionList extends StatefulWidget {
  @override
  _ExpansionListState createState() => _ExpansionListState();
}

class _ExpansionListState extends State<ExpansionList> {
  List<int> list = List();
  List<ExpansionStateBean> expansionStateList = List();

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 10; i++) {
      list.add(i);
      expansionStateList.add(ExpansionStateBean(false));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('expansion panel list'),
      ),
      body: SingleChildScrollView(
        child: ExpansionPanelList(
          expansionCallback: (index, bool) {
            setState(() {
              expansionStateList[index].isOpen = !bool;
            });
          },
          children: list.map<ExpansionPanel>((item) {
            return ExpansionPanel(
                headerBuilder: (context, bool) {
                  return Text('This is item $item');
                },
                body: ListTile(
                  title: Text('item $item'),
                ),
                isExpanded: expansionStateList[item].isOpen);
          }).toList(),
        ),
      ),
    );
  }
}

class ExpansionStateBean {
  bool isOpen;

  ExpansionStateBean(this.isOpen);
}
