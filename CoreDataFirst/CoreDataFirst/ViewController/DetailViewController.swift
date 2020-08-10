import UIKit

class DetailViewController: UIViewController {
    
    var imageView: UIImageView?
    var artistName: UILabel?
    var albumName: UILabel?
    var dateOfRelease: UILabel?
    var heartImgView: UIImageView?
    
    var completionHandler:((String) -> Void)?
    
    @objc func imageViewTapped() {
        guard let albumName = self.albumName?.text else {return}
        guard let isFavorite = FavoritesDict.shared.favoritesDict[albumName] else {return}
        let result = isFavorite ? false : true
        FavoritesDict.shared.favoritesDict[albumName] = result
        let icon = isFavorite ? "heart" : "heartFull"
        self.heartImgView?.image = UIImage(named: icon)
        
        completionHandler?(icon)

        print("pressed button")
        // Image has been tapped
    }
    
    var tuple: (imageView: UIImage?, artistName: String?, albumName: String?, listOfGenres: [Genre]?, dateOfRelease:String?, heartImg: UIImage? )?
    
    init(details: (imageView: UIImage?, artistName: String?, albumName: String?, listOfGenres: [Genre]?, dateOfRelease:String?, heartImg: UIImage?)) {
        self.tuple = details
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let genres: [Genre] = self.tuple?.listOfGenres ?? [Genre(name: "default genre")]
        self.setUp(genres: genres)
        self.artistName?.text = self.tuple?.artistName
        self.albumName?.text = self.tuple?.albumName
        self.dateOfRelease?.text = self.tuple?.dateOfRelease
        self.imageView?.image = self.tuple?.imageView
        self.heartImgView?.image = self.tuple?.heartImg
    }
    
    private func setUp(genres: [Genre]) {
        
        
        let colorOne = UIColor(red: CGFloat(10.0/255.0), green: CGFloat(0.0/255.0), blue: CGFloat(120.0/255.0), alpha: 1.0)
        let colorTwo = UIColor(red: CGFloat(10.0/255.0), green: CGFloat(0.0/255.0), blue: CGFloat(40.0/255.0), alpha: 1.0)
        self.view.setGradientBackground(colorOne: colorOne, colorTwo: colorTwo)
        
        let midSV = UIStackView(frame: .zero)
        midSV.translatesAutoresizingMaskIntoConstraints = false
        midSV.axis = .horizontal
        midSV.alignment = .fill
        midSV.distribution = .fillProportionally
        midSV.spacing = 8.0
        
        let midBottomSV = UIStackView(frame: .zero)
        midBottomSV.translatesAutoresizingMaskIntoConstraints = false
        midBottomSV.axis = .horizontal
        midBottomSV.alignment = .fill
        midBottomSV.distribution = .fillProportionally
        midBottomSV.spacing = 8.0
        
        let bottomSV = UIStackView(frame: .zero)
        bottomSV.translatesAutoresizingMaskIntoConstraints = false
        bottomSV.axis = .vertical
        bottomSV.alignment = .fill
        bottomSV.distribution = .fillProportionally
        bottomSV.spacing = 8.0
        
        
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        
        let albumName = UILabel(frame: .zero)
        albumName.translatesAutoresizingMaskIntoConstraints = false
        //        albumName.text = "test"
        albumName.font = UIFont(name: "AvenirNextCondensed-Regular", size: 24.0)
        albumName.textColor = UIColor(red: CGFloat(255.0/255.0), green: CGFloat(0.0/255.0), blue: CGFloat(100.0/255.0), alpha: 1.0)
        albumName.adjustsFontSizeToFitWidth = true
        //        imageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        albumName.textAlignment = .center
        
        let artistName = UILabel(frame: .zero)
        artistName.translatesAutoresizingMaskIntoConstraints = false
        //        artistName.text = "test"
        artistName.textColor = UIColor(red: CGFloat(255.0/255.0), green: CGFloat(255.0/255.0), blue: CGFloat(100.0/255.0), alpha: 1.0)
        artistName.font = UIFont(name: "AvenirNextCondensed-UltraLight", size: 18.0)
        //artistName.textAlignment = .center
        
        // only year
        let date = UILabel(frame: .zero)
        date.translatesAutoresizingMaskIntoConstraints = false
        //date.text = "test"
        date.textColor = UIColor(red: CGFloat(255.0/255.0), green: CGFloat(255.0/255.0), blue: CGFloat(100.0/255.0), alpha: 0.7)
        date.font = UIFont(name: "AvenirNextCondensed-Regular", size: 18.0)
        date.textAlignment = .right
        
        let heartIcon = UIImageView(frame: .zero)
        heartIcon.translatesAutoresizingMaskIntoConstraints = false
        
        heartIcon.widthAnchor.constraint(equalToConstant: 40).isActive = true
        heartIcon.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        let gestureRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped))
        heartIcon.addGestureRecognizer(gestureRecognizer)
        heartIcon.isUserInteractionEnabled = true
        
        //self.view.addSubview(imageView)
        //self.view.addSubview(scrollView)
        self.view.addSubview(imageView)
//        stackView.addArrangedSubview(imageView)
        self.view.addSubview(midSV)
        self.view.addSubview(midBottomSV)
        midSV.addArrangedSubview(heartIcon)
        midSV.addArrangedSubview(albumName)
        midBottomSV.addArrangedSubview(artistName)
        midBottomSV.addArrangedSubview(date)
        
        //self.view.addSubview(heartIcon)
        self.view.addSubview(bottomSV)
       
        
        genres.forEach{ genre in
            let currGenre = UILabel(frame: .zero)
            currGenre.translatesAutoresizingMaskIntoConstraints = false
            currGenre.text = genre.name
            currGenre.textColor = UIColor(red: CGFloat(255.0/255.0), green: CGFloat(0.0/255.0), blue: CGFloat(100.0/255.0), alpha: 1.0)
            currGenre.textAlignment = .center
            currGenre.font = UIFont(name: "AvenirNextCondensed-Regular", size: 20.0)
            //stackView.addArrangedSubview(currGenre)
            bottomSV.addArrangedSubview(currGenre)

        }
        
       
        imageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 32).isActive = true
        //imageView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        //imageView.bottomAnchor.constraint(equalTo: midSV.topAnchor, constant: -32).isActive = true
        imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true

        midSV.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        midSV.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 32).isActive = true
        midSV.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        midSV.bottomAnchor.constraint(equalTo: midBottomSV.topAnchor, constant: -40).isActive = true
        
        midBottomSV.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        //midSV.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 32).isActive = true
        midBottomSV.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        //midBottomSV.bottomAnchor.constraint(equalTo: bottomSV.topAnchor, constant: -32).isActive = true
        
        
        bottomSV.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        bottomSV.topAnchor.constraint(equalTo: midBottomSV.bottomAnchor, constant: 32).isActive = true
        bottomSV.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        bottomSV.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        
        self.imageView = imageView
        self.artistName = artistName
        self.albumName = albumName
        self.dateOfRelease = date
        self.heartImgView = heartIcon
    }
    
}
