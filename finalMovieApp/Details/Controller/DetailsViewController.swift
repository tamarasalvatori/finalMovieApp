
import UIKit
import Kingfisher

class DetailsViewController: UIViewController {

    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var movieReview: UILabel!
    @IBOutlet weak var movieResume: UILabel!

    private var id: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        fechId()
    }

    func fechId(_ id: String = "65") {
        API.fetchMoviesId(id) { data in
            self.details = data
        }
    }

    var details: MovieDetails? {
        didSet {
            if let details = details {
                movieTitle.text = details.original_title
                moviePoster.kf.setImage(with: "\(details.poster_path ?? "")".urlDetails)
                movieResume.text = details.overview
                releaseDate.text = details.release_date
                movieReview.text = (details.vote_average)?.description
            }
        }
    }
}

extension String {
    var urlDetails: URL? {
        return URL (string: "\(posterUrl)\(self)")
    }
}
