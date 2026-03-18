import 'package:flutter/material.dart';

void main() => runApp(const ClinicaDentalApp());

class ClinicaDentalApp extends StatelessWidget {
  const ClinicaDentalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dental Gioser Pro',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0F4C75),
          primary: const Color(0xFF0F4C75),
          secondary: const Color(0xFF3282B8),
        ),
      ),
      home: const TratamientosCreativos(),
    );
  }
}

class TratamientosCreativos extends StatelessWidget {
  const TratamientosCreativos({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> data = [
      {
        "t": "Limpieza Laser",
        "d": "Elimina manchas y bacterias con precisión lumínica.",
        "p": "\$750",
        "h": "35m",
        "img": "https://images.unsplash.com/photo-1600170311833-c2cf5280ce49?w=300"
      },
      {
        "t": "Diseño de Sonrisa",
        "d": "Alineación estética personalizada con carillas HD.",
        "p": "\$4,200",
        "h": "120m",
        "img": "https://images.unsplash.com/photo-1593022356769-11f762e25ed9?w=300"
      },
      {
        "t": "Implante Bio-Tech",
        "d": "Sustitución dental con titanio grado médico.",
        "p": "\$6,800",
        "h": "150m",
        "img": "https://images.unsplash.com/photo-1629909615184-74f495363b67?w=300"
      },
      {
        "t": "Ortodoncia Flow",
        "d": "Brackets de autoligado para resultados rápidos.",
        "p": "\$3,500",
        "h": "90m",
        "img": "https://raw.githubusercontent.com/gioser0579/foto-examen/refs/heads/main/ortodoncia.jfif"
      },
      {
        "t": "Scan Dental 3D",
        "d": "Diagnóstico digital completo sin moldes físicos.",
        "p": "\$1,200",
        "h": "25m",
        "img": "https://raw.githubusercontent.com/gioser0579/foto-examen/refs/heads/main/scan%20dental.png"
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF0F4F8),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(0.9),
        surfaceTintColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
        ),
        title: const Text("TRATAMIENTOS", 
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16, letterSpacing: 3, color: Color(0xFF0F4C75))),
        actions: [
          IconButton(icon: const Icon(Icons.auto_awesome, color: Colors.cyan), onPressed: () {}),
          IconButton(icon: const Icon(Icons.tune, color: Color(0xFF0F4C75)), onPressed: () {}),
          const SizedBox(width: 10),
        ],
      ),
      drawer: const CustomDrawer(),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF0F4F8), Colors.white],
            begin: Alignment.topCenter, end: Alignment.bottomCenter,
          )
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Ajustamos el espacio superior para que no choque con el AppBar
              const SizedBox(height: 130),
              
              // LISTA DE TARJETAS
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: data.map((item) => _buildCreativeCard(item)).toList(),
                ),
              ),
              
              const SizedBox(height: 20),
              const GioserBadge(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCreativeCard(Map<String, String> item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(50), 
          bottomLeft: Radius.circular(50),
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20)
        ),
        boxShadow: [
          BoxShadow(color: Colors.blueGrey.withOpacity(0.1), blurRadius: 20, offset: const Offset(5, 5)),
        ],
      ),
      child: Row(
        children: [
          // Imagen Circular a la izquierda
          Container(
            width: 85, height: 85,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.cyan.withOpacity(0.5), width: 3),
              image: DecorationImage(
                image: NetworkImage(item['img']!), 
                fit: BoxFit.cover,
                // Manejo de error por si el link falla
                onError: (exception, stackTrace) => const Icon(Icons.broken_image),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item['t']!, style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 17, color: Color(0xFF1B262C))),
                const SizedBox(height: 4),
                Text(item['d']!, style: TextStyle(fontSize: 12, color: Colors.grey[600], height: 1.1)),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                      decoration: BoxDecoration(color: const Color(0xFF0F4C75), borderRadius: BorderRadius.circular(30)),
                      child: Text(item['p']!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                    ),
                    const Spacer(),
                    const Icon(Icons.bolt, color: Colors.amber, size: 16),
                    Text(item['h']!, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ... El resto de tus clases (CustomDrawer y GioserBadge) se mantienen igual ...
class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [Color(0xFF0F4C75), Color(0xFF3282B8)]),
            ),
            currentAccountPicture: Container(
              padding: const EdgeInsets.all(3),
              decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              child: const CircleAvatar(backgroundImage: NetworkImage('https://raw.githubusercontent.com/gioser0579/foto-examen/refs/heads/main/cunsul.jpg')),
            ),
            accountName: const Text("Dental Gioser Tech", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18)),
            accountEmail: const Text("📍 Plaza Dental #99, Piso 2\n📞 656-999-0011\n✉️ master@gioserdent.com"),
          ),
          _drawerTile(Icons.grid_view_rounded, "Inicio"),
          _drawerTile(Icons.medical_information_rounded, "Tratamientos"),
          _drawerTile(Icons.reviews_rounded, "Reseñas"),
          _drawerTile(Icons.my_location_rounded, "Ubicación"),
        ],
      ),
    );
  }
  Widget _drawerTile(IconData i, String t) => ListTile(
    leading: Icon(i, color: const Color(0xFF3282B8)),
    title: Text(t, style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF0F4C75))),
    onTap: () {},
  );
}

class GioserBadge extends StatelessWidget {
  const GioserBadge({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1B262C),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.cyan, width: 1.5),
        boxShadow: [BoxShadow(color: Colors.cyan.withOpacity(0.2), blurRadius: 10)],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: Column(
        children: [
          const Text("STUDENT ID", style: TextStyle(color: Colors.cyan, fontSize: 8, letterSpacing: 3, fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          const Text('GIOSER FISHER 6-I', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 14)),
        ],
      ),
    );
  }
}