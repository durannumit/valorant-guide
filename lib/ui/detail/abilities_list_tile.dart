import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:valorant_guide/constants/colors.dart';
import 'package:valorant_guide/models/agents/agent.dart';

class AbilitiesListTile extends StatefulWidget {
  final Abilities abilities;

  AbilitiesListTile({required this.abilities});

  @override
  State<AbilitiesListTile> createState() => _AbilitiesListTileState();
}

class _AbilitiesListTileState extends State<AbilitiesListTile> {
  String icon = 'assets/images/Wallet.svg';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: CachedNetworkImage(
          imageUrl: widget.abilities.displayIcon ?? "http://via.placeholder.com/50x50",
          progressIndicatorBuilder: (context, url, downloadProgress) => CircularProgressIndicator(value: downloadProgress.progress),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: Text(
            widget.abilities.displayName,
            style: TextStyle(
              color: AppColors.mainTextColor,
              fontWeight: FontWeight.w600,
              fontSize: 14,
              letterSpacing: 2.0,
            ),
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            widget.abilities.description,
            style: TextStyle(
              color: AppColors.grey,
              fontSize: 12,
            ),
          ),
        ));
  }
}
