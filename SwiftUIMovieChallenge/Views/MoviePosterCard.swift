//
//  MoviePosterCard.swift
//  SwiftUIMovieChallenge
//
//  Created by Jesus Mora on 16/3/22.
//

import SwiftUI

struct MoviePosterCard: View {
    
    let movie: Movie
    @ObservedObject var imageLoader = ImageLoader()
    
    @State var progressValue: Float = 0.45
    
    var body: some View {
        ZStack{
            if self.imageLoader.image != nil{

                    VStack{
            
                        Image(uiImage: self.imageLoader.image!)
                            .resizable()
                            .aspectRatio( contentMode: .fit)
                            .cornerRadius(8)
                            .shadow(radius: 4)
                        
                 
                    }
                
               /* VStack {
                    PopularityProgressBar(progress: self.$progressValue)
                        .frame(width: 55.0, height: 55.0)
                        .padding(.init(top: 305, leading: 0, bottom: 0, trailing: 120))
                                
                            }
                
                */
                
                VStack{
                    
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
                        .padding(.init(top: 305, leading: 0, bottom: 0, trailing: 120))
                }
                

                VStack{
                        Text(movie.title)
                            .font(.system(size: 14)).bold()
                            .frame(width:200,alignment: .topLeading)
                            .padding(.top,455)
                            .fixedSize(horizontal: false, vertical: true)
                            .multilineTextAlignment(.leading)
                            
                        
                        Text(movie.yearText)
                            .frame(width:200,alignment: .topLeading)
                            .padding(.init(top:1, leading:0, bottom:10,  trailing: 0))
                            .font(.caption)
                    
                      //  Text("\(movie.testNumber)")
                        .frame(width:200, alignment:.topLeading)
   
                    }
            
                    
            } else{
                
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .cornerRadius(8)
                    .shadow(radius: 4)
                Text(movie.title)
                    .multilineTextAlignment(.center)
                
            }
        }
        .frame(width: 200, height: 400, alignment: .bottom)
        .onAppear {
            self.imageLoader.loadImage(with: movie.posterURL)
        }
    }
}

struct MoviePosterCard_Previews: PreviewProvider {
    static var previews: some View {
        MoviePosterCard(movie: .stubbedMovie)
    }
}
