import 'package:another_flushbar/flushbar_helper.dart';
import 'package:valorant_guide/constants/colors.dart';
import 'package:valorant_guide/models/agents/agent.dart';
import 'package:valorant_guide/stores/post/post_store.dart';
import 'package:valorant_guide/utils/locale/app_localization.dart';
import 'package:valorant_guide/widgets/progress_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'abilities_list_tile.dart';

class DetailScreen extends StatefulWidget {
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  //stores:---------------------------------------------------------------------

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final agent = ModalRoute.of(context)!.settings.arguments as AgentData;
    return Scaffold(
      body: _buildBody(agent),
    );
  }

  Widget _buildBody(AgentData agent) {
    return Stack(
      children: <Widget>[
        _buildMainContent(agent),
      ],
    );
  }

  Widget _buildMainContent(AgentData agent) {
    return Observer(
      builder: (context) {
        return Scaffold(backgroundColor: AppColors.background, body: _buildHomeView(agent));
      },
    );
  }

  Widget _buildHomeView(AgentData agent) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _topImage(agent),
          _biography(agent),
          _specialAbilities(agent),
        ],
      ),
    );
  }

  Widget _topImage(AgentData agent) {
    return Container(
      color: AppColors.gradientStartColor,
      height: 300.0,
      child: Stack(
        children: [
          Positioned(
            left: -64,
            top: -10,
            child: Container(
              width: double.maxFinite,
              height: MediaQuery.of(context).size.height * 0.5,
              child: Align(
                alignment: Alignment.centerLeft,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    agent.bustPortrait!,
                    color: Color.fromRGBO(255, 255, 255, 0.2),
                    colorBlendMode: BlendMode.modulate,
                  ),
                ),
              ),
            ),
          ),
          Positioned.fill(
            right: -50,
            bottom: -80,
            child: Align(
              alignment: Alignment.bottomRight,
              child: AspectRatio(
                aspectRatio: 0.75,
                child: Image.network(
                  agent.bustPortrait!,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 24.0, top: 48.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        agent.displayName.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.mainTextColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 32,
                          letterSpacing: 1.5,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                            color: AppColors.darkPurple,
                            // Set border width
                            borderRadius: BorderRadius.all(Radius.circular(8.0)), // Set rounded corner radius
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              agent.role!.displayName,
                              style: TextStyle(
                                color: AppColors.grey,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _biography(AgentData agent) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "// BIOGRAPHY",
            style: TextStyle(
              color: AppColors.mainTextColor,
              fontWeight: FontWeight.w600,
              fontSize: 14,
              letterSpacing: 2.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: Text(
              agent.description,
              style: TextStyle(
                color: AppColors.grey,
                fontSize: 12,
                letterSpacing: 2.0,
                height: 1.5,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _specialAbilities(AgentData agent) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "// SPECIAL ABILITIES",
            style: TextStyle(
              color: AppColors.mainTextColor,
              fontWeight: FontWeight.w600,
              fontSize: 14,
              letterSpacing: 2.0,
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: new NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(8),
              itemCount: agent.abilities.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
                  child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.detailListBackground,
                        // Set border width
                        borderRadius: BorderRadius.all(Radius.circular(8.0)), // Set rounded corner radius
                      ),
                      child: AbilitiesListTile(
                        abilities: agent.abilities[index],
                      )),
                );
              }),
        ],
      ),
    );
  }

  // General Methods:-----------------------------------------------------------
  _showErrorMessage(String message) {
    Future.delayed(Duration(milliseconds: 0), () {
      if (message.isNotEmpty) {
        FlushbarHelper.createError(
          message: message,
          title: AppLocalizations.of(context).translate('home_tv_error'),
          duration: Duration(seconds: 3),
        )..show(context);
      }
    });

    return SizedBox.shrink();
  }
}
