import 'package:flutter/material.dart';
import '../../auth/listview_model.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size mediaquery=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor:  const Color(0xff2f1440),
      appBar: AppBar(
        toolbarHeight: mediaquery.height*0.1,
        backgroundColor:  const Color(0xff2f1440),
        title: Text("Chats",
          style: TextStyle(
            color: Colors.white,
            fontSize: mediaquery.height*0.035,
          ),),
        actions: [
          Icon(Icons.settings,color: Colors.white,size: mediaquery.height*0.04,),
          SizedBox(width: mediaquery.width*0.02,)
        ],

      ),
      
      
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: mediaquery.width*0.05,),
              child: Text("Favorites Contact",style: TextStyle(
                color: Colors.white,
                fontSize: mediaquery.height*0.02,
              ),
              ),
            ),

            //--------------------------------------------horizontal listview
            SizedBox(height: mediaquery.height*0.02,),
            SizedBox(
              height: mediaquery.height*0.14,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: messageData.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(messageData[index].avatarUrl),
                              radius: mediaquery.height*0.04,
                            ),
                            CircleAvatar(
                              radius: mediaquery.height*0.015,
                              backgroundColor:  const Color(0xff2f1440),
                              child: CircleAvatar(
                                radius: mediaquery.height*0.01,
                                backgroundColor: Colors.green,
                              ),
                            )

                          ],
                        ),
                        SizedBox(height: mediaquery.height*0.01,),
                        Text(messageData[index].name,style: TextStyle(
                            color: Colors.white
                        ),),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(width: mediaquery.width*0.03,)
              ),
            ),
            SizedBox(height: 10,),


            //--------------------------------------------vertical listview
            Container(
              height: mediaquery.height*0.68,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding:  EdgeInsets.only(top: mediaquery.height*0.02),
                child: ListView.separated(
                    itemBuilder: (context, index) {
                    return   ListTile(
                      leading: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(messageData[index].avatarUrl),
                            radius: mediaquery.height*0.04,
                          ),
                          CircleAvatar(
                            radius: mediaquery.height*0.012,
                            backgroundColor:  Colors.white,
                            child: CircleAvatar(
                              radius: mediaquery.height*0.008,
                              backgroundColor: Colors.green,
                            ),
                          )

                        ],
                      ),
                      title: Text(messageData[index].name,style: TextStyle(fontSize: mediaquery.height*0.024,fontWeight: FontWeight.w600),),
                      subtitle: Text(messageData[index].message),
                      trailing: Text(messageData[index].time,style: TextStyle(fontSize: mediaquery.height*0.02),),
                    );
                    },
                    separatorBuilder: (context, index) => SizedBox(width: mediaquery.width*0.015,),
                    itemCount: messageData.length),
              ),
            )
          ],
        ),
      ),
    );
  }
}
