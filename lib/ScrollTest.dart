import 'package:flutter/material.dart';
import 'package:laksmi_test/ScrollWithGlobalKey.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class ScrollTest extends StatefulWidget {
  @override
  _ScrollTestState createState() => _ScrollTestState();
}

class _ScrollTestState extends State<ScrollTest> {
  AutoScrollController _autoScrollController;
  final scrollDirection = Axis.vertical;
  bool isExpanded = true;
  @override
  initState() {
    autoScroll();
    super.initState();
  }

  bool get _isAppBarExpanded {
    return _autoScrollController.hasClients &&
        _autoScrollController.offset > (160 - kToolbarHeight);
  }

  autoScroll() {
    _autoScrollController = AutoScrollController(
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        axis: scrollDirection)
      ..addListener(() => _isAppBarExpanded
          ? isExpanded != false
              ? setState(() {
                  isExpanded = false;
                  print("Set State");
                })
              : {}
          : isExpanded != true
              ? setState(() {
                  print("set State");
                  isExpanded = true;
                })
              : {});
  }

  Future _scroolToIndex(int index) async {
    await _autoScrollController.scrollToIndex(index,
        preferPosition: AutoScrollPosition.begin);
    _autoScrollController.highlight(index);
  }

  Widget _wrapScrollTag({int index, Widget child}) {
    return AutoScrollTag(
      key: ValueKey(index),
      controller: _autoScrollController,
      index: index,
      child: child,
      highlightColor: Colors.black.withOpacity(0.1),
    );
  }

  Widget backgroundSliverAppBar() {
    return Container(
      height: 300,
      color: Colors.yellow,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: FlatButton(
            color: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ScrollWithGlobalKey())),
            child: Text("Other Scroll Method"),
          ),
        ),
      ),
    );
  }

  _buildSliverAppBar() {
    return SliverAppBar(
      brightness: Brightness.light,
      pinned: true,
      expandedHeight: 300.0,
      backgroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        background: backgroundSliverAppBar(),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(5),
        child: AnimatedOpacity(
          duration: Duration(milliseconds: 500),
          opacity: isExpanded ? 0.0 : 1,
          child: DefaultTabController(
            length: 3,
            child: TabBar(
                labelColor: Colors.black,
                onTap: (index) async {
                  _scroolToIndex(index);
                },
                tabs: [
                  Tab(
                    text: "Red",
                  ),
                  Tab(
                    text: "Blue",
                  ),
                  Tab(
                    text: "Green",
                  )
                ]),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _autoScrollController,
        slivers: <Widget>[
          _buildSliverAppBar(),
          SliverList(
              delegate: SliverChildListDelegate([
            _wrapScrollTag(
                index: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Container(
                    height: 500,
                    color: Colors.red,
                  ),
                )),
            _wrapScrollTag(
                index: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Container(
                    height: 500,
                    color: Colors.blue,
                  ),
                )),
            _wrapScrollTag(
                index: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Container(
                    height: 500,
                    color: Colors.green,
                  ),
                ))
          ]))
        ],
      ),
    );
  }
}
