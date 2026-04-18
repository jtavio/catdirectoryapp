import 'package:flutter/material.dart';

class SkeletonLoader extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;

  const SkeletonLoader({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius = 8,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );
  }
}

class BreedCardSkeleton extends StatelessWidget {
  const BreedCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            SkeletonLoader(
              width: 80,
              height: 80,
              borderRadius: 12,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SkeletonLoader(
                    width: double.infinity,
                    height: 20,
                    borderRadius: 4,
                  ),
                  const SizedBox(height: 8),
                  SkeletonLoader(
                    width: 120,
                    height: 16,
                    borderRadius: 4,
                  ),
                  const SizedBox(height: 8),
                  SkeletonLoader(
                    width: 80,
                    height: 14,
                    borderRadius: 4,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailSkeleton extends StatelessWidget {
  const DetailSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: SkeletonLoader(
              width: 200,
              height: 200,
              borderRadius: 100,
            ),
          ),
          const SizedBox(height: 24),
          SkeletonLoader(
            width: double.infinity,
            height: 32,
            borderRadius: 8,
          ),
          const SizedBox(height: 16),
          SkeletonLoader(
            width: 150,
            height: 20,
            borderRadius: 4,
          ),
          const SizedBox(height: 24),
          SkeletonLoader(
            width: double.infinity,
            height: 100,
            borderRadius: 8,
          ),
          const SizedBox(height: 16),
          SkeletonLoader(
            width: double.infinity,
            height: 60,
            borderRadius: 8,
          ),
        ],
      ),
    );
  }
}
