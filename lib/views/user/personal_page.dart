import 'package:flutter/material.dart';
import 'package:flutter_dmzj/app/app_theme.dart';
import 'package:flutter_dmzj/app/user_info.dart';
import 'package:flutter_dmzj/app/utils.dart';
import 'package:provider/provider.dart';

class PersonalPage extends StatefulWidget {
  PersonalPage({Key key}) : super(key: key);

  @override
  _PersonalPageState createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          // Provider.of<AppUserInfo>(context, listen: false).isLogin
          //     ? InkWell(
          //         onTap: () => Navigator.pushNamed(context, "/User"),
          //         child: UserAccountsDrawerHeader(
          //           currentAccountPicture: CircleAvatar(
          //             backgroundImage: NetworkImage(
          //               Provider.of<AppUserInfo>(context).loginInfo.photo,
          //               headers: {"Referer": "http://www.dmzj.com/"},
          //             ),
          //           ),
          //           accountName: InkWell(
          //             child: Text(
          //               Provider.of<AppUserInfo>(context).loginInfo.nickname,
          //               style: TextStyle(fontWeight: FontWeight.bold),
          //             ),
          //           ),
          //           accountEmail: Text(Provider.of<AppUserInfo>(context)
          //                   .userProfile
          //                   ?.description ??
          //               ""),
          //           // decoration: BoxDecoration(
          //           //     image: DecorationImage(
          //           //   image: AssetImage("assets/img_ucenter_def_bac.jpg"),
          //           //   fit: BoxFit.cover,
          //           //   //colorFilter: ColorFilter.mode(Theme.of(context).accentColor.withOpacity(0.4), BlendMode.colorBurn)
          //           // )),
          //         ),
          //       )
          //     : InkWell(
          //         onTap: () => Navigator.pushNamed(context, "/Login"),
          //         child: UserAccountsDrawerHeader(
          //           currentAccountPicture: CircleAvatar(
          //             child: Icon(Icons.account_circle),
          //           ),
          //           accountName: InkWell(
          //             child: Text(
          //               "????????????",
          //               style: TextStyle(fontWeight: FontWeight.bold),
          //             ),
          //           ),
          //           accountEmail: Text("???????????????????????????"),
          //         ),
          //       ),
          Stack(
            children: <Widget>[
              Image.asset(
                "assets/img_ucenter_def_bac.jpg",
                fit: BoxFit.cover,
                height: 240,
                width: MediaQuery.of(context).size.width,
              ),
              Positioned(
                  child: Container(
                width: MediaQuery.of(context).size.width,
                height: 240,
                padding:
                    EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Theme.of(context).accentColor.withOpacity(1),
                      Theme.of(context).accentColor.withOpacity(0.1)
                    ],
                  ),
                ),
                child: Provider.of<AppUserInfo>(context).isLogin
                    ? InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                    title: Text("????????????"),
                                    content: Text("?????????????????????????"),
                                    actions: <Widget>[
                                      new FlatButton(
                                        child: new Text("??????"),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      new FlatButton(
                                        child: new Text("??????"),
                                        onPressed: () {
                                          Provider.of<AppUserInfo>(context,
                                                  listen: false)
                                              .logout();
                                          Navigator.of(context).pop();
                                        },
                                      )
                                    ],
                                  ));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 64,
                              height: 64,
                              child: CircleAvatar(
                                radius: 32,
                                backgroundImage:
                                    Utils.createCachedImageProvider(
                                        Provider.of<AppUserInfo>(context)
                                            .loginInfo
                                            .photo),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              Provider.of<AppUserInfo>(context)
                                  .loginInfo
                                  .nickname,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              Provider.of<AppUserInfo>(context)
                                      .userProfile
                                      ?.description ??
                                  "",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ],
                        ),
                      )
                    : InkWell(
                        onTap: () => Navigator.pushNamed(context, "/Login"),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 64,
                              height: 64,
                              child: CircleAvatar(
                                child: Icon(Icons.account_circle),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "????????????",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
              ))
            ],
          ),
          Material(
            color: Theme.of(context).cardColor,
            child: Column(
              children: <Widget>[
                // ListTile(
                //   title: Text("????????????"),
                //   leading: Icon(Icons.email),
                //   trailing: Icon(Icons.chevron_right, color: Colors.grey),
                //   onTap: () => {},
                // ),
                ListTile(
                  title: Text("????????????"),
                  leading: Icon(Icons.favorite),
                  trailing: Icon(Icons.chevron_right, color: Colors.grey),
                  onTap: () => Utils.openSubscribePage(context),
                ),
                ListTile(
                  title: Text("????????????"),
                  leading: Icon(Icons.history),
                  trailing: Icon(Icons.chevron_right, color: Colors.grey),
                  onTap: () => Utils.openHistoryPage(context),
                ),
                ListTile(
                  title: Text("????????????"),
                  leading: Icon(Icons.comment),
                  trailing: Icon(Icons.chevron_right, color: Colors.grey),
                  onTap: () => Utils.openMyCommentPage(context),
                ),
                ListTile(
                  title: Text("????????????"),
                  trailing: Icon(Icons.chevron_right, color: Colors.grey),
                  leading: Icon(Icons.file_download),
                  onTap: () => {},
                ),
              ],
            ),
          ),

          SizedBox(
            height: 12,
          ),
          Material(
            color: Theme.of(context).cardColor,
            child: Column(children: <Widget>[
              ListTile(
                title: Text("????????????"),
                leading: Icon(Icons.brightness_4),
                trailing: Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    Provider.of<AppTheme>(context).themeModeName,
                    style: TextStyle(fontSize: 14.0, color: Colors.grey),
                  ),
                ),
                onTap: () => Provider.of<AppTheme>(context, listen: false)
                    .showThemeModeDialog(
                  context,
                ),
              ),
              ListTile(
                title: Text("??????"),
                leading: Icon(Icons.settings),
                trailing: Icon(Icons.chevron_right, color: Colors.grey),
                onTap: () {
                  Navigator.pushNamed(context, "/Setting");
                },
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
