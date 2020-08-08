import Foundation

typealias AlbumHandler = (Result<Feed, NetworkError>) -> ()

final class NetworkManager {

    static let shared = NetworkManager()
    
    var session: URLSession
    var decoder: JSONDecoder
   // var cache: ImageCache
    
    private init(session: URLSession = URLSession.shared, decoder: JSONDecoder = JSONDecoder()) {
        self.session = session
        //self.cache = imageCache
        self.decoder = decoder
    }
    
}

extension NetworkManager {
    
    func fetchAlbums(firstUrl: String, completion: @escaping AlbumHandler) {
        
        guard let url = URL(string: firstUrl) else {
            completion(.failure(.badURL))
            return
        }
        
        self.session.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                print(error)
                completion(.failure(.serverError(error.localizedDescription)))
                return
            }
            
            guard let data = data else {
                print("bad data")
                completion(.failure(.badData))
                return
            }
            
            do {
                let dataObj = try self.decoder.decode(ResponseObj.self, from: data)
                completion(.success(dataObj.feed))
            } catch {
                print(error.localizedDescription)
                completion(.failure(.decodeError))
            }
            
        }.resume()
        
    }
    
}


