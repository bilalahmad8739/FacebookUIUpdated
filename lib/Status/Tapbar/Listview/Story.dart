import 'package:flutter/material.dart';

class Story extends StatelessWidget {
  const Story({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List images = [
      "https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
      "https://images.unsplash.com/photo-1548449112-96a38a643324?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
      "https://img.freepik.com/free-photo/smiling-happy-boy-pointing-fingers-up-copyspace_171337-16394.jpg?w=900&t=st=1667660330~exp=1667660930~hmac=46f3e8294fb062e493e2cfc22c44c5690ce0b32393475900b629fee75ab65442",
      "https://plus.unsplash.com/premium_photo-1665461700517-951fecc5c287?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80",
      "https://images.unsplash.com/photo-1615109398623-88346a601842?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
      "https://media.istockphoto.com/id/685132245/photo/mature-businessman-smiling-over-white-background.jpg?s=612x612&w=is&k=20&c=7XA0IU75Nj9vJWe4cSUvfq3QM9PKjbDEC9iyPX9mH6A=",
    ];
    return Scaffold(
      body: Container(
        height: 170,
        width: 370,

        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),

        // color: Colors.blue,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: images.length,
          itemBuilder: (Buildcontext, int index) {
            return Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Image.network(
                    images[index],
                    // height: 100,
                    width: 100,
                    height: 160,
                    fit: BoxFit.fitHeight,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
