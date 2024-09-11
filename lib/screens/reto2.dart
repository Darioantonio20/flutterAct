import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Reto2Screen extends StatefulWidget {
  const Reto2Screen({Key? key}) : super(key: key);

  @override
  _CatImageScreenState createState() => _CatImageScreenState();
}

class _CatImageScreenState extends State<Reto2Screen> {
  late Future<String> _catImageUrl;

  @override
  void initState() {
    super.initState();
    _catImageUrl = fetchCatImage();
  }

  Future<String> fetchCatImage() async {
    final response = await http.get(Uri.parse('https://api.thecatapi.com/v1/images/search'));

    if (response.statusCode == 200) {
      // Verificamos si la respuesta es un array antes de acceder al índice 0
      final List<dynamic> jsonResponse = json.decode(response.body);
      
      // Retornamos la URL de la imagen del primer elemento si existe
      if (jsonResponse.isNotEmpty) {
        return jsonResponse[0]['url'] as String;
      } else {
        throw Exception('No cat image found');
      }
    } else {
      throw Exception('Failed to load cat image');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Cat Image'),
      ),
      body: Center(
        child: FutureBuilder<String>(
          future: _catImageUrl,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return Image.network(snapshot.data ?? '');
            }
          },
        ),
      ),
    );
  }
}
