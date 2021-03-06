
import UIKit
private let identifier = "MovieCell"

class HomeViewController: UIViewController {

    @IBOutlet private weak var collectionView: UICollectionView!

    private var movies: [Movie]?
    private var page: Int = 1
    private var totalPages: Int = 0
    var movieSelected : Movie?

    override func viewDidLoad() {
        super.viewDidLoad()

        let width = ( view.frame.size.width - 5) / 2
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: 280 )

        fetch()
        
        }

    private func fetch(_ page: Int = 1) {
        API.fetchMovies(page) { data in
            self.totalPages = data.totalPages
            self.movies = data.results
            self.collectionView.reloadData()
        }
    }

    private func loadMoreData() {
        if page < totalPages {
            page += 1
            OperationQueue.main.addOperation {
                API.fetchMovies(self.page) { data in
                    self.movies? += data.results
                    self.collectionView.reloadData()
                }
            }
        }
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! CollectionViewItem
        cell.movie = movies?[indexPath.item]
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let count = movies?.count else { fatalError() }

        if indexPath.item == count - 1 {
            self.loadMoreData()
        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = self.movies?[indexPath.item]
        movieSelected = item
        self.performSegue(withIdentifier: "showDetails", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetails" {
            let vc = segue.destination as? DetailsViewController
            vc?.movie = movieSelected
        }
    }
}
