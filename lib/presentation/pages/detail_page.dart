import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import '../../core/network/dio_client.dart';
import '../../domain/entities/breed.dart';
import '../widgets/skeleton_loader.dart';

class DetailPage extends StatefulWidget {
  final Breed breed;

  const DetailPage({super.key, required this.breed});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  String? _catFact;
  bool _isLoadingFact = true;
  String? _errorFact;

  @override
  void initState() {
    super.initState();
    _loadCatFact();
  }

  Future<void> _loadCatFact() async {
    try {
      final dio = DioClient().dio;
      final response = await dio.get('/fact');
      setState(() {
        _catFact = response.data['fact'] as String;
        _isLoadingFact = false;
      });
    } on DioException {
      setState(() {
        _errorFact = 'Failed to load cat fact';
        _isLoadingFact = false;
      });
    } catch (e) {
      setState(() {
        _errorFact = 'Unexpected error';
        _isLoadingFact = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.breed.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Hero(
                tag: 'breed_image_${widget.breed.id}',
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: colorScheme.primaryContainer,
                    shape: BoxShape.circle,
                  ),
                  child: widget.breed.imageUrl != null
                      ? ClipOval(
                          child: Image.network(
                            widget.breed.imageUrl!,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                Icon(Icons.pets, color: colorScheme.primary, size: 64),
                          ),
                        )
                      : Icon(Icons.pets, color: colorScheme.primary, size: 64),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              widget.breed.name,
              style: textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.location_on, color: colorScheme.secondary, size: 20),
                const SizedBox(width: 8),
                Text(
                  widget.breed.origin,
                  style: textTheme.titleMedium,
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildInfoCard(
              context,
              title: 'Description',
              content: widget.breed.description,
              icon: Icons.description_outlined,
            ),
            const SizedBox(height: 16),
            _buildInfoCard(
              context,
              title: 'Temperament',
              content: widget.breed.temperament,
              icon: Icons.psychology_outlined,
            ),
            const SizedBox(height: 16),
            _buildInfoCard(
              context,
              title: 'Life Span',
              content: '${widget.breed.lifeSpan} years',
              icon: Icons.calendar_today_outlined,
            ),
            const SizedBox(height: 16),
            _buildCatFactCard(context),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(
    BuildContext context, {
    required String title,
    required String content,
    required IconData icon,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: colorScheme.primary, size: 20),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: textTheme.titleSmall?.copyWith(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              content,
              style: textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCatFactCard(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Card(
      color: colorScheme.secondaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.lightbulb, color: colorScheme.secondary, size: 20),
                const SizedBox(width: 8),
                Text(
                  'Did you know?',
                  style: textTheme.titleSmall?.copyWith(
                    color: colorScheme.secondary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            if (_isLoadingFact)
              SkeletonLoader(
                width: double.infinity,
                height: 60,
                borderRadius: 8,
              )
            else if (_errorFact != null)
              Row(
                children: [
                  Expanded(
                    child: Text(
                      _errorFact!,
                      style: textTheme.bodyMedium?.copyWith(
                        color: colorScheme.error,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.refresh),
                    onPressed: () {
                      setState(() {
                        _isLoadingFact = true;
                        _errorFact = null;
                      });
                      _loadCatFact();
                    },
                  ),
                ],
              )
            else
              Text(
                _catFact ?? '',
                style: textTheme.bodyMedium?.copyWith(
                  fontStyle: FontStyle.italic,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
