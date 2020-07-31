import UIKit

let url = "https://picsum.photos/v2/list"

typealias ImageHandler = (Result<[Image], NetworkError>) -> ()
typealias OneImageHandler = (Result<UIImage?, NetworkError>) -> ()

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    var session: URLSession
    var decoder: JSONDecoder
    
    private init(session: URLSession = URLSession.shared, decoder: JSONDecoder = JSONDecoder()) {
        self.session = session
        self.decoder = decoder
    }
    
}



extension NetworkManager {
    
    func fetchImages(completion: @escaping ImageHandler) {
        
        guard let url = URL(string: url) else {
            completion(.failure(.badURL))
            return
        }
        
        self.session.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                print("first error")
                completion(.failure(.serverError(error.localizedDescription)))
                return
            }
            
            guard let data = data else {
                print("bad data")
                completion(.failure(.badData))
                return
            }
            
           do {
            let images = try self.decoder.decode([Image].self, from: data)
            completion(.success(images))
            } catch {
                print(error.localizedDescription)
                completion(.failure(.decodeError))
            }
            
        }.resume()
        
    }
    
    func fetchImage(imageURL: String, completion: @escaping OneImageHandler) {
        
        guard let url = URL(string: imageURL) else {
            completion(.failure(.badURL))
            return
        }
        
        self.session.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                completion(.failure(.serverError(error.localizedDescription)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.badData))
                return
            }
            
            let image = UIImage(data: data)
            completion(.success(image))
        }.resume()
        
    }
    
}
