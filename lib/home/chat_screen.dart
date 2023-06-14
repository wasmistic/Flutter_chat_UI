import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/appColor/app_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../common/text_widget.dart';
import '../modal/app_modal.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  List<String> Text=['Messages','Online','Group'];
  List<VerticalList> verticalData = generateVerticalChatList();
  List<NameChatList> NameData = generateNameList();
  int SelectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      body: Container(
        color: AppColor.App_Bg,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Positioned(
                child:_buildTop()
            ),
            Positioned(
              top: 90.h,
                child: _buildTapOption()
            ),
            Positioned(
              top: 140.h,
                child: _buildFavorContact()
            ),
            Positioned(
              left: 0,
                right: 0,
                bottom: 0,
                top: 300.h,
                child:  _buildGroupChat()
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: SizedBox(
        height:60.h,
        width:60.w,
        child: FloatingActionButton(
          onPressed: () {
            _globalKey.currentState?.openDrawer();
          },
          backgroundColor: AppColor.App_primary,
          child: Icon(Icons.edit,size: 30.sp,color: Colors.white,),
        ),
      ),
      drawer: Container(
        height: MediaQuery.of(context).size.height,
        width: 260.w,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30.r),
            bottomRight: Radius.circular(30.r)
          ),
          boxShadow: [
            BoxShadow(
              spreadRadius: 5,
              blurRadius: 5,
              offset: Offset(1,1)
            )
          ]
        ),
        child: Drawer(
          backgroundColor: AppColor.App_Bg,
          child:Container(
            padding: EdgeInsets.only(left:15.w, right: 15.h, top: 45.h),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.arrow_back_ios_new_rounded, size: 20.sp,color: Colors.white,),
                    AppText(text: 'Settings', size: 20.sp, weight:FontWeight.bold)
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top:60.h,bottom: 40.h),
                  child: Row(
                    children: [
                      Container(
                        width: 60.w,
                        height:60.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColor.App_primary,
                            width: 3
                          ),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/me.jpg')
                          )
                        ),
                      ),
                      SizedBox(width:20.w,),
                      AppText(text: 'Afolabi  J', size: 18.sp, weight:FontWeight.w800,)
                    ],
                  ),
                ),
                _buildDrawerRowList(Icons.key,'Account'),
                _buildDrawerRowList(Icons.chat,'Chats'),
                _buildDrawerRowList(Icons.notifications,'Notification'),
                _buildDrawerRowList(Icons.storage,'Data and Storage'),
                _buildDrawerRowList(Icons.help,'Help'),
                Divider(
                  color: Colors.grey.withOpacity(0.4),
                  thickness: 2,
                ),
                SizedBox(height: 20.h,),
                _buildDrawerRowList(Icons.group_sharp,'Invite a friend'),
                Expanded(child: Container()),
                _buildDrawerRowList(Icons.logout_sharp,'Log Out'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildTop(){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40.h,
      margin: EdgeInsets.only(top:40.h),
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: (){
              _globalKey.currentState?.openDrawer();
            },
            child: Icon(Icons.menu_sharp, size: 30.sp, color: Colors.white,),
          ),
          Icon(Icons.search,size: 30.sp,color: Colors.white,)
        ],
      ),
    );
  }
  _buildTapOption(){
    return Container(
      padding: EdgeInsets.only(left: 20.w),
      width: MediaQuery.of(context).size.width,
      height: 30.h,
      child: ListView.separated(
        padding: EdgeInsets.zero,
         scrollDirection: Axis.horizontal,
          physics:BouncingScrollPhysics(),
          itemBuilder:(_,index){
            return GestureDetector(
              onTap: (){
                setState(() {
                  SelectedIndex=index;
                });
              },
              child: AppText(
                text: Text[index],size: 20.sp,weight: FontWeight.w600, textColor: SelectedIndex==index? Colors.white : Colors.grey.withOpacity(0.7),
              ),
            );
          },
          separatorBuilder:(context, index) => SizedBox(width: 50.w,),
          itemCount: 3),
    );
  }
  _buildFavorContact(){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200.h,
      decoration: BoxDecoration(
        color: AppColor.App_primary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35.r),
          topRight: Radius.circular(35.r)
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 10.h,
              child:Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left: 20.w, right: 15.w, top:10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(text: 'Favourite Contacts', size:14.sp, weight:FontWeight.w700),
                    Icon(Icons.more_horiz_sharp,color: Colors.white,size: 18.sp,)
                  ],
                ),
              )
          ),
          Positioned(
            top: 50.h,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 90.h,
                // color: Colors.purple,
                padding: EdgeInsets.only(left: 20.w),
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    itemBuilder:(_,index){
                    return _buildHorizList(
                      NameData[index].img.toString(),
                      NameData[index].name.toString(),
                    );
                    },
                    separatorBuilder: (context,index)=>SizedBox(width: 0.w,),
                    itemCount:NameData.length),
              )
          ),
        ],
      ),
    );
  }
  _buildGroupChat(){
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(top:25.h),
      decoration: BoxDecoration(
        color:Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35.r),
            topRight: Radius.circular(35.r)
        ),
      ),
      child: ListView.builder(
        padding: EdgeInsets.zero,
          physics: BouncingScrollPhysics(),
          itemCount:verticalData.length,
          itemBuilder:(_,index){
          return _buildVerticalList(
              verticalData[index].img.toString(),
              verticalData[index].to.toString(),
              verticalData[index].from.toString(),
              verticalData[index].min.toString(),
              verticalData[index].chat!.toInt(),
          );
          }
      ),
    );
  }

  _buildVerticalList(String img, String to, String from, String min, int chat){
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical:3.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 260.w,
            child: Row(
              children: [
                Container(
                  width: 65.w,
                  height: 65.h,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/'+img),
                      )
                  ),
                ),
                SizedBox(width:8.w,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(text: to, size: 14.sp, weight:FontWeight.w400, textColor: Colors.grey,),
                    SizedBox(height:5.w,),
                    AppText(text: from, size: 16.sp, weight:FontWeight.bold, textColor: Colors.black,)
                  ],
                )
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AppText(text: min, size:11.sp, weight: FontWeight.w500, textColor: Colors.black54,),
              SizedBox(height:5.w,),
             chat < 1 ? Container() :  Container(
               width: 15.w,
               height: 15.h,
               decoration: BoxDecoration(
                   color: AppColor.App_primary,
                   shape: BoxShape.circle
               ),
               child: Center(
                 child: AppText(text: chat.toString(), size: 10.sp, weight: FontWeight.w500,),
               ),
             )
            ],
          )
        ],
      ),
    );
  }
  _buildHorizList(String img, String name,){
    return Container(
      width: 100.w,
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 65.w,
            height: 65.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  color: Colors.white,
                  width:3,
                  style: BorderStyle.solid
              ),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image:AssetImage('assets/images/'+img)
              ),
            ),
          ),
          SizedBox(height: 6.h,),
          AppText(text: name, size: 14.sp, weight:FontWeight.normal)
        ],
      ),
    );
  }

  _buildDrawerRowList(IconData icon, String name){
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(bottom: 25.h),
      child: Row(
        children: [
          Icon(icon, size: 20.sp, color: Colors.white,),
          SizedBox(width:50.w,),
          AppText(text: name, size: 16.sp, weight:FontWeight.w700)
        ],
      ),
    );
  }
}
