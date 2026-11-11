import 'package:flutter/material.dart';
import '../modeli/objava.dart';
import '../usluge/objava_usluga.dart';
import '../widgeti/objava_kartica.dart';
import 'detalji_ekran.dart';

class PopisEkran extends StatefulWidget {
  const PopisEkran({super.key});

  @override
  State<PopisEkran> createState() => _PopisEkranState();
}

class _PopisEkranState extends State<PopisEkran> {
  final ObjavaUsluga _usluga = ObjavaUsluga();
  late Future<List<Objava>> _objave;

  @override
  void initState() {
    super.initState();
    _objave = _usluga.dohvatiObjave();
  }

  Future<void> _osvjezi() async {
    setState(() {
      _objave = _usluga.dohvatiObjave();
    });
    try {
      await _objave;
    } catch (_) {
      
    }
  }

  void _otvoriDetalje(Objava objava) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) => DetaljiEkran(objava: objava),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Objave',
          style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            tooltip: 'Osvježi',
            onPressed: _osvjezi,
            icon: const Icon(Icons.refresh),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: FutureBuilder<List<Objava>>(
        future: _objave,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return _PorukaStanja(
              ikona: Icons.cloud_off_outlined,
              naslov: 'Ne možemo učitati objave',
              opis: 'Provjeri internetsku vezu i pokušaj ponovno.',
              akcija: _osvjezi,
            );
          }

          final objave = snapshot.data ?? <Objava>[];
          if (objave.isEmpty) {
            return const _PorukaStanja(
              ikona: Icons.inbox_outlined,
              naslov: 'Nema objava',
              opis: 'Trenutačno nema podataka za prikaz.',
            );
          }

          return RefreshIndicator(
            onRefresh: _osvjezi,
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
              itemCount: objave.length,
              itemBuilder: (context, index) {
                final objava = objave[index];
                return ObjavaKartica(
                  objava: objava,
                  redniBroj: index + 1,
                  onTap: () => _otvoriDetalje(objava),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class _PorukaStanja extends StatelessWidget {
  final IconData ikona;
  final String naslov;
  final String opis;
  final VoidCallback? akcija;

  const _PorukaStanja({
    required this.ikona,
    required this.naslov,
    required this.opis,
    this.akcija,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(ikona, size: 54, color: const Color(0xFF3157A4)),
            const SizedBox(height: 16),
            Text(
              naslov,
              style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(opis, textAlign: TextAlign.center),
            if (akcija != null) ...[
              const SizedBox(height: 18),
              FilledButton.icon(
                onPressed: akcija,
                icon: const Icon(Icons.refresh),
                label: const Text('Pokušaj ponovno'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
