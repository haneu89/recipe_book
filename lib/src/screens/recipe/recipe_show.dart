import 'package:flutter/material.dart';
import 'package:recipe_book/src/resources/comment_fire_resource.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../widgets/ui_elements/ui_element.dart';
import '../../widgets/ui_elements/elements.dart';

import '../../widgets/ui_elements/comment_bar.dart';
import '../../resources/recipe_fire_resource.dart';
import '../../resources/favorite_fire_resource.dart';

class RecipeShow extends StatefulWidget {
  final String recipeId;

  RecipeShow(this.recipeId);

  @override
  _RecipeShowState createState() => _RecipeShowState();
}

class _RecipeShowState extends State<RecipeShow> {
  RecipeFireResource resource = RecipeFireResource();
  CommentFireResource commentResource = CommentFireResource();
  FavoriteFireResource favoriteResource = FavoriteFireResource();
  final _commentContentController = TextEditingController();
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = new ScrollController();
    _scrollController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (builderContext, authSnapshot) {
        if (!authSnapshot.hasData) {
          return Spinner();
        }
        FirebaseUser user = authSnapshot.data;

        return StreamBuilder<DocumentSnapshot>(
            stream: resource.getItemOne(widget.recipeId),
            builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Spinner();
              }
              return StreamBuilder<DocumentSnapshot>(
                  stream: favoriteResource.getOwnFavorites(
                      widget.recipeId, user.uid),
                  builder:
                      (context, AsyncSnapshot<DocumentSnapshot> favSnapshot) {
                    if (!favSnapshot.hasData) {
                      return Spinner();
                    }
                    List favoritList = favSnapshot.data.data['favorits'] ?? [];
                    bool isAlreadyFav = favoritList.contains(user.uid);

                    return Scaffold(
                      body: Stack(
                        children: <Widget>[
                          NestedScrollView(
                            controller: _scrollController,
                            headerSliverBuilder: (BuildContext context,
                                bool innerBoxIsScrolled) {
                              return <Widget>[
                                SliverAppBar(
                                  expandedHeight: 300.0,
                                  floating: false,
                                  pinned: true,
                                  flexibleSpace: FlexibleSpaceBar(
                                      centerTitle: true,
                                      background: Image.network(
                                        snapshot.data['image'],
                                        fit: BoxFit.cover,
                                      )),
                                  actions: <Widget>[
                                    IconButton(
                                        onPressed: () {
                                          (isAlreadyFav)
                                              ? favoriteResource.removeFavorite(
                                                  widget.recipeId)
                                              : favoriteResource
                                                  .addFavorite(widget.recipeId);
                                        },
                                        icon: (isAlreadyFav)
                                            ? Icon(Icons.bookmark)
                                            : Icon(Icons.bookmark_border))
                                  ],
                                ),
                              ];
                            },
                            body: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Expanded(
                                  child: _buildCustomList(context, snapshot),
                                ),
                                CommentBar(() {
                                  _commentWrite(context);
                                }, _commentContentController),
                              ],
                            ),
                          ),
                          buildCap(context),
                        ],
                      ),
                    );
                  });
            });
      },
    );
  }

  Widget buildCap(context) {
    var size = MediaQuery.of(context).size;

    final double defaultTopMargin = 300.0 - 15;
    //pixels from top where scaling should start
    final double scaleStart = 60.0;
    //pixels from top where scaling should end
    final double scaleEnd = scaleStart / 2;

    double top = defaultTopMargin;
    double scale = 1.0;
    if (_scrollController.hasClients) {
      double offset = _scrollController.offset;
      top -= offset;
      if (offset < defaultTopMargin - scaleStart) {
        //offset small => don't scale down
        scale = 1.0;
      } else if (offset < defaultTopMargin - scaleEnd) {
        //offset between scaleStart and scaleEnd => scale down
        scale = (defaultTopMargin - scaleEnd - offset) / scaleEnd;
      } else {
        //offset passed scaleEnd => hide fab
        scale = 0.0;
      }
    }

    return Positioned(
      top: top,
      child: Transform(
        alignment: Alignment.bottomCenter,
        transform: Matrix4.identity()..scale(scale),
        child: Container(
          height: 40,
          width: size.width,
          decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              )),
        ),
      ),
    );
  }

  Widget _buildCustomList(context, snapshot) {
    final children = <Widget>[];
    children.add(_recipeDetail(snapshot));

    return StreamBuilder<QuerySnapshot>(
        stream: commentResource.getComments(widget.recipeId),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snap) {
          if (!snap.hasData) {
            return Spinner();
          }

          List<ListTile> commentList =
              snap.data.documents.map((DocumentSnapshot document) {
            return ListTile(
              title: Text('${document['name']}'),
              subtitle: Text('${document['content']}'),
            );
          }).toList();
          children.addAll(commentList);
          return ListView(
            children: children,
            padding: EdgeInsets.only(
              top: 0,
            ),
          );
        });
  }

  Widget _recipeDetail(snapshot) {
    return Container(
      color: Colors.black12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Panel(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  snapshot.data['title'],
                  textAlign: TextAlign.start,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
                Text(
                  snapshot.data['subtitle'],
                  textAlign: TextAlign.start,
                )
              ],
            ),
          ),
          Panel(
              child: Html(
            data: snapshot.data['content'],
          )),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }

  void _commentWrite(context) async {
    CommentModel comment = CommentModel.fromJson(
        {"target": widget.recipeId, 'content': _commentContentController.text});
    commentResource.createComment(comment);

    // 텍스트 제거
    _commentContentController.text = '';
    // Focus 해제
    FocusScope.of(context).requestFocus(new FocusNode());
  }
}
