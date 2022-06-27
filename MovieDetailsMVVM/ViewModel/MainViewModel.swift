//
//  MainViewModel.swift
//  MovieDetailsMVVM
//
//  Created by Sajjad Sarkoobi on 26.06.2022.
//

import Foundation

class MainViewModel {
    
    var isLoadingData: Observable<Bool> = Observable(false)
    var dataSource: TrendingMovieModel?
    var movies: Observable<[MovieTableCellViewModel]> = Observable(nil)
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRows(in section: Int) -> Int {
        return dataSource?.results.count ?? 0
    }
    
    func getData() {
        if isLoadingData.value ?? true {
            return
        }
        
        isLoadingData.value = true
        APICaller.getTrendingMovies { [weak self] result in
            self?.isLoadingData.value = false
            
            switch result {
            case .success(let trendingMovieData):
                self?.dataSource = trendingMovieData
                self?.mapMovieData()
            case .failure(let err):
                print(err)
            }
        }
    }
    
    private func mapMovieData() {
        movies.value = self.dataSource?.results.compactMap({MovieTableCellViewModel(movie: $0)})
    }
    
    func getMovieTitle(_ movie: Movie) -> String {
        return movie.title ?? movie.name ?? ""
    }
}
