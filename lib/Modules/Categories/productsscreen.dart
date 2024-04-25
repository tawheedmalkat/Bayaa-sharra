import 'package:ecomm/Modules/Categories/productscontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Constant/color&fonts.dart';
import '../../helpers/ChoiceChip/choicechip.dart';
import '../../helpers/Search/search.dart';
import '../../widget/search-appbar.dart';

class Categoryee extends StatelessWidget {
  final ChoiceChipController controllere = Get.put(ChoiceChipController());

  final List<String> tabs = [
    "Real estate".tr,
    "Vehicles".tr,
    "Animals".tr,
    "Jobs",
    "Electronic and electrical devices".tr,
    "Books,hobbies",
    "Furniture and furnishings".tr,
    " Personal belongings".tr,
    " Clothes, fashion ".tr,
    "Food and drinks".tr,
    "Sports",
    "Baby supplies",
    "Industrial and professional supplies",
  ];
  final ProductsController controller = Get.put(ProductsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colori.DarkBlue),
        title: Text(
          "Categories".tr,
          style: TextStyle(
            color: Colori.DarkBlue,
            fontWeight: FontWeight.bold,
            fontFamily: "Anta",
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Padding(
              padding: EdgeInsets.only(left: 30.0),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colori.mainblue,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Icon(
                      Icons.filter_alt,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  SizedBox(width: 10,),
                  InkWell(
                    onTap: () {
                      showSearch(context: context, delegate: Searching());
                    },
                    child: ContainerSearch(),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30,),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: MediaQuery.of(context).size.width > 600 ? 4 : 2,
                  childAspectRatio: 1 / 1.5,
                  crossAxisSpacing: 7,
                  mainAxisSpacing: 5,
                ),
                itemCount: controller.productsModel.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            controller.productsModel[index].image,
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text('\$${controller.productsModel![index].price.toString()}'),
                        // Add some spacing between price and rating stars
                        buildRatingStars(controller.productsModel![index].rating?.rate ?? 0),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                          child: Text(controller.productsModel[index].title),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRatingStars(double rating) {
    // Calculate the number of full stars
    int fullStars = rating.floor();
    // Calculate the number of half stars
    int halfStars = (rating - fullStars > 0.5) ? 1 : 0;

    // Create a list of star icons representing the rating
    List<Widget> starIcons = [];

    // Add full star icons
    for (int i = 0; i < fullStars; i++) {
      starIcons.add(Icon(Icons.star, color: Colors.amber));
    }

    // Add half star icon if needed
    if (halfStars == 1) {
      starIcons.add(Icon(Icons.star_half, color: Colors.amber));
    }

    // Add empty star icons to complete to five stars
    while (starIcons.length < 5) {
      starIcons.add(Icon(Icons.star_border, color: Colors.amber));
    }

    // Return a row containing the star icons
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: starIcons,
    );
  }
}
