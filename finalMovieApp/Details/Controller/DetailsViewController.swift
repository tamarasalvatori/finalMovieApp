
import UIKit

class DetailsViewController: UIViewController {

    private var details: [MovieDetails]?
    private var id: String = "1"

    override func viewDidLoad() {
        super.viewDidLoad()

        fechId()
    }

    func fechId(_ id: String = "") {
        API.fetchMoviesId(id) { data in
            self.details = data.resultsDetails
        }
    }
}
