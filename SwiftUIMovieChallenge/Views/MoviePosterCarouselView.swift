//
//  MoviePosterCarouselView.swift
//  SwiftUIMovieChallenge
//
//  Created by Jesus Mora on 16/3/22.
//

import SwiftUI

struct MoviePosterCarouselView: View {
    
    let title: String
    let movies: [Movie]
    
    var body: some View {
        VStack(spacing: 0){
            
         
            ScrollView(.horizontal, showsIndicators: false){
                HStack(alignment: .top, spacing: 12) {
                    ForEach(self.movies) { movie in
                        
                        NavigationLink(destination: MovieDetailViewTest(movieId: movie.id)){
                            MoviePosterCard(movie: movie)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding(.leading, movie.id == self.movies.first!.id ? 16: 0)
                        .padding(.trailing, movie.id == self.movies.last!.id ? 16 : 0)
                        
                    }
                    
                    
                }
            }
            
        }
    }
}

struct MoviePosterCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        MoviePosterCarouselView(title: "Top Movies", movies: Movie.stubbedMovies)
    }
}
