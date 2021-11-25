
import UIKit
import Kingfisher

class CollectionViewItem: UICollectionViewCell {

    @IBOutlet weak var movieImage: UIImageView!

    var movie: Movie? {
        didSet {
            if let movie = movie {
                movieImage.kf.setImage(with: "\(movie.posterPath ?? "")".url)
            }
        }
    }
}

extension String {
    var url: URL? {
        return URL (string: "\(posterUrl)\(self)")
    }
}
