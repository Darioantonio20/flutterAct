import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.contact_page, color: Colors.black),
            onPressed: () {
              Navigator.pushNamed(context, '/contact');
            },
          ),
          IconButton(
            icon: const Icon(Icons.assignment, color: Colors.black),
            onPressed: () {
              Navigator.pushNamed(context, '/reto1');
            },
          ),
          IconButton(
            icon: const Icon(Icons.assignment, color: Colors.black),
            onPressed: () {
              Navigator.pushNamed(context, '/reto2');
            },
          ),
        ],
      ),
      extendBodyBehindAppBar: true,


      body: Stack(
        children: [
          // Fondo con gradiente
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color.fromARGB(255, 217, 248, 236), Color.fromARGB(255, 93, 241, 162)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 120.0), // Dejar espacio para el AppBar
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Barra de búsqueda
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Que estás buscando?",
                        icon: Icon(Icons.search, color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),               
                const SizedBox(height: 10),
                // Filas de categorías con iconos (Retos)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: SizedBox(
                    height: 80,
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      children: [
                        _buildCategoryItem(Icons.assignment, 'Reto 1', context, '/reto1'),
                        _buildCategoryItem(Icons.assignment, 'Reto 2', context, '/reto2'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Bienvenida
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 45.0),
                  child: Center(
                    child: Text(
                      'Bienvenido a los retos de programación móvil',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        color: Color.fromARGB(255, 215, 151, 23),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color.fromARGB(255, 215, 151, 23),
        child: const Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 6.0, // Reduce el espacio entre el botón y la barra
        color: Colors.white, // Color blanco para que contraste mejor
        elevation: 10, // Más elevación para mayor sombra
        child: Container(
          height: 60.0, // Ajusta el tamaño de la barra inferior
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(Icons.home, color: Colors.black),
                onPressed: () {
                     Navigator.pushNamed(context, '/home'); // Redirige a HomeScreen
                },
              ),
              const SizedBox(width: 30), // Espacio para el botón flotante
              IconButton(
                icon: const Icon(Icons.chat_bubble_outline, color: Colors.black),
                onPressed: () {
                  Navigator.pushNamed(context, '/contact');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget para construir una categoría de reto con icono y texto
  Widget _buildCategoryItem(IconData icon, String label, BuildContext context, String route) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 25,
            child: Icon(icon, color: Colors.orange),
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: const TextStyle(fontSize: 14, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
