import 'package:flutter/material.dart';
import '../../domain/entities/character.dart';

class CharacterDetailsPage extends StatelessWidget {
  final Character character;

  const CharacterDetailsPage({super.key, required this.character});

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$label: ",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 18, color: Colors.white70),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2F1775),
      appBar: AppBar(
        title: Text(
          character.name,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF2F1775),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Hero(
                tag: "character_${character.id}",
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    character.image,
                    height: 220,
                    width: 220,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Card(
              color: const Color(0xFF3A1B8A),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInfoRow("Status", character.status),
                    Divider(color: Colors.white54),
                    _buildInfoRow("Species", character.species),
                    Divider(color: Colors.white54),
                    _buildInfoRow("Gender", character.gender),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              color: const Color(0xFF3A1B8A),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInfoRow("Origin", character.origin),
                    Divider(color: Colors.white54),
                    _buildInfoRow("Location", character.location),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
