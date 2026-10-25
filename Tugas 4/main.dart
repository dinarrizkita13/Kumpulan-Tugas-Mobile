import 'package:flutter/material.dart';
import 'package:tugas_4/api_service.dart';
import 'package:tugas_4/article_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Berita',
      debugShowCheckedModeBanner: false,
      home: NewsScreen(),
    );
  }
}

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {

  late Future<List<Article>> articles;

  // Controller untuk mengatur posisi scroll
  final ScrollController _scrollController = ScrollController();
  // Menentukan apakah tombol "kembali ke atas" ditampilkan
  bool _showBackToTop = false;

  @override
  void initState(){
    super.initState();
    articles = ApiService().fetchArticles();

    _scrollController.addListener(() {
      final shouldShow = _scrollController.offset > 200;
      if (shouldShow != _showBackToTop) {
        setState(() {
          _showBackToTop = shouldShow;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // Fungsi untuk memuat ulang berita (pull-to-refresh)
  Future<void> _refreshArticles() async {
    setState(() {
      articles = ApiService().fetchArticles();
    });
    await articles;
  }

  // Fungsi untuk kembali ke atas
  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.newspaper),
        title: Text('Berita Terkini Wadidaw'),
        backgroundColor: Colors.red,
      ),
      floatingActionButton: _showBackToTop
          ? FloatingActionButton(
              onPressed: _scrollToTop,
              backgroundColor: Colors.red,
              child: const Icon(Icons.arrow_upward, color: Colors.white),
            )
          : null,
      body: FutureBuilder(
        future: articles, 
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          final data = snapshot.data ?? [];

          if(data.isEmpty) {
            return const Center (
              child: Text('Tidak ada berita.'),
            );
          }

          return RefreshIndicator(
            onRefresh: _refreshArticles,
            child: ListView.builder(
              controller: _scrollController,
              // Agar pull-to-refresh tetap bisa dipakai walau list pendek
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: data.length,
              itemBuilder: (context, index) {
                final article = data[index];

                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    leading: article.urlToImage != null ? 
                    Image.network(
                      article.urlToImage!, 
                      width: 80, 
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => const Icon(Icons.broken_image),
                    )
                    : const Icon(Icons.newspaper),
                    title: Text(article.judul),
                    subtitle: Text(
                      article.deskripsi ?? 'Tidak ada deskripsi',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
