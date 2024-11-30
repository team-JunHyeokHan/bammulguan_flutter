import 'package:bammulguan/screen/image_post_screen.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    contentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.close_outlined,
                    color: Colors.white,
                    size: 36,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 100, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    minLines: 1,
                    maxLines: 1,
                    controller: titleController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "제목을 입력해주세요",
                      hintStyle: textTheme.headlineSmall,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: 60,
                    height: 3,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    child: TextField(
                      minLines: 1,
                      maxLines: 10,
                      controller: contentController,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                        hintText: "당신의 기억을 작성해 보세요.",
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                  onPressed: () {
                    print(titleController.text);
                    print(contentController.text);
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ImagePostScreen(
                              title: titleController.text,
                              content: contentController.text),
                        ),
                        ModalRoute.withName('/')
                    );
                  },
                  child: Text("다음"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    textStyle: textTheme.titleMedium,
                    minimumSize: Size(MediaQuery.of(context).size.width, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
