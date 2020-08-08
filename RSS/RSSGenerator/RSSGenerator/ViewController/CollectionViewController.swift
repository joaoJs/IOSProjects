import UIKit

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
    
    let firstUrl: String = "https://rss.itunes.apple.com/api/v1/gw/apple-music/coming-soon/all/100/explicit.json"
    let defaultEighth = "https://cdn1.macworld.co.uk/cmsdata/features/3630990/sync_itunes_apple_music_thumb800.jpg"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NetworkManager.shared.fetchAlbums(firstUrl: firstUrl) { result in
            switch result {
            case .success(let albums):
                self.albums = albums.results
            case .failure(let error):
                print("error fetching album")
                print(error)
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
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.reuseId)
        
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
        return albums.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reuseId, for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
        let imageUrl = self.albums[indexPath.row].artworkUrl100
        let albumId = self.albums[indexPath.row].id
        //var albumImage: UIImage?
        
        if (self.imagesDict[albumId] != nil) {
            //albumImage = imagesDict[albumId]
            cell.albumImage?.image = self.imagesDict[albumId]
            cell.artistName?.text = self.albums[indexPath.row].artistName
            cell.albumName?.text = self.albums[indexPath.row].name
            return cell
        } else {
            NetworkManager.shared.fetchAlbumImage(albumImgUrl: imageUrl ?? defaultEighth) { result in
                switch result {
                case .success(let image):
                    DispatchQueue.main.async {
                        //albumImage = image
                        self.imagesDict[albumId] = image
                        cell.albumImage?.image = image
                        cell.artistName?.text = self.albums[indexPath.row].artistName
                        cell.albumName?.text = self.albums[indexPath.row].name
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
        //collectionView.deselectRow(at: indexPath, animated: true)
        collectionView.deselectItem(at: indexPath, animated: true)
        
        DispatchQueue.main.async {
            let albumId = self.albums[indexPath.row].id
            let albumName = self.albums[indexPath.row].name
            let artistName = self.albums[indexPath.row].artistName
            let date = self.albums[indexPath.row].releaseDate
            let genres = self.albums[indexPath.row].genres
            let albumImage = self.imagesDict[albumId]
            let heartImage = UIImage(named: "heart")
            
            let vc = DetailViewController(details: (imageView: albumImage , artistName: artistName, albumName: albumName, listOfGenres: genres, dateOfRelease: date, heartImg: heartImage))
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
