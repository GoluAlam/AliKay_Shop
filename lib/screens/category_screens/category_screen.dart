// Category Screen
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  ListView(
        // shrinkWrap: true,
        children: [
         Card1(),
        ],
      )
    );
  }
}

class Card1 extends StatefulWidget {
  const Card1({super.key});

  @override
  State<Card1> createState() => _Card1State();
}

class _Card1State extends State<Card1> {
  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        child: Card(
          child: Column(
            children: [
              SizedBox(
                child: Column(
                  children: [
                    Image.asset('assets/category/img.png',fit: BoxFit.cover,),
                    Padding(
                      padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
                      child: ScrollOnExpand(
                        child: ExpandablePanel(
                          theme: const ExpandableThemeData(
                              tapBodyToCollapse: true, tapBodyToExpand: true),
                          header: Text('Click Here',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                          expanded: const Column(
                            children: [
                              Text(
                                '',
                                softWrap: true,
                                overflow: TextOverflow.fade,
                                style: TextStyle(color: Colors.black),
                              )
                            ],
                          ),
                          collapsed: Padding(
                            padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                            child: ExpansionTile(
                              title: const Text('Categories'),
                              // leading: Icon(Icons.view_list),
                              children: [
                                GestureDetector(
                                  child: SizedBox(
                                      width: 250,
                                      height: 35,
                                      child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.black26,
                                            borderRadius: BorderRadius.circular(15),
                                          ),
                                          child:
                                          Card(child: Center(child: Text("Shalwar kameez"))))),
                                  onTap: () {},
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                GestureDetector(
                                  child: SizedBox(
                                      width: 250,
                                      height: 35,
                                      child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.black26,
                                            borderRadius: BorderRadius.circular(15),
                                          ),
                                          child: Card(child: Center(child: Text("Sherwani."))))),
                                  onTap: () {},
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                GestureDetector(
                                  child: SizedBox(
                                      width: 250,
                                      height: 35,
                                      child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.black26,
                                            borderRadius: BorderRadius.circular(15),
                                          ),
                                          child: Card(
                                              child: Center(child: Text("Sindhi Ajrak or Cap."))))),
                                  onTap: () {},
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                GestureDetector(
                                  child: SizedBox(
                                      width: 250,
                                      height: 40,
                                      child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.black26,
                                            borderRadius: BorderRadius.circular(15),
                                          ),
                                          child: Card(
                                              child: Center(
                                                  child: Text("Punjabi kurta and tehmat."))))),
                                  onTap: () {},
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                GestureDetector(
                                  child: SizedBox(
                                      width: 250,
                                      height: 35,
                                      child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.black26,
                                            borderRadius: BorderRadius.circular(15),
                                          ),
                                          child:
                                          Card(child: Center(child: Text("Saraiki Turban"))))),
                                  onTap: () {},
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                GestureDetector(
                                  child: SizedBox(
                                      width: 250,
                                      height: 35,
                                      child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.black26,
                                            borderRadius: BorderRadius.circular(15),
                                          ),
                                          child:
                                          Card(child: Center(child: Text("Saraiki Kurta."))))),
                                  onTap: () {},
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                GestureDetector(
                                  child: SizedBox(
                                      width: 250,
                                      height: 35,
                                      child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.black26,
                                            borderRadius: BorderRadius.circular(15),
                                          ),
                                          child: Card(
                                              child: Center(child: Text("Peshawari Turban."))))),
                                  onTap: () {},
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                GestureDetector(
                                  child: SizedBox(
                                      width: 250,
                                      height: 35,
                                      child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.black26,
                                            borderRadius: BorderRadius.circular(15),
                                          ),
                                          child:
                                          Card(child: Center(child: Text("Lehenga Choli"))))),
                                  onTap: () {},
                                ),
                              ],
                            ),
                            // Column(
                            //   children: [
                            //     InkWell(
                            //       onTap: (){},
                            //       child: Row(
                            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //         children: [
                            //           const Text(
                            //             'Jacket',
                            //             softWrap: true,
                            //             maxLines: 2,
                            //             overflow: TextOverflow.ellipsis,
                            //             style: TextStyle(color: Colors.black),
                            //           ),
                            //           IconButton(
                            //             onPressed: () {},
                            //             icon: const Icon(Icons.arrow_forward_ios_outlined),iconSize: 17,)
                            //         ],
                            //       ),
                            //     ),
                            //     InkWell(
                            //       onTap: (){},
                            //       child: Row(
                            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //         children: [
                            //           const Text(
                            //             'Skirts',
                            //             softWrap: true,
                            //             maxLines: 2,
                            //             overflow: TextOverflow.ellipsis,
                            //             style: TextStyle(color: Colors.black),
                            //           ),
                            //           IconButton(
                            //             onPressed: () {},
                            //             icon: const Icon(Icons.arrow_forward_ios_outlined),iconSize: 17,)
                            //         ],
                            //       ),
                            //     ),
                            //     InkWell(
                            //       onTap: (){},
                            //       child: Row(
                            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //         children: [
                            //           const Text(
                            //             'Sweaters',
                            //             softWrap: true,
                            //             maxLines: 2,
                            //             overflow: TextOverflow.ellipsis,
                            //             style: TextStyle(color: Colors.black),
                            //           ),
                            //           IconButton(
                            //             onPressed: () {},
                            //             icon: const Icon(Icons.arrow_forward_ios_outlined),iconSize: 17,)
                            //         ],
                            //       ),
                            //     ),
                            //     InkWell(
                            //       onTap: (){},
                            //       child: Row(
                            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //         children: [
                            //           const Text(
                            //             'Jeans',
                            //             softWrap: true,
                            //             maxLines: 2,
                            //             overflow: TextOverflow.ellipsis,
                            //             style: TextStyle(color: Colors.black),
                            //           ),
                            //           IconButton(
                            //             onPressed: () {},
                            //             icon: const Icon(Icons.arrow_forward_ios_outlined),iconSize: 17,)
                            //         ],
                            //       ),
                            //     ),
                            //     InkWell(
                            //       onTap: (){},
                            //       child: Row(
                            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //         children: [
                            //           const Text(
                            //             'T-Shirts',
                            //             softWrap: true,
                            //             maxLines: 2,
                            //             overflow: TextOverflow.ellipsis,
                            //             style: TextStyle(color: Colors.black),
                            //           ),
                            //           IconButton(
                            //             onPressed: () {},
                            //             icon: const Icon(Icons.arrow_forward_ios_outlined),iconSize: 17,)
                            //         ],
                            //       ),
                            //     ),
                            //     InkWell(
                            //       onTap: (){},
                            //       child: Row(
                            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //         children: [
                            //           const Text(
                            //             'Pants',
                            //             softWrap: true,
                            //             maxLines: 2,
                            //             overflow: TextOverflow.ellipsis,
                            //             style: TextStyle(color: Colors.black),
                            //           ),
                            //           IconButton(
                            //             onPressed: () {},
                            //             icon: const Icon(Icons.arrow_forward_ios_outlined),iconSize: 17,)
                            //         ],
                            //       ),
                            //     ),
                            //   ],
                            // ),
                          ),
                          builder: (_, expanded, collapsed) {
                            return Expandable(collapsed: collapsed, expanded: expanded);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              SizedBox(
                child: Column(
                    children: [
                  Image.asset('assets/category/img.png',fit: BoxFit.cover,),
                  Padding(
                    padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
                    child: ScrollOnExpand(
                      child: ExpandablePanel(
                        theme: const ExpandableThemeData(
                            tapBodyToCollapse: true, tapBodyToExpand: true),
                        header: Text('Click Here',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                        expanded: const Column(
                          children: [
                            Text(
                              '',
                              softWrap: true,
                              overflow: TextOverflow.fade,
                              style: TextStyle(color: Colors.black),
                            )
                          ],
                        ),
                        collapsed: Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: (){},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Jacket',
                                      softWrap: true,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.arrow_forward_ios_outlined),iconSize: 17,)
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: (){},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Skirts',
                                      softWrap: true,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.arrow_forward_ios_outlined),iconSize: 17,)
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: (){},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Sweaters',
                                      softWrap: true,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.arrow_forward_ios_outlined),iconSize: 17,)
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: (){},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Jeans',
                                      softWrap: true,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.arrow_forward_ios_outlined),iconSize: 17,)
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: (){},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'T-Shirts',
                                      softWrap: true,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.arrow_forward_ios_outlined),iconSize: 17,)
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: (){},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Pants',
                                      softWrap: true,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.arrow_forward_ios_outlined),iconSize: 17,)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        builder: (_, expanded, collapsed) {
                          return Expandable(collapsed: collapsed, expanded: expanded);
                        },
                      ),
                    ),
                  ),
                ]
                ),
              ),
              const SizedBox(height: 20,),
              SizedBox(
                child: Column(
                    children: [
                      Image.asset('assets/category/img.png',fit: BoxFit.cover,),
                      Padding(
                        padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
                        child: ScrollOnExpand(
                          child: ExpandablePanel(
                            theme: const ExpandableThemeData(
                                tapBodyToCollapse: true, tapBodyToExpand: true),
                            header: Text('Click Here',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                            expanded: const Column(
                              children: [
                                Text(
                                  '',
                                  softWrap: true,
                                  overflow: TextOverflow.fade,
                                  style: TextStyle(color: Colors.black),
                                )
                              ],
                            ),
                            collapsed: Padding(
                              padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: (){},
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Jacket',
                                          softWrap: true,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.arrow_forward_ios_outlined),iconSize: 17,)
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: (){},
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Skirts',
                                          softWrap: true,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.arrow_forward_ios_outlined),iconSize: 17,)
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: (){},
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Sweaters',
                                          softWrap: true,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.arrow_forward_ios_outlined),iconSize: 17,)
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: (){},
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Jeans',
                                          softWrap: true,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.arrow_forward_ios_outlined),iconSize: 17,)
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: (){},
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'T-Shirts',
                                          softWrap: true,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.arrow_forward_ios_outlined),iconSize: 17,)
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: (){},
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Pants',
                                          softWrap: true,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.arrow_forward_ios_outlined),iconSize: 17,)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            builder: (_, expanded, collapsed) {
                              return Expandable(collapsed: collapsed, expanded: expanded);
                            },
                          ),
                        ),
                      ),
                    ]
                ),
              ),
              const SizedBox(height: 20,),
              SizedBox(
                child: Column(
                    children: [
                      Image.asset('assets/category/img.png',fit: BoxFit.cover,),
                      Padding(
                        padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
                        child: ScrollOnExpand(
                          child: ExpandablePanel(
                            theme: const ExpandableThemeData(
                                tapBodyToCollapse: true, tapBodyToExpand: true),
                            header: Text('Click Here',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                            expanded: const Column(
                              children: [
                                Text(
                                  '',
                                  softWrap: true,
                                  overflow: TextOverflow.fade,
                                  style: TextStyle(color: Colors.black),
                                )
                              ],
                            ),
                            collapsed: Padding(
                              padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: (){},
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Jacket',
                                          softWrap: true,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.arrow_forward_ios_outlined),iconSize: 17,)
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: (){},
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Skirts',
                                          softWrap: true,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.arrow_forward_ios_outlined),iconSize: 17,)
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: (){},
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Sweaters',
                                          softWrap: true,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.arrow_forward_ios_outlined),iconSize: 17,)
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: (){},
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Jeans',
                                          softWrap: true,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.arrow_forward_ios_outlined),iconSize: 17,)
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: (){},
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'T-Shirts',
                                          softWrap: true,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.arrow_forward_ios_outlined),iconSize: 17,)
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: (){},
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Pants',
                                          softWrap: true,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.arrow_forward_ios_outlined),iconSize: 17,)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            builder: (_, expanded, collapsed) {
                              return Expandable(collapsed: collapsed, expanded: expanded);
                            },
                          ),
                        ),
                      ),
                    ]
                ),
              ),
              const SizedBox(height: 20,),
              SizedBox(
                child: Column(
                    children: [
                      Image.asset('assets/category/img.png',fit: BoxFit.cover,),
                      Padding(
                        padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
                        child: ScrollOnExpand(
                          child: ExpandablePanel(
                            theme: const ExpandableThemeData(
                                tapBodyToCollapse: true, tapBodyToExpand: true),
                            header: Text('Click Here',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                            expanded: const Column(
                              children: [
                                Text(
                                  '',
                                  softWrap: true,
                                  overflow: TextOverflow.fade,
                                  style: TextStyle(color: Colors.black),
                                )
                              ],
                            ),
                            collapsed: Padding(
                              padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: (){},
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Jacket',
                                          softWrap: true,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.arrow_forward_ios_outlined),iconSize: 17,)
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: (){},
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Skirts',
                                          softWrap: true,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.arrow_forward_ios_outlined),iconSize: 17,)
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: (){},
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Sweaters',
                                          softWrap: true,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.arrow_forward_ios_outlined),iconSize: 17,)
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: (){},
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Jeans',
                                          softWrap: true,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.arrow_forward_ios_outlined),iconSize: 17,)
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: (){},
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'T-Shirts',
                                          softWrap: true,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.arrow_forward_ios_outlined),iconSize: 17,)
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: (){},
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Pants',
                                          softWrap: true,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.arrow_forward_ios_outlined),iconSize: 17,)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            builder: (_, expanded, collapsed) {
                              return Expandable(collapsed: collapsed, expanded: expanded);
                            },
                          ),
                        ),
                      ),
                    ]
                ),
              )
            ],
          ),
        ));
  }
}
