

import Foundation
import Alamofire

private let baseUrl = "https://api.themoviedb.org/3/movie/"
let posterUrl = "https://image.tmdb.org/t/p/original"
private let coder = JSONDecoder()

class API {

    class func fetchMovies(_ page: Int, onSuccess: @escaping (Results) -> Void) {
        coder.keyDecodingStrategy = .convertFromSnakeCase
        let urlStr = "\(baseUrl)top_rated?api_key=\(Configuration.apiKey)&page=\(page)"
        guard let url = URL(string: urlStr) else { fatalError("Unable to get url") }

        AF.request(url).response { response in
            switch response.result {
            case .success(let data):
                guard let data = data else { fatalError("Unable to parse data from API") }
                do {
                    let results = try coder.decode(Results.self, from: data)
                    DispatchQueue.main.async {
                        onSuccess(results)
                    }
                }
                    catch {
                        print(error)
                    }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    class func fetchMoviesId(_ id: Int, onSuccess: @escaping (MovieDetails) -> Void) {
        coder.keyDecodingStrategy = .convertFromSnakeCase
        let urlStr = "\(baseUrl)\(String(describing: id))?api_key=\(Configuration.apiKey)"
        guard let url = URL(string: urlStr) else { fatalError("Unable to get url") }

        AF.request(url).response { response in
            switch response.result {
            case .success(let data):
                guard let data = data else { fatalError("Unable to parse data from API") }
                guard let resultsDetails =
                        try? coder.decode(MovieDetails.self, from: data) else { fatalError("Unable to parse data in json") }
                DispatchQueue.main.async {
                    onSuccess(resultsDetails)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
