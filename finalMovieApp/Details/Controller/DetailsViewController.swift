
import UIKit
import Kingfisher

class DetailsViewController: UIViewController {

    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var movieReview: UILabel!
    @IBOutlet weak var movieResume: UILabel!

    var movie: Movie?

    override func viewDidLoad() {
        super.viewDidLoad()

        fechId((movie?.id)!)
    }

    func fechId(_ id: Int) {
        API.fetchMoviesId((movie?.id)!) { data in
            self.details = data
        }
    }

    var details: MovieDetails? {
        didSet {
            if let details = details {
                movieTitle.text = details.title
                moviePoster.kf.setImage(with: "\(details.posterPath ?? "")".urlDetails)
                movieResume.text = details.overview
                releaseDate.text = details.releaseDate
                movieReview.text = (details.voteAverage)?.description
            }
        }
    }
}

extension String {
    var urlDetails: URL? {
        return URL (string: "\(posterUrl)\(self)")
    }
}
