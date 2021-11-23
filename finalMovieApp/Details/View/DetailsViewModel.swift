
import UIKit
import Kingfisher

class DetailsViewModel {

    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var movieReview: UILabel!
    @IBOutlet weak var movieResume: UILabel!

    var details: MovieDetails? {
        didSet {
            if let details = details {
                movieTitle.text = details.original_title
                moviePoster.kf.setImage(with: "\(details.poster_path ?? "")".urlDetails)
                movieResume.text = details.overview
                //releaseDate.text =
                //movieReview.text =
            }
        }
    }
}

extension String {
    var urlDetails: URL? {
        return URL (string: "\(posterUrl)\(self)")
    }
}
