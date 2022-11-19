import 'package:formulariologin/providers/Proy_provider_inpa.dart';
import 'package:flutter/material.dart';

class ListViewWidget extends StatelessWidget {
  final UserProduct userProvider;
  const ListViewWidget({@required this.userProvider, Key? key}): super(key: key);
  @override
  _ListViewWidgetState createState()=> _ListViewWidgetState();
}
class _ListViewWidgetState extends State<ListViewWidget>{
  final scrollController = ScrollController();
@override
  void initState(){
  super.initState();
  scrollController.addListener(scrollListener);
  widget.userProvider.fetchNextUser();
}
@override
  void dispose(){
  scrollController.dispose();
  super.dispose();
}
void scrollListener(){
  if(scrollController.offset >= scrollController.position.maxScrollExtent / 2 &&
  !scrollController.position.outOfRange){
    if(widget.userProvider.hasNext){widget.userProvider.fetchNextUser();}
  }
}
@override
  Widget build(BuildContext context) => ListView(
  controller: scrollController,
  padding: EdgeInsets.all(12),
  children: [
    if(widget.userProvider.hasNext)
      Center(child: GestureDetector(
        onTap: widget.userProvider.fetchNextUser,
        child: Container(height: 25, width: 25, child: CircularProgressIndicator(),),
      ),),
  ],
);
}