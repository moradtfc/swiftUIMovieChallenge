//
//  MovieCards.swift
//  SwiftUIMovieChallenge
//
//  Created by Jesus Mora on 15/3/22.
//

import SwiftUI

struct MovieCards: View {
    
    let movie: Movie
    @ObservedObject var imageLoader = ImageLoader()
    
    var body: some View {
        VStack{
            Text("Top Movies").font(.largeTitle).bold()
            
            HStack{
                
                if self.imageLoader.image != nil {
                    Image(uiImage: self.imageLoader.image!)
                        .resizable().aspectRatio(16/9, contentMode: .fit)
                }
                
            }
            Text(movie.title)
        } .onAppear {
            self.imageLoader.loadImage(with: self.movie.backdropURL)
        }
    }
}

struct MovieCards_Previews: PreviewProvider {
    static var previews: some View {
        MovieCards(movie: Movie.stubbedMovie)
    }
}
