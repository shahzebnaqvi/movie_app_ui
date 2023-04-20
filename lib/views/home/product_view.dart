import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductView extends StatelessWidget {
  final productdata;
  const ProductView({
    Key? key,
    this.productdata,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: const Color(0xFF211921),
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  height: 445.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage("${productdata.poster}"),
                          fit: BoxFit.fill)),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Color(0xFF211921).withOpacity(1),
                            Color(0xFF211921).withOpacity(0),
                            Color(0xFF211921).withOpacity(0),
                            Color(0xFF211921).withOpacity(0),
                          ]),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///================== text ======================
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 20, left: 20, top: 435),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: Text(
                                  "${productdata.title}",
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: Colors.white,
                                      fontSize: 35.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Spacer(),
                              Text(
                                "${productdata.imdbRating}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width: 5.w),
                              Icon(
                                Icons.star,
                                color: Colors.orange.shade200,
                              )
                            ],
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            "${productdata.released}",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 16.sp,
                            ),
                          ),
                          SizedBox(height: 10.h),

                          ///==================== 3 buton in container ================
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                for (var rating in productdata.ratings) ...[
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: 10.sp, right: 10.sp),
                                    height: 35.h,
                                    // width: 80.w,
                                    decoration: BoxDecoration(
                                        color: Color(0xFF382c3e),
                                        borderRadius:
                                            BorderRadius.circular(15.r)),
                                    child: Center(
                                      child: Text(
                                        "${rating.source}",
                                        style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: 15.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 8.w),
                                ]
                              ],
                            ),
                          ),

                          ///=========== PERAGRAPH CODE ======================
                          SizedBox(height: 20.h),
                          RichText(
                            maxLines: 3,
                            text: TextSpan(
                                text: "${productdata.plot}",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: ' More',
                                      style: const TextStyle(
                                          color: Colors.white70, fontSize: 15),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          // navigate to desired screen
                                        })
                                ]),
                          ),

                          SizedBox(height: 25.h),
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                    top: 50,
                    right: 10,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 40.h,
                        width: 40.h,
                        decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(50)),
                        child: const Center(
                          child: Icon(
                            Icons.close,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 18,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: SizedBox(
              height: 55.h,
              width: 330.w,
              child: ElevatedButton(
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => Splash_Screen()));`
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF7c44c2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    "Watch Now",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 19.sp),
                  )),
            ),
          ),
        )
      ],
    );
  }
}
