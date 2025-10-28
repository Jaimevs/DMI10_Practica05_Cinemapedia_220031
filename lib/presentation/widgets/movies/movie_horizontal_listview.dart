import 'package:cinemapedia_220031/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class MovieHorizontalListview extends StatelessWidget {
  final List<Movie> movies;
  final String? title;
  final String? subTitle;
  final VoidCallback? loadNextPage;

  const MovieHorizontalListview({
    super.key,
    required this.movies,
    this.title,
    this.subTitle,
    this.loadNextPage,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Column(
        children: [
          if (title != null || subTitle != null)
            _CurrDate(place: title, formatedDate: subTitle),
          Expanded(
            child: ListView.builder(
              itemCount: movies.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                
                if (index == movies.length - 1 && loadNextPage != null) {
                  loadNextPage!();
                }
                return _Slide(movie: movies[index]);
              },
            ),
          )
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Movie movie;

  const _Slide({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                movie.posterPath,
                width: 150,
                height: 200,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(child: CircularProgressIndicator());
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 150,
                    height: 200,
                    color: Colors.grey,
                    child: const Icon(Icons.image_not_supported),
                  );
                },
              ),
            ),
          ),

          const SizedBox(height: 5),

          SizedBox(
            width: 150,
            child: Text(
              movie.title,
              maxLines: 2,
              style: Theme.of(context).textTheme.titleMedium
            ),
          ),

          //Rating

          SizedBox(
            width: 150,
            child: Row(
              children: [
                Icon(Icons.star_half_outlined, color: Colors.yellow.shade800),
                const SizedBox(width: 3),
                Text('${movie.voteAverage}', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.yellow.shade800)),
                const SizedBox(width: 10,),
                Text('${movie.popularity}', style: Theme.of(context).textTheme.bodySmall,)
              ],
            ),)
        ],
      ),
    );
  }
}

// Fecha actual
class _CurrDate extends StatelessWidget {
  final String? place;
  final String? formatedDate;

  const _CurrDate({this.place, this.formatedDate});

  @override
  Widget build(BuildContext context) {
    final placeStyle = Theme.of(context).textTheme.titleLarge;
    return Container(
      padding: const EdgeInsets.only(top: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          if (place != null)
            Text(place!, style: placeStyle),
          const Spacer(),
          if (formatedDate != null)
            FilledButton.tonal(
              onPressed: () {},
              child: Text(formatedDate!),
            ),
        ],
      ),
    );
  }
}