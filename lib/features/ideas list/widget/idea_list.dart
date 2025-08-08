import 'package:flutter/material.dart';
import 'package:the_startup_idea_evaluator/shared/my_app_bar.dart';

class IdeaList extends StatelessWidget {
  const IdeaList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Ideas List'),
      body: ListView.separated(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ExpansionTile(
                title: Text('my tile'),
                subtitle: Text('this is good'),
                children: [
                  Text(
                    'tyhis nksnkns vsdlnldsn nkjvnkjdsnv  kjsbnvkjbds ,m,bnv,mbsd kbm smbdvjsdbvm dsv,sdmbvm sdvksb vmnds vkjdbvmnds v,dsbvksbvkjndkmvndsklnv,dnvkldfnvkldnkldf',
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => Divider(),
      ),
    );
  }
}
