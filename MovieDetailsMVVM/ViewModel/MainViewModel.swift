//
//  MainViewModel.swift
//  MovieDetailsMVVM
//
//  Created by Sajjad Sarkoobi on 26.06.2022.
//

import Foundation

class MainViewModel {
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRows(in section: Int) -> Int {
        return 10
    }
    
    func getData() {
        APICaller.getTrendingMovies { result in
            switch result {
            case .success(let trendingMovieData):
                print(trendingMovieData)
            case .failure(let err):
                print(err)
            }
        }
    }
}
