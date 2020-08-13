import UIKit

let url = "https://pokeapi.co/api/v2/pokemon/?limit=30"
let urlOffset = "&offset="
let baseFormUrl = "https://pokeapi.co/api/v2/pokemon-form/"

typealias PokeHandler = (Result<ResponseObj, NetworkError>) -> ()
typealias FormHandler = (Result<[String: String], NetworkError>) -> ()
typealias SpriteHandler = (Result<UIImage?, NetworkError>) -> ()

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    var session: URLSession
    var decoder: JSONDecoder
    var cache: ImageCache
    
    private init(session: URLSession = URLSession.shared, imageCache: ImageCache = ImageCache.sharedCache, decoder: JSONDecoder = JSONDecoder()) {
        self.session = session
        self.cache = imageCache
        
        self.decoder = decoder
    }
    
}



extension NetworkManager {
    
    func fetchPoke(offset: Int, completion: @escaping PokeHandler) {
        
        guard let url = URL(string: url + urlOffset + "\(offset)") else {
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
                let dataObj = try self.decoder.decode(ResponseObj.self, from: data)
                completion(.success(dataObj))
            } catch {
                print(error.localizedDescription)
                completion(.failure(.decodeError))
            }
            
        }.resume()
        
    }
    
    func fetchForm(name: String, completion: @escaping FormHandler) {
        
        guard let url = URL(string: baseFormUrl + name) else {
            completion(.failure(.badURL))
            return
        }
        
        self.session.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                print("first info eror")
                completion(.failure(.serverError(error.localizedDescription)))
                return
            }
            
            guard let data = data else {
                print("data info eror")
                completion(.failure(.badData))
                return
            }
            
            do {
                let info = try self.decoder.decode(PokeForm.self, from: data)
                completion(.success(info.sprites))
            } catch {
                print(error.localizedDescription)
                completion(.failure(.decodeError))
            }
            
        }.resume()
        
    }
    
    func fetchSprite(name: String, spriteUrl: String, completion: @escaping SpriteHandler) {
        
        if let data = self.cache.get(name: name) {
            print("Image From Cache")
            let image = UIImage(data: data)
            completion(.success(image))
            return
        }
        
        guard let url = URL(string: spriteUrl) else {
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
            
            print("Image from network")
            self.cache.set(data: data, name: name)
            let image = UIImage(data: data)
            completion(.success(image))
            
        }.resume()
        
    }
    
    
    
}

