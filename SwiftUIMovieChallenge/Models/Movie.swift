//
//  Movie.swift
//  SwiftUIMovieChallenge
//
//  Created by Jesus Mora on 15/3/22.
//

import Foundation

struct MovieResults: Decodable {
    
    let results: [Movie]
}


struct Movie: Decodable, Identifiable {
    
    let id: Int
    let title: String
    let backdropPath: String?
    let posterPath: String?
    let overview: String
    let voteAverage: Double
    let voteCount: Int
    let runtime: Int?
    let releaseDate: String?
    let popularity: Float
    
    
    let genres: [MovieGenre]?
    let credits: MovieCredit?
    
    static private let yearFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "MMM d, yyyy"
            return formatter
    }()
    
    static private let durationFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .full
        formatter.allowedUnits = [.hour, .minute]
        return formatter
    }()
    
    var backdropURL: URL {
            return URL(string: "https://image.tmdb.org/t/p/w500\(backdropPath ?? "")")!
    }
    
    var posterURL: URL {
         return URL(string: "https://image.tmdb.org/t/p/w500\(posterPath ?? "")")!
    }
    
    
    
    var cast: [MovieCast]? {
         credits?.cast
    }
    
    
    var testNumber: Float {
        
        let r = Float(voteAverage*0.1)
        
        return r
        
    }
    
    
    var yearText: String {
            guard let releaseDate = self.releaseDate, let date = Utils.dateFormatter.date(from: releaseDate) else {
                return "n/a"
            }
            return Movie.yearFormatter.string(from: date)
    }
    
    var durationText: String {
        guard let runtime = self.runtime, runtime > 0 else {
            return "n/a"
        }
        return Movie.durationFormatter.string(from: TimeInterval(runtime) * 60) ?? "n/a"
    }
    
}

struct MovieGenre: Decodable, Identifiable {
    let id: Int
    let name: String
}

struct MovieCredit: Decodable {
    
    let cast: [MovieCast]
    
}

struct MovieCast: Decodable, Identifiable {
    let id: Int
    let character: String
    let name: String
    let profilePath: String?
   
    var profileURL: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500\(profilePath ?? "")")!
    }
    
}
