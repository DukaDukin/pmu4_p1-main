import 'package:flutter/material.dart';
import '../modeli/objava.dart';

class ObjavaKartica extends StatefulWidget {
  final Objava objava;
  final int redniBroj;
  final VoidCallback onTap;

  const ObjavaKartica({
    super.key,
    required this.objava,
    required this.redniBroj,
    required this.onTap,
  });

  @override
  State<ObjavaKartica> createState() => _ObjavaKarticaState();
}

class _ObjavaKarticaState extends State<ObjavaKartica> {
  bool _oznacena = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeOut,
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: _oznacena ? const Color(0xFFEAF0FF) : Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: _oznacena
              ? const Color(0xFF3157A4)
              : const Color(0xFFE8EBF2),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.035),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: widget.onTap,
        onLongPress: () {
          setState(() => _oznacena = !_oznacena);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                _oznacena ? 'Objava je označena.' : 'Oznaka je uklonjena.',
              ),
              duration: const Duration(milliseconds: 900),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: 'objava-${widget.objava.id}',
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE3EAFE),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Center(
                    child: Text(
                      '${widget.objava.id}',
                      style: const TextStyle(
                        color: Color(0xFF3157A4),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.objava.naslov,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF17233D),
                      ),
                    ),
                    const SizedBox(height: 7),
                    Text(
                      widget.objava.sadrzaj,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Color(0xFF69748A),
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 9),
                    Text(
                      'Korisnik ${widget.objava.userId}',
                      style: const TextStyle(
                        color: Color(0xFF3157A4),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                _oznacena ? Icons.bookmark : Icons.chevron_right,
                color: const Color(0xFF3157A4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
