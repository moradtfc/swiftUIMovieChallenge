//
//  MovieDetailViewTest.swift
//  SwiftUIMovieChallenge
//
//  Created by Jesus Mora on 18/3/22.
//

import SwiftUI

struct MovieDetailViewTest: View {
    let movieId: Int
    
    @ObservedObject private var movieDetailState = MovieDetailState()
    
    var body: some View {
        
        ZStack {
            LoadingView(isLoading: self.movieDetailState.isLoading, error: self.movieDetailState.error) {
                self.movieDetailState.loadMovie(id: self.movieId)
            }
            
        
            if movieDetailState.movie != nil {
                                MovieDetailListView(movie: self.movieDetailState.movie!)

            }
            
        }
        .navigationTitle(movieDetailState.movie?.title ?? "")
        .onAppear {
            self.movieDetailState.loadMovie(id: self.movieId)
        }
    }
}

struct MovieDetailListView: View {
    
    let movie: Movie
   // @State var progressValue: Float = 0.45
  
    
    var body: some View {
        List {
            MovieDetailImage(imageURL: self.movie.backdropURL)
                           .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))

            HStack{
                Text("Released:")
                Text(movie.yearText)
            }
            HStack{
                ZStack {
                            Circle()
                                .stroke(lineWidth: 5.0)
                                .opacity(0.3)
                                .foregroundColor(Color.black).opacity(0.1)
                                
                            
                            Circle()
                        .trim(from: 0.0, to: CGFloat(min(movie.testNumber, 1.0)))
                                .stroke(style: StrokeStyle(lineWidth: 5.0, lineCap: .round, lineJoin: .round))
                                .background(Circle().foregroundColor(Color.black).opacity(0.6))
                                .foregroundColor(Color.green)
                                .rotationEffect(Angle(degrees: 270.0))
                    
                    Text(String(format: "%.0f %", min(movie.testNumber, 1.0)*100.0))
                                .font(.system(size: 18))
                                .bold()
                                .foregroundColor(Color.white)
                    
                        }
                    .frame(width: 55.0, height: 55.0)
                    .padding(.init(top: 0, leading: 10, bottom: 0, trailing: 0))
                Text("User Score")
                
            }
            HStack{
                Text(movie.durationText)
                
            }
            HStack{
                ForEach(self.movie.genres!){ genres in
                    
                    Text(genres.name)
                    
                }
            }
        

        Text("Overview").font(.title).bold().multilineTextAlignment(.trailing)
        Text(movie.overview)
    

        Text("Top Billed Cast")
                .font(.largeTitle)
                .bold()
                .multilineTextAlignment(.trailing)
            ScrollView(.horizontal) {
                HStack(spacing: 0) {
                    ForEach(self.movie.cast!) { cast in
                        VStack{
                            MovieDetailImage(imageURL: cast.profileURL)
                                .frame(width: 220)
                            Text(cast.name)
                            Text(cast.character)
                                .padding(.bottom)
                        }
                        
                    }
                }
            }
        }
        
    }
    
}

struct MovieDetailImage: View {
    
    @ObservedObject private var imageLoader = ImageLoader()
    let imageURL: URL
    
    var body: some View {
        ZStack{
            Rectangle().fill(Color.gray.opacity(0.3))
            if self.imageLoader.image != nil {
                Image(uiImage: self.imageLoader.image!)
                    .resizable()
                    .frame(height:220)
            }
        }
        .aspectRatio(16/9, contentMode: .fit)
        .onAppear {
            self.imageLoader.loadImage(with: self.imageURL)
        }
    }
}


struct MovieDetailViewTest_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MovieDetailViewTest(movieId: Movie.stubbedMovie.id)
        }
    }
}
