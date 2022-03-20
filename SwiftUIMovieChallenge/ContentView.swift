//
//  ContentView.swift
//  SwiftUIMovieChallenge
//
//  Created by Jesus Mora on 15/3/22.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
       
        TabView {
                    MovieListView()
                        .tabItem {
                            VStack {
                                Image(systemName: "tv")
                                Text("Movies")
                            }
                    }
                    .tag(0)
                    
                    MovieSearchView()
                        .tabItem {
                            VStack {
                                Image(systemName: "magnifyingglass")
                                Text("Search")
                            }
                    }
                    .tag(1)
                    
        }

    } 
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
