import UIKit
import CoreData

class CollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var collectionView: UICollectionView?
    //var numbers: [NumberModel] = []
    //var albums: [Album] = []
    var imagesDict: [String: UIImage] = [:]
    
    var albums: [Album] = [] {
        didSet {
            DispatchQueue.main.async {
                self.collectionView?.reloadData()
            }
        }
    }
    
    var albumsFromCD: [AlbumModel] = []
    
    let firstUrl: String = "https://rss.itunes.apple.com/api/v1/gw/apple-music/coming-soon/all/100/explicit.json"
    let defaultEighth = "https://cdn1.macworld.co.uk/cmsdata/features/3630990/sync_itunes_apple_music_thumb800.jpg"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        do {
            let list = try GlobalContext.shared.context.fetch(AlbumModel.fetchRequest())
            list.forEach{ album in
                guard let am = album as? AlbumModel else {return}
                AlbumsFromCoreData.shared.albums.append(am)
            }
            print("albums from core data ...")
            print(self.albumsFromCD)
        } catch {
            print("error")
        }
        
        
        // if AlbumsFromCoreData.shared.albums.count == 0 that means we have not data in core data, therefore, call network
        // right now I have many albums saved in core data, I need to make a delete function to empty core data
       if (AlbumsFromCoreData.shared.albums.count == 0) {
            NetworkManager.shared.fetchAlbums(firstUrl: firstUrl) { result in
                switch result {
                case .success(let albums):
                    self.albums = albums.results
                    let context = GlobalContext.shared.context
                    albums.results.forEach{ album in
                        
                        let albumModel = AlbumModel(context: context)
                        
                        albumModel.setValue(album.id, forKey: "id")
                        albumModel.setValue(album.name, forKey: "name")
                        albumModel.setValue(album.artistName, forKey: "artistName")
                        albumModel.setValue(album.releaseDate, forKey: "releaseDate")
                        albumModel.setValue(album.artworkUrl100, forKey: "artworkUrl100")
                        albumModel.setValue(false, forKey: "isFavorite")
                       
                        album.genres.forEach{ genre in
                            let genreM = GenreModel(context: context)
                            genreM.name = genre.name
                            albumModel.addToGenres(genreM)
                        }
                        
                        
                        do {
                            try context.save()
                            print("Success")
                        } catch {
                            print("Error saving: \(error)")
                        }
                    }
                case .failure(let error):
                    print("error fetching album")
                    print(error)
                }
            }
       }
        
        self.setUp()
    }
    
    private func setUp() {
        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: MyCollectionViewCell.reuseId)
        
        collectionView.backgroundColor = UIColor(red: CGFloat(10.0/255.0), green: CGFloat(0.0/255.0), blue: CGFloat(40.0/255.0), alpha: 0.0)
        let colorOne = UIColor(red: CGFloat(40.0/255.0), green: CGFloat(0.0/255.0), blue: CGFloat(120.0/255.0), alpha: 1.0)
        let colorTwo = UIColor(red: CGFloat(10.0/255.0), green: CGFloat(0.0/255.0), blue: CGFloat(40.0/255.0), alpha: 1.0)
        
        self.view.setGradientBackground(colorOne: colorOne, colorTwo: colorTwo)
        
        
        self.view.addSubview(collectionView)
        
        collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
        
        
        self.collectionView = collectionView
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return AlbumsFromCoreData.shared.albums.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.reuseId, for: indexPath) as? MyCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        // fix bug with is favorite when cells are being 'lazyloaded'
        
        let imageUrl = AlbumsFromCoreData.shared.albums[indexPath.row].artworkUrl100
        guard let albumId = AlbumsFromCoreData.shared.albums[indexPath.row].id else {return UICollectionViewCell()}
        guard let albumName = AlbumsFromCoreData.shared.albums[indexPath.row].name else {return UICollectionViewCell()}
        
        // I am still saving images in an images dictionary
        if (self.imagesDict[albumId] != nil) {
            
            cell.albumImage?.image = self.imagesDict[albumId]
            cell.artistName?.text = AlbumsFromCoreData.shared.albums[indexPath.row].artistName
            cell.albumName?.text = albumName
            let hIcon = AlbumsFromCoreData.shared.albums[indexPath.row].isFavorite ? "heartFull" : "heart"
            cell.heartIcon?.image = UIImage(named: hIcon)
            return cell
        } else {
            // I will always make this network call at least once because I am not saving the images in core data yet
            NetworkManager.shared.fetchAlbumImage(albumImgUrl: imageUrl ?? defaultEighth) { result in
                switch result {
                case .success(let image):
                    DispatchQueue.main.async {
                        //albumImage = image
                        self.imagesDict[albumId] = image
                        
                        // saving favorite status
                        guard let albumName = AlbumsFromCoreData.shared.albums[indexPath.row].name else {return}
                        FavoritesDict.shared.favoritesDict[albumName] = false
                        
                        cell.albumImage?.image = image
                        cell.artistName?.text = AlbumsFromCoreData.shared.albums[indexPath.row].artistName
                        cell.albumName?.text = albumName
                        let hIcon = AlbumsFromCoreData.shared.albums[indexPath.row].isFavorite ? "heartFull" : "heart"
                        cell.heartIcon?.image = UIImage(named: hIcon)
                    }
                case .failure(let error):
                    print("error fetching album")
                    print(error)
                }
            }
        }
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.reuseId, for: indexPath) as? MyCollectionViewCell else {
            return
        }
        
        DispatchQueue.main.async {
            guard let albumId = AlbumsFromCoreData.shared.albums[indexPath.row].id else {return}
            guard let albumName = AlbumsFromCoreData.shared.albums[indexPath.row].name else {return}
            let artistName = AlbumsFromCoreData.shared.albums[indexPath.row].artistName
            let date = AlbumsFromCoreData.shared.albums[indexPath.row].releaseDate
            guard let genresNSSet = AlbumsFromCoreData.shared.albums[indexPath.row].genres else {return}
            
            // didn't find a better way to manibulate the genres NSSet
            var genres: [Genre] = []
            for (_, value) in genresNSSet.enumerated() {
                let curr: GenreModel = value as! GenreModel
                let gen = Genre.init(name: curr.name ?? "default genre")
                genres.append(gen)
            }
            
            let albumImage = self.imagesDict[albumId]
            let hIcon = AlbumsFromCoreData.shared.albums[indexPath.row].isFavorite ? "heartFull" : "heart"
            let heartImage = UIImage(named: hIcon)
            
            
            let vc = DetailViewController(details: (imageView: albumImage , artistName: artistName, albumName: albumName, listOfGenres: genres, dateOfRelease: date, heartImg: heartImage))
            
            // Uses closure to pass data back to Main View Controller
            vc.completionHandler = { text in
                print("Inside Collection View Contoller: \(text)")
                cell.heartIcon?.image = UIImage(named: text)
                self.collectionView?.reloadData()
            }
            
            self.navigationController?.pushViewController(vc, animated: false)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
}
