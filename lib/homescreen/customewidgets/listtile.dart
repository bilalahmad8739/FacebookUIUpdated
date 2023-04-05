import 'package:flutter/material.dart';

class customelisttile extends StatelessWidget {
  const customelisttile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ListTile(
          leading: CircleAvatar(
              backgroundColor: Colors.amber,
              backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1548449112-96a38a643324?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80')),
          title: Text(
            'Bilal Ahmad',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20),
          ),
          subtitle: Text(
            'Suggested for you  19 h',
            style: TextStyle(color: Colors.black),
          ),
        ),
        Text(
            'The quick brown fox jumps over lazy dog.The quick brown fox jumps over lazy dog')
      ],
    );
  }
}
