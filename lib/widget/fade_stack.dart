import 'package:flutter/material.dart';
import 'package:instagram_clone/widget/signin_form.dart';
import 'package:instagram_clone/widget/signup_form.dart';

class FadeStack extends StatefulWidget {
  FadeStack({Key? key, required this.selectedForm}) : super(key: key);

  int selectedForm;

  @override
  _FadeStackState createState() => _FadeStackState();
}

class _FadeStackState extends State<FadeStack>
    with SingleTickerProviderStateMixin {

  List<Widget> forms = [SignupForm(), SigninForm()];
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this,
        duration: Duration(milliseconds: 500));
    _animationController.forward();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant FadeStack oldWidget) {
    if(widget.selectedForm != oldWidget.selectedForm){
      _animationController.forward(from: 0.0);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animationController,
      child: IndexedStack(
        children: forms,
        index: widget.selectedForm,
      ),
    );
  }
}
