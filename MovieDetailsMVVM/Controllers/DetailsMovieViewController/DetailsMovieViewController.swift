//
//  DetailsMovieViewController.swift
//  MovieDetailsMVVM
//
//  Created by Sajjad Sarkoobi on 27.06.2022.
//

import UIKit
import SDWebImage

class DetailsMovieViewController: UIViewController {

    //IBOutlets
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    //View model
    var viewModel: DetailsMovieViewModel
    
    init(viewModel: DetailsMovieViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "DetailsMovieViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configView()
    }
    
    func configView() {
        self.title = "Movie Details"
        titleLabel.text = viewModel.movieTitle
        movieImageView.sd_setImage(with: viewModel.movieImage)
        descriptionLabel.text = viewModel.movieDescription
    }
}
