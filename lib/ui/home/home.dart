import 'package:another_flushbar/flushbar_helper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/svg.dart';
import 'package:valorant_guide/constants/colors.dart';
import 'package:valorant_guide/data/sharedpref/constants/preferences.dart';
import 'package:valorant_guide/utils/routes/routes.dart';
import 'package:valorant_guide/stores/language/language_store.dart';
import 'package:valorant_guide/stores/post/post_store.dart';
import 'package:valorant_guide/stores/theme/theme_store.dart';
import 'package:valorant_guide/utils/locale/app_localization.dart';
import 'package:valorant_guide/widgets/progress_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:material_dialog/material_dialog.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  //stores:---------------------------------------------------------------------
  late PostStore _postStore;
  late TabController tabController;

  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);

    tabController.addListener(() {
      setState(() {
        selectedIndex = tabController.index;
      });
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // initializing stores

    _postStore = Provider.of<PostStore>(context);

    // check to see if already called api
    if (!_postStore.loading) {
      _postStore.getAgents();
    }
  }

  List<Tab> tabs = <Tab>[
    Tab(
      height: 40,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          "Popular",
        ),
      ),
    ),
    Tab(
      height: 40,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          "New One",
        ),
      ),
    ),
    Tab(
      height: 40,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          "Trending",
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(child: _buildBody()),
    );
  }

  Widget _buildBody() {
    return Stack(
      children: <Widget>[
        _handleErrorMessage(),
        _buildMainContent(),
      ],
    );
  }

  Widget _buildMainContent() {
    return Observer(
      builder: (context) {
        return _postStore.loading ? CustomProgressIndicatorWidget() : _buildHomeView();
      },
    );
  }

  Widget _buildHomeView() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          children: [
            Center(
              child: Container(
                height: 64,
                width: 64,
                child: SvgPicture.asset('assets/icons/valorant_icon.svg'),
              ),
            ),
            Text(
              "Choose your \nawesome Agent",
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.mainTextColor, fontWeight: FontWeight.w600, fontSize: 32),
            ),
            tabSection(),
          ],
        ),
      ),
    );
  }

  Widget tabSection() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TabBar(
              labelStyle: TextStyle(fontSize: 16, fontFamily: 'ProductSans', color: Colors.white, fontWeight: FontWeight.bold),
              indicatorPadding: EdgeInsets.all(0.0),
              indicatorColor: AppColors.selectedTabColor,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
                  width: 2.0,
                  color: AppColors.selectedTabColor,
                ),
                insets: EdgeInsets.symmetric(horizontal: 50.0),
              ),
              labelPadding: EdgeInsets.only(left: 0.0, right: 0.0),
              labelColor: AppColors.selectedTabColor,
              unselectedLabelColor: Colors.grey,
              tabs: tabs,
              controller: tabController,
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                  tabController.animateTo(index);
                });
              },
            ),
            Observer(builder: (context) {
              if (_postStore.agentList != null) {
                return _postStore.agentList!.data.isNotEmpty
                    ? IndexedStack(
                        index: selectedIndex,
                        children: [
                          _gridCards(),
                          _gridCards(),
                          _gridCards(),
                        ],
                      )
                    : IndexedStack(
                        index: selectedIndex,
                        children: [
                          Container(),
                          Container(),
                          Container(),
                        ],
                      );
              } else {
                return CustomProgressIndicatorWidget();
              }
            }),
          ],
        ),
      ),
    );
  }

  Widget _gridCards() {
    return Observer(builder: (context) {
      return GridView.builder(
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.
        shrinkWrap: true,
        physics: new NeverScrollableScrollPhysics(),
        itemCount: _postStore.agentList!.data.length,
        // Generate 100 widgets that display their index in the List.
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 10,
          childAspectRatio: 0.8,
          crossAxisCount: 2,
        ),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, Routes.detail, arguments: _postStore.agentList!.data[index]);
            },
            child: Stack(
              children: [
                Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.01)
                    ..rotateY(-0.06)
                    ..rotateX(-0.1),
                  alignment: FractionalOffset.bottomLeft,
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            AppColors.gradientStartColor,
                            AppColors.gradientEndColor,
                          ],
                        ),
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20), bottomLeft: Radius.circular(20)),
                        color: Colors.purple),
                  ),
                ),
                _postStore.agentList!.data[index].fullPortrait != null
                    ? Align(
                        alignment: Alignment.bottomCenter,
                        child: CachedNetworkImage(
                          imageUrl: _postStore.agentList!.data[index].bustPortrait!,
                          progressIndicatorBuilder: (context, url, downloadProgress) => CircularProgressIndicator(value: downloadProgress.progress),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        ),
                      )
                    : Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: 65.0,
                          height: 65.0,
                          child: Icon(
                            Icons.person,
                            size: 36.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                Positioned(
                  left: 10,
                  bottom: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _postStore.agentList!.data[index].displayName,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.mainTextColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          letterSpacing: 2.0,
                        ),
                      ),
                      Text(
                        _postStore.agentList!.data[index].role != null ? _postStore.agentList!.data[index].role!.displayName : "",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: AppColors.mainTextColor, fontWeight: FontWeight.w600, fontSize: 10),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    });
  }

  Widget _handleErrorMessage() {
    return Observer(
      builder: (context) {
        if (_postStore.errorStore.errorMessage.isNotEmpty) {
          return _showErrorMessage(_postStore.errorStore.errorMessage);
        }

        return SizedBox.shrink();
      },
    );
  }

  // General Methods:-----------------------------------------------------------
  _showErrorMessage(String message) {
    Future.delayed(Duration(milliseconds: 0), () {
      if (message.isNotEmpty) {
        FlushbarHelper.createError(
          message: message,
          title: "Error",
          duration: Duration(seconds: 3),
        )..show(context);
      }
    });

    return SizedBox.shrink();
  }
}
