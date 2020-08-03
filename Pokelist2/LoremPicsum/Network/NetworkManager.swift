import UIKit

let url = "https://pokeapi.co/api/v2/pokemon/?limit=150"
let baseUrl = "https://pokeapi.co/api/v2/pokemon/"
let baseFormUrl = "https://pokeapi.co/api/v2/pokemon-form/"

typealias PokeHandler = (Result<ResponseObj, NetworkError>) -> ()
typealias FormHandler = (Result<[String: String], NetworkError>) -> ()
typealias InfoHandler = (Result<PokeInfo, NetworkError>) -> ()
//typealias SpriteURLHandler = (Result<String, NetworkError>) -> ()
typealias SpriteHandler = (Result<UIImage?, NetworkError>) -> ()

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
    
    func fetchPoke(completion: @escaping PokeHandler) {
        
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
            
            //            let image = UIImage(data: data)
            //            completion(.success(image))
            do {
                let info = try self.decoder.decode(PokeForm.self, from: data)
                completion(.success(info.sprites))
            } catch {
                print(error.localizedDescription)
                completion(.failure(.decodeError))
            }
            
        }.resume()
        
    }
    
    func fetchInfo(name: String, completion: @escaping InfoHandler) {
        guard let url = URL(string: baseUrl + name) else {
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
                let info = try self.decoder.decode(PokeInfo.self, from: data)
                completion(.success(info))
            } catch {
                print(error.localizedDescription)
                completion(.failure(.decodeError))
            }
            
        }.resume()
    }
    
    func fetchSprite(spriteUrl: String, completion: @escaping SpriteHandler) {
        
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
            
            let image = UIImage(data: data)
            completion(.success(image))
            
        }.resume()
        
    }
    
}
