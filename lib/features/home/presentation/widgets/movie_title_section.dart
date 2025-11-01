import 'package:flutter/material.dart';

class MovieTitleSection extends StatelessWidget {
  const MovieTitleSection({
    super.key,
    required this.title,
    required this.releaseDate,
    required this.popularity,
  });

  final String? title;
  final String? releaseDate;
  final double? popularity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title ?? 'Unknown Title',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _buildInfoChip(
                context,
                icon: Icons.calendar_today,
                label: releaseDate ?? 'N/A',
              ),
              const SizedBox(width: 12),
              _buildInfoChip(
                context,
                icon: Icons.star,
                label: popularity?.toStringAsFixed(1) ?? 'N/A',
                color: Colors.amber,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoChip(
    BuildContext context, {
    required IconData icon,
    required String label,
    Color? color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Theme.of(context).dividerColor.withOpacity(0.3),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 16,
            color: color ?? Theme.of(context).iconTheme.color,
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
