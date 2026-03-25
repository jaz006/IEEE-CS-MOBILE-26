import 'package:flutter/material.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView( 
    child: Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width*0.88,
          height: MediaQuery.of(context).size.height*0.788,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey
          ),
          
          child: ListView.separated(itemBuilder: (context,index)=>
           ListTile(
            leading: IconButton(onPressed: (){},
             icon: Icon(Icons.check_box, color: Colors.white,),),
            title: Row(
              children: [
                Text('Go to gym',
                overflow: TextOverflow.ellipsis,
                 style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),),
                const Spacer(),
                IconButton(onPressed: (){}, icon: Icon(
                  Icons.archive,
                  color: Colors.white,
                ),),
                IconButton(onPressed: (){}, icon: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),),
              ],
            ),
            subtitle: Padding(
              padding: EdgeInsets.only(left: 20, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('6:30 pm', style: TextStyle(
                   color: Colors.white.withOpacity(0.5), fontSize: 17,
                  ),),
                  Text('Mar 29 2026', style: TextStyle(
                   color: Colors.white.withOpacity(0.5), fontSize: 17,
                  ),),
                ],
              ),
            ),
           ),
           separatorBuilder: (context,index)=>Divider(),
            itemCount: 5
            ),
        ),
      ],
    ), );
  }
}
