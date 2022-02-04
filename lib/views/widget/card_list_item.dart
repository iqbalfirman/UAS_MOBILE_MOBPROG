import 'package:booking_restaurant_uas/models/menu_model.dart';
import 'package:booking_restaurant_uas/services/Api.dart';
import 'package:booking_restaurant_uas/utils/utility.dart';
import 'package:flutter/material.dart';

class CardListItem extends StatelessWidget {
  final MenuModel item;
  const CardListItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
       shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
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
                   RestDataSource.baseUrl +"/menu/gambar/" +
                        item.gambar!,
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width * 0.2,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  item.jml.toString() + "x ",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Theme.of(context).primaryColor),
                ),
                Text(
                  item.nama ?? "",
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            Text(
             Utility.currency(item.harga??0),
              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}
