import 'package:codingchallenge/controllers/product_controller.dart/product_controller.dart';
import 'package:codingchallenge/views/home/product_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class Popular_Container extends StatelessWidget {
  ProductController productControll = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: productControll,
        builder: (contexat) {
          return productControll.Loading == true
              ? Container(
                  // color: Colors.yellow,
                  height: 220.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) => Container(
                      child: shimmer2(),
                      margin: EdgeInsets.all(10),
                      height: 180.h,
                    ),
                  ),
                )
              : Container(
                  // color: Colors.yellow,
                  height: 250.h,
                  child: ListView.builder(
                    itemCount: productControll.productlist.length,
                    itemBuilder: (context, index) => Category(
                      image_location:
                          "${productControll.productlist[index].poster}",
                      image_caption:
                          '${productControll.productlist[index].title}',
                      product_data: productControll.productlist[index],
                    ),
                    scrollDirection: Axis.horizontal,
                  ),
                );
        });
  }
}

class Category extends StatelessWidget {
  final String image_location;
  final String? image_caption;
  final product_data;
  final Function? function;

  Category(
      {required this.image_location,
      this.image_caption,
      this.function,
      this.product_data});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: EdgeInsets.only(left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProductView(
                              productdata: product_data,
                            )));
              },
              child: Container(
                height: 200.h,
                width: 170.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Image.network(image_location, fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: SizedBox(
                width: 170,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 125,
                      child: Text(
                        image_caption!,
                        style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Spacer(),
                    Text(
                      "${product_data.imdbRating}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                      ),
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.orange.shade200,
                    )
                  ],
                ),
              ),
            ),
            Text(
              "${product_data.year}",
              style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class shimmer2 extends StatelessWidget {
  const shimmer2({Key? key}) : super(key: key);

  get primaryColor1 => null;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Color.fromARGB(255, 51, 39, 51),
        highlightColor: Color.fromARGB(255, 56, 44, 56),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 180.h,
                width: MediaQuery.of(context).size.width * 0.50,
                color: Colors.grey,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: 10.h,
                color: Colors.grey,
              ),
            ]));
  }
}
