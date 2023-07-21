
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_list_api_app/Screen/Home/controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemCard extends StatelessWidget {

  int index;

  ItemCard(this.index);

  final homeController = Get.find<HomeController>();

  var img = 'https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/ML6H3ref_VW_34FR+watch-45-alum-starlight-nc-7s_VW_34FR_WF_CO?wid=750&hei=712&trim=1%2C0&fmt=p-jpg&qlt=95&.v=1630364962000%2C1631661833000';

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.9,
      child: Container(
        height: 200,
        margin: const EdgeInsets.only(top:20),
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.hardLight),
            image: CachedNetworkImageProvider(homeController.foodList[index].image),
            fit: BoxFit.cover
          ),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF231024).withOpacity(0.3),
              offset: const Offset(
                  0.0, // Move to right 10  horizontally
                  1.0, // Move to bottom 10 Vertically
              ),
              blurRadius: 5.0,
              spreadRadius: 0.5,
            )
          ]
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children:[
              Expanded(
                child: Center(
                  child: Text(homeController.foodList[index].name, style: GoogleFonts.ubuntu(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ))
                )
              ),
                Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildSubContainer(50, homeController.foodList[index].rating.toString(), Icons.star),
                  _buildSubContainer(90, homeController.foodList[index].totalTime, Icons.timelapse)
                ]
              )
            ]
          )
        )
      )
    );
  }

  _buildSubContainer(double wD, String title, IconData icoN){
    return Container(
      height: 30,
      width: wD,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.4),
        borderRadius: BorderRadius.circular(20)
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(icoN, color: Colors.amber, size:15),
            Text('$title', style: TextStyle(
              color: Colors.white,
              fontSize: 12
            ),overflow: TextOverflow.ellipsis,)
          ],
        ),
      ),
    );
  }
}
// Card(
//       child: ListTile(
//         leading:  CachedNetworkImage(imageUrl: homeController.productList[index]['image'], width: 50),
      
//         title: Text(homeController.productList[index]['title'], style: GoogleFonts.ubuntu(
//           fontSize: 14,
//           fontWeight: FontWeight.w500,
//           color: Colors.black
//         )),
//         subtitle: Text(homeController.productList[index]['price'].toString(), style: GoogleFonts.ubuntu(
//           fontSize: 12,
//           fontWeight: FontWeight.w500,
//           color: Colors.grey[500]
//         )),
//         onTap: (){
          
//         },
//         trailing: Icon(Icons.shopping_basket_rounded, color: Colors.redAccent)
//       )
//     );