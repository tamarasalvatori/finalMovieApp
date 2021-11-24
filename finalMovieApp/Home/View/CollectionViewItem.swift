
import UIKit
import Kingfisher

//var movieId = ""

class CollectionViewItem: UICollectionViewCell {

    @IBOutlet weak var movieImage: UIImageView!

    var movie: Movie? {
        didSet {
            if let movie = movie {
                movieImage.kf.setImage(with: "\(movie.posterPath ?? "")".url)
                //movieId = (movie.id)?.description ?? "550"
            }
        }
    }
}

extension String {
    var url: URL? {
        return URL (string: "\(posterUrl)\(self)")
    }
}
