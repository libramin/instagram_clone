import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/screen_size.dart';
import 'package:instagram_clone/widget/rounded_avatar.dart';
import '../constants/common_size.dart';

class ProfileBody extends StatefulWidget {
  ProfileBody({Key? key, required this.onMenuChanged}) : super(key: key);

  Function onMenuChanged;

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody>
    with SingleTickerProviderStateMixin {
  SelectedTab _selectedTab = SelectedTab.left;
  late AnimationController _iconAnimationController;

  @override
  void initState() {
    _iconAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    super.initState();
  }

  @override
  void dispose() {
    _iconAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _appBar(),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate([
                    _userContent(),
                    _userBio(),
                    _editProfileBtn(),
                    _tapBtns(),
                    _selectedIndicator(),
                  ]),
                ),
                _imagesPager(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row _appBar() {
    return Row(
      children: [
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(
            'username',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
          ),
        ),
        IconButton(
            onPressed: () {
              widget.onMenuChanged();
              _iconAnimationController.status == AnimationStatus.completed
                  ? _iconAnimationController.reverse()
                  : _iconAnimationController.forward();
            },
            icon: AnimatedIcon(
              icon: AnimatedIcons.menu_close,
              progress: _iconAnimationController,
            ))
      ],
    );
  }

  Row _userContent() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(common_gap),
          child: profileAvatar(size: 70),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: common_gap),
            child: Table(
              children: [
                TableRow(children: [
                  _valueText('23459'),
                  _valueText('234'),
                  _valueText('19'),
                ]),
                TableRow(children: [
                  _lableText('게시물'),
                  _lableText('팔로워'),
                  _lableText('팔로잉'),
                ])
              ],
            ),
          ),
        )
      ],
    );
  }

  Text _valueText(String value) => Text(
        value,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        textAlign: TextAlign.center,
      );

  Text _lableText(String label) => Text(
        label,
        style: TextStyle(fontWeight: FontWeight.w300, fontSize: 13),
        textAlign: TextAlign.center,
      );

  SliverGrid _imagesPager() {
    return SliverGrid(
        delegate: SliverChildListDelegate(List.generate(
            30,
            (index) => CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: 'http://picsum.photos/id/$index/100/100'))),
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3));
  }

  Widget _selectedIndicator() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
      alignment: _selectedTab == SelectedTab.left
          ? Alignment.centerLeft
          : Alignment.centerRight,
      child: Container(
        height: 3,
        width: size!.width / 2,
        color: Colors.black87,
      ),
    );
  }

  Row _tapBtns() {
    return Row(
      children: [
        Expanded(
          child: IconButton(
              onPressed: () {
                setState(() {
                  _selectedTab = SelectedTab.left;
                });
              },
              icon: ImageIcon(
                AssetImage('assets/images/grid.png'),
                color: _selectedTab == SelectedTab.left
                    ? Colors.black
                    : Colors.black26,
              )),
        ),
        Expanded(
          child: IconButton(
              onPressed: () {
                setState(() {
                  _selectedTab = SelectedTab.right;
                });
              },
              icon: ImageIcon(
                AssetImage('assets/images/saved.png'),
                color: _selectedTab == SelectedTab.right
                    ? Colors.black
                    : Colors.black26,
              )),
        ),
      ],
    );
  }

  Padding _editProfileBtn() {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: common_gap, vertical: common_xxs_gap),
      child: SizedBox(
        height: 28,
        child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.black45),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6))),
            child: Text(
              '프로필 편집',
              style:
                  TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
            )),
      ),
    );
  }

  Widget _userBio() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: common_gap),
      child: Text('my name is user~!'),
    );
  }
}

enum SelectedTab { left, right }
