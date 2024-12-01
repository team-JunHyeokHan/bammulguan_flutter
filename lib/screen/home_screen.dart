import 'dart:async';

import 'package:bammulguan/server_url.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:bammulguan/screen/background_screen.dart';
import 'package:bammulguan/widget/image_board_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;
  List<dynamic> posts = [];  // 서버에서 받아온 게시글들
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    fetchData();  // 서버에서 데이터 가져오기
    _startPeriodicUpdate();
    
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer.cancel();
  }

  // 3초마다 서버에서 데이터 새로 고침
  void _startPeriodicUpdate() {
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      print("asdfx");
      fetchData();  // 3초마다 fetchData 호출
    });
  }

  // 서버에서 데이터 가져오기
  Future<void> fetchData() async {
    try {
      final dio = Dio();
      final response = await dio.get("$SERVER_URL/board");  // 서버 URL

      if (response.statusCode == 200) {
        final data = response.data;

        setState(() {
          posts = data['data'];
          isLoading = false;
        });
      } else {
        print('서버 오류: ${response.statusCode}');
      }
    } catch (e) {
      print('데이터 가져오기 실패: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundScreen(
      child: SafeArea(
        child: isLoading
            ? Center(child: CircularProgressIndicator(
          color: Colors.white,
        ))  // 데이터 로딩 중
            : PageView.builder(
          itemCount: posts.length,  // 서버에서 받은 게시글 수만큼 페이지 생성
          itemBuilder: (context, index) {
            final post = posts[index];

            // 첫 번째 이미지 URL만 사용
            String imageUrl = post['imageUrl'] != null && post['imageUrl'].isNotEmpty
                ? post['imageUrl'][0]['url']
                : '';

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: imageUrl.isEmpty
                  ? textBoard(post['title'], post['content'], context)
                  : ImageBoardWidget(
                title: post['title'],
                content: post['content'],
                file: imageUrl,
              ),
            );
          },
          scrollDirection: Axis.vertical,  // 스와이프 방향을 수직으로 설정
        ),
      ),
    );
  }
  Widget textBoard(String title, String content, BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 120),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: textTheme.titleLarge),
          SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            child: Text(
              content,
              style: const TextStyle(fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
