import 'package:booking_restaurant_uas/models/menu_model.dart';
import 'package:booking_restaurant_uas/services/Api.dart';
import 'package:booking_restaurant_uas/utils/utility.dart';
import 'package:flutter/material.dart';

class CardListMenu extends StatelessWidget {
  final MenuModel menu;
  final Function(MenuModel) increment;
  final Function(MenuModel) decrement;
  const CardListMenu(
      {Key? key,
      required this.menu,
      required this.increment,
      required this.decrement})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                  RestDataSource.baseUrl+"/menu/gambar/"+menu.gambar!,
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width * 0.2,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 120,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        menu.nama ?? "",
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                      Text(
                        Utility.currency(menu.harga??0),
                        style: const TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 18),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Row(
              children: [
                IconButton(
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      decrement(menu);
                    },
                    icon: const Icon(
                      Icons.remove,
                      size: 20,
                    )),
                Text(menu.jml.toString()),
                IconButton(
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      increment(menu);
                    },
                    icon: const Icon(
                      Icons.add,
                      size: 20,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
