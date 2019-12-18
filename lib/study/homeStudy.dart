import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class homeStudy extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class Menu {
  String title;
  IconData icon;

  Menu({this.title, this.icon});
}

List<Menu> menuItems = [
  Menu(title: "Dashboard", icon: Icons.dashboard),
  Menu(title: "Notifications", icon: Icons.notification_important),
  Menu(title: "Web UI", icon: Icons.web),
  Menu(title: "Charts", icon: Icons.insert_chart),
];

class _homeState extends State<homeStudy>{

  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;
    print(_media);

    Widget sideBarMenu = Container(
      width: 200,
      decoration: BoxDecoration(boxShadow: [
              BoxShadow(blurRadius: 10,color: Colors.black12,spreadRadius: 2)
            ],
            color: Color(0xFF272D34)
          ),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              //头像部分
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://backgrounddownload.com/wp-content/uploads/2018/09/google-material-design-background-6.jpg"),
                    fit: BoxFit.cover
                  )
                ),
                child: Container(
                    padding: EdgeInsets.all(5),
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRI4JuatGP6M5_Q0wYSkx2jAVzJff1FBaPYXV7zFbMngh5RV6J7"),
                            backgroundColor: Colors.white,
                            radius:30,
                          ),
                          SizedBox(
                            width:20,
                          ),

                              Text(
                                "LIYING",
                                style: TextStyle(color: Colors.white70, fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Spacer(),
                    Text(
                        "liying",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                    Text(
                        "liying@gmail.com",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),

                    ],
                  ),
                ),
              ),

              SizedBox(height: 80,),
              Expanded(
                child: ListView.separated(
                    itemBuilder: (BuildContext context,int index){
                      return InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.transparent,
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                          margin: EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.kitchen,
                                color: Colors.white30,
                                size: 38,
                              ),
                              SizedBox(width: 10,),
                                Text("name",
                                  style:TextStyle(color: Colors.white70, fontSize: 18, fontWeight: FontWeight.bold) ,
                                )

                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context,counter){
                      return Divider(
                        height: 2,
                      );
                    },
                    itemCount: menuItems.length
                ),
              ),

            ],
          ),
    );

    return Material(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          sideBarMenu,
          Flexible(   //和Expanded一样都有填充可用空间的能力，Expanded会填充剩余的所有空间
            fit: FlexFit.loose,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 55,
                  width: _media.width,
                  child: AppBar(
                    elevation: 4,
                    centerTitle: true,
                    title: Text(
                      "flutter demo",
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Color(0xFF272D34),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
