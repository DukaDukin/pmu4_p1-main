import 'package:flutter/material.dart';
import '../modeli/objava.dart';

class DetaljiEkran extends StatelessWidget {
  final Objava objava;

  const DetaljiEkran({super.key, required this.objava});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalji objave')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'objava-${objava.id}',
              child: Material(
                color: Colors.transparent,
                child: Container(
                  width: 68,
                  height: 68,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE3EAFE),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      '${objava.id}',
                      style: const TextStyle(
                        color: Color(0xFF3157A4),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'OBJAVA #${objava.id}',
              style: const TextStyle(
                color: Color(0xFF3157A4),
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              objava.naslov,
              style: const TextStyle(
                fontSize: 27,
                height: 1.2,
                fontWeight: FontWeight.bold,
                color: Color(0xFF17233D),
              ),
            ),
            const SizedBox(height: 22),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                objava.sadrzaj,
                style: const TextStyle(fontSize: 17, height: 1.7),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Icon(Icons.person_outline, color: Color(0xFF3157A4)),
                const SizedBox(width: 8),
                Text(
                  'Autor: korisnik ${objava.userId}',
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
