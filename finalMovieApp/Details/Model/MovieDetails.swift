
import Foundation

//struct MovieDetails: Codable {
//    let id: Int?
//    let original_title: String?
//    let imdb_id: String?
//    let poster_path: String?
//    let overview: String?
//    let release_date: String?
//    let vote_average: Double?
//}

struct MovieDetails: Codable {
    let id: Int?
    let title: String?
    let overview: String?
    let posterPath: String?
    let backdropPath: String?
    let voteCount: Int?
    let voteAverage: Double?
    let releaseDate: String?
}
