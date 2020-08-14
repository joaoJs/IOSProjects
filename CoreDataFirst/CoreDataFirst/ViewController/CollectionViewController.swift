import UIKit
import CoreData

class CollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var collectionView: UICollectionView?
    
    var viewModel: AlbumViewModel = {
        return AlbumViewModel()
    }()
    
    var albumsFromCD: [AlbumModel] = []
    
    
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
        
        self.setUp()
        // if AlbumsFromCoreData.shared.albums.count == 0 that means we have not data in core data, therefore, call network
        if (AlbumsFromCoreData.shared.albums.count == 0) {
            
            self.viewModel.bind(updateHandler: {
                DispatchQueue.main.async {
                    self.collectionView?.reloadData()
                }
            }) { (error) in
                print("error")
            }
            self.viewModel.fetchAlbums()
            
        }
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
        
        
        self.viewModel.fetchDataFromCoreData(i: indexPath.row){imageUrl,albumId,albumName,artistName,isFavorite in
            if (ImagesDict.shared.imagesDict[albumId] != nil) {
                
                cell.albumImage?.image = ImagesDict.shared.imagesDict[albumId]
                cell.artistName?.text = artistName
                cell.albumName?.text = albumName
                let hIcon = isFavorite ? "heartFull" : "heart"
                cell.heartIcon?.image = UIImage(named: hIcon)
                //return cell
            } else {
                // I will always make this network call at least once because I am not saving the images in core data yet
                self.viewModel.fetchAlbumImage(albumId: albumId, albumImgUrl: imageUrl, index: indexPath.row){imageBack in
                    DispatchQueue.main.async {
                        cell.albumImage?.image = imageBack
                        if (ImagesDict.shared.imagesDict[albumId] == nil) {
                            ImagesDict.shared.imagesDict[albumId] = imageBack
                        }
                        
                        FavoritesDict.shared.favoritesDict[albumName] = isFavorite
                        cell.artistName?.text = AlbumsFromCoreData.shared.albums[indexPath.row].artistName
                        cell.albumName?.text = albumName
                        let hIcon = isFavorite ? "heartFull" : "heart"
                        cell.heartIcon?.image = UIImage(named: hIcon)
                    }
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
            // do these in vm like in the previous method
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
            
            let albumImage = ImagesDict.shared.imagesDict[albumId]
            let hIcon = AlbumsFromCoreData.shared.albums[indexPath.row].isFavorite ? "heartFull" : "heart"
            let heartImage = UIImage(named: hIcon)
            
            
            let vc = DetailViewController(details: (imageView: albumImage , artistName: artistName, albumName: albumName, listOfGenres: genres, dateOfRelease: date, heartImg: heartImage))
            
            // Uses closure to pass data back to Main View Controller ***
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
