import 'package:flutter/material.dart';
import 'package:news_app/util/helpper/text_style.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  final List<Map<String, String>> breakingNews = const [
    {
      "image": "https://picsum.photos/400/200?1",
      "title": "Scientist Just Found The Lost Species of Jellyfish"
    },
    {
      "image": "https://picsum.photos/400/200?2",
      "title": "New AI Model Beats Human Doctors in Diagnosis"
    },
    {
      "image": "https://picsum.photos/400/200?3",
      "title": "SpaceX Prepares for Historic Moon Landing"
    },
  ];

  final List<Map<String, String>> trendingNews = const [
    {
      "image": "https://picsum.photos/400/200?4",
      "title": "Flying Car Already Tested on a Mass Scale"
    },
    {
      "image": "https://picsum.photos/400/200?5",
      "title": "Tesla Launches New Solar Battery"
    },
    {
      "image": "https://picsum.photos/400/200?6",
      "title": "Apple Vision Pro Gets Major Update"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Padding(
        padding: const EdgeInsets.only(left: 12, top: 12, right: 12, bottom: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),

            /// Header: Avatar + Welcome + Notification
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 24,
                      backgroundImage: NetworkImage(
                        "https://image.winudf.com/v2/image1/Y29tLm1vYmVhc3lhcHAuYXBwOTA5MTk0NTYxNzNfc2NyZWVuXzBfMTY2MDAzNzc0Nl8wMjY/screen-0.jpg?fakeurl=1&type=.jpg",
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Welcome",
                            style: mTextStyle12(
                              textColor: Colors.black54,
                            )),
                        const SizedBox(height: 4),
                        Text("Sujan !", style: mTextStyle18()),
                      ],
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications_none, size: 28),
                ),
              ],
            ),

            const SizedBox(height: 10),

            /// Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: "Let's see what happened today",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey.shade200,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

             SizedBox(height: 20),

            /// Breaking News Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Breaking News !",
                    style: mTextStyle20(mFontWeight: FontWeight.bold)),
                Text("See all", style: mTextStyle14(textColor: Colors.blue)),
              ],
            ),

             SizedBox(height: 20),

            /// Breaking News Card
            SizedBox(
              height: 220,
              child: Stack(
                children: [
                  // Background Image
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      image: const DecorationImage(
                        image: NetworkImage(
                          "https://i.pinimg.com/736x/5f/84/e4/5f84e4c54fa4a9cfb28abed3bd3ca810.jpg",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // Dark Gradient Overlay
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withOpacity(0.6),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),

                  // Tags on top-left
                  Positioned(
                    top: 12,
                    left: 12,
                    child: Row(
                      children: [
                        _buildTag("🔥 Hot", Colors.red),
                        const SizedBox(width: 8),
                        _buildTag("Nature", Colors.blue),
                        const SizedBox(width: 8),
                        _buildTag("Animal", Colors.green),
                      ],
                    ),
                  ),

                  // News details at bottom
                  Positioned(
                    left: 12,
                    right: 12,
                    bottom: 12,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Source + Time + Likes + Comments
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 12,
                              backgroundImage: NetworkImage(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLO0WJbuUKRf9S7ptWIqRJl9EEal6mnsF8iA&s"
                              ),
                            ),
                            const SizedBox(width: 6),
                            const Text(
                              "Cnbc News",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Icon(Icons.access_time,
                                size: 14, color: Colors.white70),
                            const SizedBox(width: 4),
                            const Text(
                              "1h Ago",
                              style:
                              TextStyle(color: Colors.white70, fontSize: 12),
                            ),
                            const Spacer(),
                            const Icon(Icons.favorite_border,
                                size: 16, color: Colors.white70),
                            const SizedBox(width: 4),
                            const Text(
                              "5.2k",
                              style:
                              TextStyle(color: Colors.white70, fontSize: 12),
                            ),
                            const SizedBox(width: 12),
                            const Icon(Icons.comment_outlined,
                                size: 16, color: Colors.white70),
                            const SizedBox(width: 4),
                            const Text(
                              "23k",
                              style:
                              TextStyle(color: Colors.white70, fontSize: 12),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Scientist Just Found The Lost Species of Jellyfish\nThat Went Extinct 25 Million Years Ago!",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 40),

            /// Treading right now
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Treading right now",
                    style: mTextStyle20(mFontWeight: FontWeight.bold)),
                Text("See all", style: mTextStyle14(textColor: Colors.blue)),
              ],
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    margin: EdgeInsets.all(5),
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 200, 240, 250),
                        borderRadius:  BorderRadius.circular(12)),
                    child: Center(child: Text("All")),
                  ),
                   Container(
                     margin: EdgeInsets.all(5),
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 200, 240, 250),
                        borderRadius:  BorderRadius.circular(12)),
                    child: Center(child: Text("All")),
                  ), Container(
                    margin: EdgeInsets.all(5),
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 200, 240, 250),
                        borderRadius:  BorderRadius.circular(12)),
                    child: Center(child: Text("All")),
                  ),
                   Container(
                     margin: EdgeInsets.all(5),
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 200, 240, 250),
                        borderRadius:  BorderRadius.circular(12)),
                    child: Center(child: Text("All")),
                  ), Container(
                    margin: EdgeInsets.all(5),
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 200, 240, 250),
                        borderRadius:  BorderRadius.circular(12)),
                    child: Center(child: Text("All")),
                  ),
                   Container(
                     margin: EdgeInsets.all(5),
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 200, 240, 250),
                        borderRadius:  BorderRadius.circular(12)),
                    child: Center(child: Text("All")),
                  ), Container(
                    margin: EdgeInsets.all(5),
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 200, 240, 250),
                        borderRadius:  BorderRadius.circular(12)),
                    child: Center(child: Text("All")),
                  ),
                   Container(
                     margin: EdgeInsets.all(5),
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 200, 240, 250),
                        borderRadius:  BorderRadius.circular(12)),
                    child: Center(child: Text("All")),
                  ),
                   
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                // scrollDirection: Axis.horizontal,
                // itemCount: hotelsDetels.length,
                itemBuilder: (context, index){
                  var hotel=hotelsDetels[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      // width: double.infinity,
                      height: 160,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(image: NetworkImage(hotel['img']),fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.green,
                                  ),
                                ),
                                Positioned(
                                    left: 10,top: 10,
                                    child: Container(
                                      height: 20,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          borderRadius:BorderRadius.circular(10),
                                          color: Colors.red
                                      ),
                                      child: Center(
                                        child: Text(hotel['offer'],style: TextStyle(
                                            fontFamily: 'PMediums',
                                            color: Colors.white
                                        ),),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                          /// all list in the hotels
                          Expanded(
                              flex: 1,
                              child: InkWell(onTap: (){
                                // Navigator.push(context, MaterialPageRoute(builder: (context) =>HotelDetails( hotel:hotel),));
                              },
                                child: Stack(
                                  children: [
                                    Positioned(
                                        left: 8,
                                        top: 15,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(hotel['title'],style: TextStyle(
                                                fontFamily: 'PSemiBolds',
                                                fontSize:14

                                            ),),
                                            Row(
                                              children: [
                                                Icon(Icons.location_on,size: 15),
                                                Text(hotel['location'],style: TextStyle(
                                                    fontSize: 10
                                                ),)
                                              ],
                                            )

                                          ],
                                        )),

                                    Positioned(
                                        right: 2,
                                        top: 2,
                                        child: Card(
                                          child: Row(
                                            children: [
                                              Icon(Icons.star,color: Colors.yellow,),
                                              Text(hotel['rating'],style: TextStyle(
                                                  fontSize:14
                                              ),)
                                            ],
                                          ),
                                        )),

                                    Positioned(
                                        left: 8,
                                        top: 80,
                                        child: Column(
                                          children: [
                                            Text(hotel['price']??'N/A',
                                              style: TextStyle(
                                                  fontFamily: 'PSemiBolds',
                                                  fontSize:12
                                              ),)
                                          ],
                                        )),
                                    Positioned(
                                        left: 8,
                                        bottom: 25,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            SizedBox(
                                              height: 20,
                                              width: 250,
                                              child: ListView.builder(
                                                scrollDirection: Axis.horizontal,
                                                itemCount: hotel['amenities'].length,
                                                itemBuilder: (context, index) {
                                                  return Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                                    child: Container(
                                                      height: 20,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white
                                                      ),
                                                      child: Text(hotel['amenities'][index]),
                                                    ),
                                                  );
                                                },),
                                            )
                                          ],
                                        )
                                    ),

                                  ],
                                ),
                              )
                          )
                        ],
                      ),
                    ),
                  );
                },),
            )

          ],
        ),
      ),
    );
  }

  /// Helper Widget for Tags (Moved outside build method)
  Widget _buildTag(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color, width: 1),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
