import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

const MORedThemeColor = Color.fromRGBO(250, 75, 126, 1);

const MO47ThemeColor = Color.fromRGBO(47, 47, 47, 1);

const MO51ThemeColor = Color.fromRGBO(51, 51, 51, 1);

const MO61ThemeColor = Color.fromRGBO(61, 61, 61, 1);

const MO102ThemeColor = Color.fromRGBO(102, 102, 102, 1);

const MO153ThemeColor = Color.fromRGBO(153, 153, 153, 1);

const MO240ThemeColor = Color.fromRGBO(240, 240, 240, 1);

const MO249ThemeColor = Color.fromRGBO(249, 249, 249, 1);

typedef DialogAction = bool Function();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '欢迎来到超A超酷超帅超in的徐同学地带',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.pink,
      ),
      home: MyHomePage(title: '欢迎来到超A超酷超帅超in的徐同学地带'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isRight;
  void _incrementCounter() {
    showAlert(
        barrierDismissible: false,
        title: "热苏打今天真好看",
        sureTitle: "同意",
        cancelAction: () {
          _isRight = false;
          setState(() {});
          return true;
        },
        cancelTitle: "不同意",
        sureAction: () {
          _isRight = true;

          setState(() {});
          return true;
        });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Row(
          children: <Widget>[
            Text("欢迎来到超A超酷超帅超in的徐同学地带"),
            Icon(Icons.favorite_border),
          ],
        ),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _allWidgets,
        ),
      ),
      floatingActionButton: MaterialButton(
        color: Colors.pink,
        minWidth: 100,
        height: 50,
        child: Container(
          alignment: Alignment.center,
          child: Text(
            "try to tap?",
            style: TextStyle(color: Colors.white),
          ),
          width: 100,
          height: 50,
        ),
        onPressed: _incrementCounter,
      ),
    );
  }

  List<Widget> get _allWidgets {
    List<Widget> aList = [];
    aList.add(SizedBox(height: 50));

    if (_isRight == true) {
      aList.add(Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Container(
              alignment: Alignment.center,
              child: Text('答对啦',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )))));
      aList.add(SizedBox(height: 50));
    } else if (_isRight == false) {
      aList.add(Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Container(
              alignment: Alignment.center,
              child: Text('答错啦',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )))));

      aList.add(SizedBox(height: 50));
    }

    final aImage = Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Image.asset("images/IMG_0525.JPG"));
    aList.add(aImage);
    aList.add(SizedBox(height: 30));
    aList.add(Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Text(
            'hi, girl, \nhi, hot soda, \nhi, xiao xu, \nu deserve to be liked by the whole world.')));
    aList.add(SizedBox(height: 60));

    aList.add(Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Container(
            alignment: Alignment.centerRight,
            child: Text('Unfinished',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                )))));

    return aList;
  }

  /// 屏幕中央
  Future<T> showAlert<T>({
    bool barrierDismissible = true,
    String title,
    String content,
    String cancelTitle,
    String sureTitle,
    DialogAction cancelAction,
    DialogAction sureAction,
  }) {
    if (isEmpty(title) && isEmpty(content)) {
      return null;
    }

    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Stack(fit: StackFit.expand, children: <Widget>[
            Container(
              color: Color.fromRGBO(0, 0, 0, 0.5),
            ),
            GestureDetector(onTap: () {
              if (!barrierDismissible ||
                  (isEmpty(cancelTitle) && isEmpty(sureTitle))) {
                //【允许点击空白】 或 【无cancel和sure按钮】 时
                Navigator.pop(context);
              }
            }),
            _rowOfAlertView(title, content, cancelTitle, sureTitle, () {
              if (cancelAction != null) {
                bool shouldReturn = cancelAction();
                if (shouldReturn) Navigator.pop(context);
              } else {
                Navigator.pop(context);
              }
            }, () {
              if (sureAction != null) {
                bool shouldReturn = sureAction();
                if (shouldReturn) Navigator.pop(context);
              } else {
                Navigator.pop(context);
              }
            }),
          ]);
        });
  }

  Widget _rowOfAlertView(String title, String content, String cancelTitle,
      String sureTitle, Function() cancelAction, Function() sureAction) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 50,
          child: Container(),
        ),
        Expanded(
          flex: 275,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(3)),
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: _widgetsOfColumn(title, content, cancelTitle, sureTitle,
                  cancelAction, sureAction),
            ),
          ),
        ),
        Expanded(
          flex: 50,
          child: Container(),
        ),
      ],
    );
  }

  List<Widget> _widgetsOfColumn(
      String title,
      String content,
      String cancelTitle,
      String sureTitle,
      Function() cancelAction,
      Function() sureAction) {
    List<Widget> widgets = List();

    EdgeInsets titleInset = EdgeInsets.zero;
    EdgeInsets contentInset = EdgeInsets.zero;

    bool titleIsEmpty = isEmpty(title);
    bool contentIsEmpty = isEmpty(content);
    bool cancelTitleIsEmpty = isEmpty(cancelTitle);
    bool sureTitleIsEmpty = isEmpty(sureTitle);

    if (!titleIsEmpty && !contentIsEmpty) {
      titleInset = EdgeInsets.fromLTRB(15, 20, 15, 10);
      contentInset = EdgeInsets.fromLTRB(15, 0, 15, 20);
    } else {
      if (!titleIsEmpty) {
        titleInset = EdgeInsets.fromLTRB(15, 20, 15, 20);
      }
      if (!contentIsEmpty) {
        contentInset = EdgeInsets.fromLTRB(15, 20, 15, 20);
      }
    }

    if (!titleIsEmpty) {
      widgets.add(Container(
        padding: titleInset,
        child: Text(title,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: MO61ThemeColor,
                decoration: TextDecoration.none)),
      ));
    }

    if (!contentIsEmpty) {
      widgets.add(Container(
        padding: contentInset,
        child: Text(content,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 14,
                color: MO61ThemeColor,
                fontWeight: FontWeight.normal,
                decoration: TextDecoration.none)),
      ));
    }

    if (!cancelTitleIsEmpty || !sureTitleIsEmpty) {
      List<Widget> widgetsOfRow = List();

      if (!cancelTitleIsEmpty) {
        widgetsOfRow.add(Expanded(
            child: Container(
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(width: 1, color: MO240ThemeColor),
                        right: BorderSide(width: 1, color: MO240ThemeColor))),
                child: _buttonOfRowOfAlertView(
                    cancelTitle, MO153ThemeColor, cancelAction))));
      }

      if (!sureTitleIsEmpty) {
        widgetsOfRow.add(Expanded(
            child: Container(
          decoration: BoxDecoration(
              border:
                  Border(top: BorderSide(width: 1, color: MO240ThemeColor))),
          child:
              _buttonOfRowOfAlertView(sureTitle, MORedThemeColor, sureAction),
        )));
      }

      widgets.add(Row(
        children: widgetsOfRow,
      ));
    }

    return widgets;
  }

  Widget _buttonOfRowOfAlertView(String title, Color color, Function() func) {
    return CupertinoButton(
      borderRadius: BorderRadius.zero,
      padding: EdgeInsets.zero,
      child: Text(title,
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: color,
              decoration: TextDecoration.none)),
      onPressed: func,
    );
  }

  static bool isEmpty(String str) {
    if (str == null) {
      return true;
    }
    if (str.length <= 0) {
      return true;
    }

    return false;
  }
}
