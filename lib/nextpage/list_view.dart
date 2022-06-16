import 'package:flutter/material.dart';
import 'package:untitled/default_ui/next_page_preset_class.dart';
import 'package:untitled/resource/strings.dart';

class list_view extends StatefulWidget {
  list_view({Key? key}) : super(key: key);

  @override
  _list_view createState() => _list_view();
}

class _list_view extends State<list_view> {
  //透過資料產生器，產生資料
  final List<ProductListView> listItems =
      new List<ProductListView>.generate(500, (i) {
    return ProductListView(
      name: '測試資料 $i',
      price: '售價：$i',
    );
  });

  @override
  Widget build(BuildContext context) {
    return NextPagePresetClass(
      title: strings.StackComponentsPage,
      body: Center(
          child: ListView.builder(
        itemCount: listItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.event_seat),
            title: Text('${listItems[index].name}'),
            subtitle: Text('${listItems[index].price}'),
          );
        },
      )),
    );
  }
}

//產品資料
class ProductListView {
  final String name;
  final String price;

  ProductListView({required this.name, required this.price});
}
