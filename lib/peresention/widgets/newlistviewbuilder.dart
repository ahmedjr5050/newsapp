import 'package:flutter/material.dart';
import 'package:testbloc/data/models/articale/articale.dart';
// cached network image
class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.articleModel});
  final List<Articale> articleModel;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(
                  'https://images.unsplash.com/photo-1532074205216-d0e1f4b87368?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fGluc3RhZ3JhbSUyMHByb2ZpbGUlMjBzYW1lJTIwc2l6ZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&&q=60',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )),
            const SizedBox(
              height: 12,
            ),
            Text(
             " Article().title ?? ''",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "articleModel.subTitle ?? ''",
              maxLines: 2,
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            )
          ],
        );
      },
    );
  }
}
