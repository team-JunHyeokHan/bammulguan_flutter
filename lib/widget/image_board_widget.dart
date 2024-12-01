import 'dart:io';

import 'package:flutter/material.dart';

class ImageBoardWidget extends StatefulWidget {
  final String title;
  final String content;
  final String file;

  const ImageBoardWidget({
    super.key,
    required this.title,
    required this.content,
    required this.file,
  });

  @override
  State<ImageBoardWidget> createState() => _ImageBoardWidgetState();
}

class _ImageBoardWidgetState extends State<ImageBoardWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;
  bool _isExpanded = false;
  final GlobalKey _contentKey = GlobalKey();
  double _contentHeight = 0.0;

  @override
  void initState() {
    super.initState();

    // Animation Controller
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    // Initial Slide Animation (placeholders)
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: const Offset(0, 0), // Temporary value, updated dynamically
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    // Fade Animation
    _fadeAnimation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Measure content height after the first frame
      final RenderBox? contentBox =
      _contentKey.currentContext?.findRenderObject() as RenderBox?;
      if (contentBox != null) {
        setState(() {
          _contentHeight = contentBox.size.height + 20; // Add 20 for padding
          // Update Slide Animation dynamically
          _slideAnimation = Tween<Offset>(
            begin: const Offset(0, 1),
            end: Offset(0, -_contentHeight / MediaQuery.of(context).size.height),
          ).animate(CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOut,
          ));
        });
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    double screenHeight = MediaQuery.of(context).size.height;

    String truncatedContent = widget.content.length > 20
        ? '${widget.content.substring(0, 20)}...'
        : widget.content;

    return Stack(
      children: [
        // Background image
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: screenHeight - 80,
            width: double.infinity,
            child: Image.network(
              widget.file,
              fit: BoxFit.cover,
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeTransition(
                opacity: _fadeAnimation,
                child: Text(
                  widget.title,
                  style: textTheme.titleLarge?.copyWith(color: Colors.white),
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                    if (_isExpanded) {
                      _animationController.forward();
                    } else {
                      _animationController.reverse();
                    }
                  });
                },
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      truncatedContent,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return SlideTransition(
              position: _slideAnimation,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  key: _contentKey,
                  padding: const EdgeInsets.all(20),
                  child: GestureDetector(
                    onTap: () {
                      _animationController.reverse();
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: textTheme.titleLarge?.copyWith(color: Colors.white),
                          textAlign: TextAlign.right,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          widget.content,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
