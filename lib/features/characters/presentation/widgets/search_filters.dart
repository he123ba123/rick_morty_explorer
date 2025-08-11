import 'package:flutter/material.dart';
import 'package:rick_morty_explorer/core/constants/app_colors.dart';
import 'search_bar.dart';

class SearchAndFilterBar extends StatelessWidget {
  final String? initialStatus;
  final String? initialSpecies;
  final ValueChanged<String> onSearchChanged;
  final ValueChanged<String?> onStatusChanged;
  final ValueChanged<String?> onSpeciesChanged;

  const SearchAndFilterBar({
    super.key,
    this.initialStatus,
    this.initialSpecies,
    required this.onSearchChanged,
    required this.onStatusChanged,
    required this.onSpeciesChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchBarWidget(onChanged: onSearchChanged),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: AppColors.card,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: DropdownButton<String>(
                      hint: const Text(
                        "Status",
                        style: TextStyle(color: Colors.white),
                      ),
                      value: initialStatus,
                      dropdownColor: AppColors.card,
                      isExpanded: true,
                      underline: const SizedBox(),
                      items: ["Alive", "Dead", "unknown"]
                          .map(
                            (status) => DropdownMenuItem(
                              value: status,
                              child: Text(
                                status,
                                style: TextStyle(color: AppColors.white),
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: onStatusChanged,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: AppColors.card,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: DropdownButton<String>(
                      hint: const Text(
                        "Species",
                        style: TextStyle(color: Colors.white),
                      ),
                      value: initialSpecies,
                      dropdownColor: AppColors.card,
                      isExpanded: true,
                      underline: const SizedBox(),
                      items: ["Human", "Alien", "Robot"]
                          .map(
                            (species) => DropdownMenuItem(
                              value: species,
                              child: Text(
                                species,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: onSpeciesChanged,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
