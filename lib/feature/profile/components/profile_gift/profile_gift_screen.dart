import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:piczzie/configuration/app_config.dart';
import 'package:piczzie/feature/profile/components/profile_gift/profile_gift_state.dart';
import 'package:piczzie/feature/profile/components/profile_gift/profile_gift_bloc.dart';
import 'package:piczzie/feature/profile/components/profile_gift/profile_gift_event.dart';
import 'package:piczzie/model/gift.dart';

class ProfileGift extends StatefulWidget {
  ProfileGift({Key key}) : super(key: key);

  @override
  _profileGiftState createState() => _profileGiftState();
}

class _profileGiftState extends State<ProfileGift>
    with AutomaticKeepAliveClientMixin {
  List<Gift> gifts = List<Gift>();
  ScrollController _scrollController =
  ScrollController(initialScrollOffset: 5.0, keepScrollOffset: false);
  bool _isLoadmore = false;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        builder: (context) => ProfileGiftBloc(),
        child: BlocBuilder<ProfileGiftBloc, ProfileGiftState>(
            builder: (context, state) {
              print(state);
              if (BlocProvider
                  .of<ProfileGiftBloc>(context)
                  .state
              is SuccessProfileGiftState) {
                SuccessProfileGiftState successProfileGiftState =
                BlocProvider
                    .of<ProfileGiftBloc>(context)
                    .state
                as SuccessProfileGiftState;
                if (successProfileGiftState.gifts.length > 0) {
                  gifts.addAll(successProfileGiftState.gifts);
                }
                BlocProvider.of<ProfileGiftBloc>(context)
                    .add(StopLoadMoreListEvent());
                _isLoadmore = true;
              } else if (BlocProvider
                  .of<ProfileGiftBloc>(context)
                  .state
              is InitialProfileGiftState) {
                _scrollController.addListener(() {
                  var triggerFetchMoreSize =
                      0.9 * _scrollController.position.maxScrollExtent;
                  if (_scrollController.offset > triggerFetchMoreSize) {
                    BlocProvider.of<ProfileGiftBloc>(context).add(
                        GetGiftProfileList(
                            "5c616ee79a63451852a492b6", gifts.length,
                            _isLoadmore));
                  }
                });
              }
              return Stack(
                children: <Widget>[
                  (BlocProvider
                      .of<ProfileGiftBloc>(context)
                      .state
                  is LoadingProfileGiftState && !_isLoadmore)
                      ? Center(
                    child: CircularProgressIndicator(strokeWidth: 2.0),
                  )
                      : SizedBox.shrink(),
                  CustomScrollView(
                    controller: _scrollController,
                    shrinkWrap: true,
                    slivers: <Widget>[
                      SliverGrid(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 2.0,
                          crossAxisSpacing: 2.0,
                        ),
                        delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                            return CachedNetworkImage(
                              imageUrl: AppConfig
                                  .of(context)
                                  .endpoint +
                                  gifts[index].image,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey,
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  AppConfig
                                                      .of(context)
                                                      .endpoint +
                                                      gifts[index].image)))),
                              placeholder: (context, url) => Icon(Icons.error),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            );
                          },
                          childCount: gifts.length,
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildListDelegate([
                          Column(
                            children: <Widget>[
                              //your widgets
                              (BlocProvider
                                  .of<ProfileGiftBloc>(context)
                                  .state
                              is LoadingProfileGiftState && _isLoadmore)
                                  ? Center(
                                child: Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2.0,
                                    )),
                              )
                                  : SizedBox.shrink()
                            ],
                          )
                        ]),
                      )
                    ],
                  )
                ],
              );
            }));
  }
}
