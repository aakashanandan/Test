import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/Controller/dash_controller.dart';
import 'package:test_project/widgets/tile_widget.dart';

import '../widgets/Iconwidget.dart';
import '../widgets/Radio_widget.dart';
import '../widgets/container_widget.dart';
import '../widgets/textwidget.dart';

class Dashboard_page extends StatefulWidget {
  const Dashboard_page({super.key});

  @override
  State<Dashboard_page> createState() => _Dashboard_pageState();
}

class _Dashboard_pageState extends State<Dashboard_page> {


  DashController controller = Get.put(DashController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: BackButton(
          onPressed: () {},
          color: Colors.blue,
        ),
        centerTitle: true,
        title: Text("Bangalore",style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 16
        ),),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(
            Icons.search,color: Colors.blue,
          ))
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  TextFormField(
                    controller: controller.search,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                      hintText: "Locality, Project or Builders",
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                          fontWeight: FontWeight.normal),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade300, width: 0.5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade300, width: 0.5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade300, width: 0.5),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CustomText(
                      text: "Property Type",
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 15.0,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: const Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconTextWidget(
                            icon: Icons.maps_home_work_outlined,
                            label: "Apartment",
                            iconColor: Colors.blue,
                            iconSize: 30.0,
                          ),
                          IconTextWidget(
                            icon: Icons.add_home_work_rounded,
                            label: "Villa",
                            iconColor: Colors.grey,
                            iconSize: 30.0,
                          ),
                          IconTextWidget(
                            icon: Icons.build_circle_outlined,
                            label: "Plot",
                            iconColor: Colors.grey,
                            iconSize: 30.0,
                          ),
                          IconTextWidget(
                            icon: Icons.holiday_village,
                            label: "Builder\n Floor",
                            iconColor: Colors.grey,
                            iconSize: 30.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CustomText(
                      text: "Range Type",
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 15.0,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  CustomText(
                                    text: "MIN",
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17.0,
                                  ),
                                  CustomText(
                                    text: "₹ ${controller.minValue.toStringAsFixed(3)}",  // Ensures 3 decimal places
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15.0,
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  CustomText(
                                    text: "Max",
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17.0,
                                  ),
                                  CustomText(
                                    text: "₹ ${controller.maxValue.toStringAsFixed(3)}",  // Ensures 3 decimal places
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15.0,
                                  )
                                ],
                              )
                            ],
                          ),

                        ),
                        SizedBox(height: 10),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            trackHeight: 4.0,
                            activeTrackColor: Colors.blue,
                            inactiveTrackColor: Colors.grey,
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 5.0),
                          ),
                          child: RangeSlider(
                            activeColor: Colors.blue,
                            inactiveColor: Colors.grey,
                            values: RangeValues(
                                controller.minValue.clamp(0.0, 100.0),
                                controller.maxValue.clamp(0.0, 100.0)
                            ),
                            min: 0,
                            max: 100,
                            divisions: 100,
                            labels: RangeLabels(
                              '₹ ${controller.minValue.toStringAsFixed(0)}',
                              '₹ ${controller.maxValue.toStringAsFixed(0)} Cr+',
                            ),
                            onChanged: (RangeValues values) {
                              controller.minValue = values.start;
                              controller.maxValue = values.end;
                              controller.update();
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CustomText(
                      text: "Bed Rooms",
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 15.0,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomContainer(text: "1"),
                      CustomContainer(text: "2"),
                      CustomContainer(text: "3"),
                      CustomContainer(text: "4"),
                      CustomContainer(text: "5+"),
                    ],
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CustomText(
                      text: "Availability",
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 15.0,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          RadioWidget(
                            title: 'Ready to move',
                            value: 3,
                            groupValue: controller.selectedValue!,
                            onChanged: (int? value) {
                              controller.selectedValue = value;
                              controller.update();
                            },
                          ),
                          RadioWidget(
                            title: 'With in 6 months',
                            value: 3,
                            groupValue: controller.selectedValue!,
                            onChanged: (int? value) {
                              controller.selectedValue = value;
                              controller.update();
                            },
                          ),
                          RadioWidget(
                            title: 'With in 1 year',
                            value: 3,
                            groupValue: controller.selectedValue!,
                            onChanged: (int? value) {
                                controller.selectedValue = value;
                                controller.update();
                            },
                          ),
                          RadioWidget(
                            title: 'More then 1 year',
                            value: 3,
                            groupValue: controller.selectedValue!,
                            onChanged: (int? value) {
                              controller.selectedValue = value;
                              controller.update();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CustomText(
                      text: "Area",
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 15.0,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  CustomText(
                                    text: "MIN",
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17.0,
                                  ),
                                  CustomText(
                                    text: "${controller.minValue.toStringAsFixed(0)} sq.ft",
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15.0,
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  CustomText(
                                    text: "Max",
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17.0,
                                  ),
                                  CustomText(
                                    text: "${controller.maxValue.toStringAsFixed(0)} sq.ft",
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15.0,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            trackHeight: 4.0,
                            activeTrackColor: Colors.blue,
                            inactiveTrackColor: Colors.grey,
                            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 5.0),
                          ),
                          child: RangeSlider(
                            activeColor: Colors.blue,
                            inactiveColor: Colors.grey,
                            values: RangeValues(
                                controller.minValue.clamp(0.0, 5000.0),
                                controller.maxValue.clamp(0.0, 5000.0)
                            ),
                            min: 0,
                            max: 5000,
                            divisions: 100,
                            labels: RangeLabels(
                              '₹ ${controller.minValue.toStringAsFixed(0)}',
                              '₹ ${controller.maxValue.toStringAsFixed(0)} Sq Ft',
                            ),
                            onChanged: (RangeValues values) {
                              controller.minValue = values.start;
                              controller.maxValue = values.end;
                              controller.update();
                            },
                          ),

                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: "Recent search".toUpperCase(),
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.0,
                      ),
                      CustomText(
                        text: "Clear all",
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.0,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: Column(
                      children: [
                        ListTileWidget(
                          leadingIcon: Icons.access_time_sharp,
                          title: "HSR Layout",
                          iconColor: Colors.black,
                          iconSize: 20.0,
                          titleColor: Colors.black,
                          titleWeight: FontWeight.w500,
                          titleSize: 13.0,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CustomText(
                      text: "locality".toUpperCase(),
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 15.0,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: Column(
                      children: [
                        ListTileWidget(
                          leadingIcon: Icons.location_city_outlined,
                          title: "Valapalani",
                          iconColor: Colors.grey,
                          iconSize: 20.0,
                          titleColor: Colors.black,
                          titleWeight: FontWeight.w500,
                          titleSize: 13.0,
                        ),
                        ListTileWidget(
                          leadingIcon: Icons.location_city_outlined,
                          title: "Anna Nagar",
                          iconColor: Colors.grey,
                          iconSize: 20.0,
                          titleColor: Colors.black,
                          titleWeight: FontWeight.w500,
                          titleSize: 13.0,
                        ),
                        ListTileWidget(
                          leadingIcon: Icons.location_city_outlined,
                          title: "Porur",
                          iconColor: Colors.grey,
                          iconSize: 20.0,
                          titleColor: Colors.black,
                          titleWeight: FontWeight.w500,
                          titleSize: 13.0,
                        ),
                        ListTileWidget(
                          leadingIcon: Icons.location_city_outlined,
                          title: "ECR",
                          iconColor: Colors.grey,
                          iconSize: 20.0,
                          titleColor: Colors.black,
                          titleWeight: FontWeight.w500,
                          titleSize: 13.0,
                        ),
                        ListTileWidget(
                          leadingIcon: Icons.location_city_outlined,
                          title: "Tambaram",
                          iconColor: Colors.grey,
                          iconSize: 20.0,
                          titleColor: Colors.black,
                          titleWeight: FontWeight.w500,
                          titleSize: 13.0,
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CustomText(
                      text: "project".toUpperCase(),
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 15.0,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: Column(
                      children: [
                        ListTileWidget(
                          leadingIcon: Icons.file_copy_outlined,
                          title: "Wind Four Season",
                          iconColor: Colors.grey,
                          iconSize: 20.0,
                          titleColor: Colors.black,
                          titleWeight: FontWeight.w500,
                          titleSize: 13.0,
                        ),
                        ListTileWidget(
                          leadingIcon: Icons.file_copy_outlined,
                          title: "Instagram",
                          iconColor: Colors.grey,
                          iconSize: 20.0,
                          titleColor: Colors.black,
                          titleWeight: FontWeight.w500,
                          titleSize: 13.0,
                        ),
                        ListTileWidget(
                          leadingIcon: Icons.file_copy_outlined,
                          title: "Whatsapp",
                          iconColor: Colors.grey,
                          iconSize: 20.0,
                          titleColor: Colors.black,
                          titleWeight: FontWeight.w500,
                          titleSize: 13.0,
                        ),
                        ListTileWidget(
                          leadingIcon: Icons.file_copy_outlined,
                          title: "Facebook",
                          iconColor: Colors.grey,
                          iconSize: 20.0,
                          titleColor: Colors.black,
                          titleWeight: FontWeight.w500,
                          titleSize: 13.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(onPressed: (){},
              child:Center(
                child: CustomText(
                  text: "Search",
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 15.0,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                fixedSize: Size(MediaQuery.of(context).size.width, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,  // Sharp edges
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
