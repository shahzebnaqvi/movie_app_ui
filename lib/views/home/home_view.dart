import 'package:codingchallenge/components/popular_video_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF211921),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 44, right: 20, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Hi, IT Coderz!",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 30.sp,
                            ),
                          ),
                          Spacer(),
                          const CircleAvatar(
                            // backgroundImage:
                            //     AssetImage('assets/profile_img.png'),
                            radius: 30,
                            child: Align(
                              alignment: Alignment.topRight,
                              child: CircleAvatar(
                                backgroundColor: Color(0xFF7c44c2),
                                radius: 7.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15.h),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 55,
                        child: TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xFF382c3e),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none,
                            ),
                            hintText: 'Search',
                            hintStyle: const TextStyle(color: Colors.white70),
                            prefixIcon: const Icon(
                              Icons.search,
                              color: Colors.white70,
                              size: 24,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 25.h),
                    ],
                  ),
                ),

                ///==================================== Popular ===================
                SizedBox(height: 10.h),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Text(
                        "Popular",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 20.sp,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "See All",
                        style: TextStyle(
                          color: Color(0xFF643B9F),
                          fontSize: 15.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                Popular_Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

///===================== sarusal slider ====================
Widget buildImage(String urlImage, int index) => Container(
      width: 235.w,
      child: Container(
        decoration: BoxDecoration(
          // border: Border.all(color: Colors.white, width: 0.6),
          borderRadius: BorderRadius.circular(15),
        ),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(urlImage, fit: BoxFit.cover)),
      ),
    );

Widget buildIndicator(bool isSelected) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 1),
    child: Container(
      height: isSelected ? 10 : 8,
      width: isSelected ? 10 : 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected ? Color(0xFF998396) : Colors.grey,
      ),
    ),
  );
}
