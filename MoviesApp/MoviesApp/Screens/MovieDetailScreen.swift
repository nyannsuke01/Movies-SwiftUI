//
//  MovieDetailScreen.swift
//  MoviesApp
//
//

import SwiftUI

struct MovieDetailScreen: View {
    
    let imdbId: String
    @ObservedObject var movieDetailVM = MovieDetailViewModel()
    
    var body: some View {
        VStack {
            
            if movieDetailVM.loadingState == .loading {
                LoadingView()
            } else if movieDetailVM.loadingState == .success {
                MovieDetailView(movieDetailVM: movieDetailVM)
            } else if movieDetailVM.loadingState == .failed {
                FailedView()
            }
            
        }
        
        .onAppear {
            self.movieDetailVM.getDetailsByImdbId(imdbId: self.imdbId)
        }
    }
}


