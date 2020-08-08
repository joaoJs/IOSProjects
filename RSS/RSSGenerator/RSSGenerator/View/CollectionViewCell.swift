import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    static let reuseId: String = "MyCell"
    
    var artistName: UILabel?
    var albumName: UILabel?
    var albumImage: UIImageView?
    
    
    //Initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        let artistName = UILabel(frame: .zero)
        artistName.translatesAutoresizingMaskIntoConstraints = false
        artistName.heightAnchor.constraint(equalToConstant: 30).isActive = true
        artistName.font = UIFont(name: "AvenirNextCondensed-Medium", size: 24.0)
        artistName.textColor = UIColor(red: CGFloat(255.0/255.0), green: CGFloat(0.0/255.0), blue: CGFloat(100.0/255.0), alpha: 1.0)
        artistName.adjustsFontSizeToFitWidth = true
        artistName.textAlignment = .center
        
        let albumName = UILabel(frame: .zero)
        albumName.translatesAutoresizingMaskIntoConstraints = false
//        artistName.heightAnchor.constraint(equalToConstant: 30).isActive = true
        albumName.textColor = UIColor(red: CGFloat(255.0/255.0), green: CGFloat(255.0/255.0), blue: CGFloat(100.0/255.0), alpha: 1.0)
        albumName.adjustsFontSizeToFitWidth = true
        albumName.font = UIFont(name: "AvenirNextCondensed-UltraLight", size: 18.0)
        
        let stackView = UIStackView(frame: .zero)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.spacing = 4.0
//        stackView.backgroundColor = UIColor(red: CGFloat(10.0/255.0), green: CGFloat(0.0/255.0), blue: CGFloat(40.0/255.0), alpha: 1.0)
//        stackView.layer.borderColor = UIColor(red: CGFloat(150.0/255.0), green: CGFloat(100.0/255.0), blue: CGFloat(50.0/255.0), alpha: 1.0).cgColor
        
        let image = UIImageView(frame: .zero)
        image.translatesAutoresizingMaskIntoConstraints = false
        //image.scalesLargeContentImage = true
        image.widthAnchor.constraint(equalToConstant: 80).isActive = true
        image.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
//        self.contentView.addSubview(image)
        self.contentView.addSubview(stackView)
        stackView.addArrangedSubview(image)
        stackView.addArrangedSubview(artistName)
        stackView.addArrangedSubview(albumName)
        
//        image.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0).isActive = true
//        image.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 0).isActive = true
//        image.trailingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 0).isActive = true
//        image.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0).isActive = true
//
        
        stackView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 0).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 0).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0).isActive = true

//        artistName.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 4).isActive = true
//        artistName.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 0).isActive = true
//        artistName.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 0).isActive = true
//        artistName.bottomAnchor.constraint(equalTo: albumName.topAnchor, constant: 4).isActive = true
//
//        albumName.topAnchor.constraint(equalTo: artistName.bottomAnchor, constant: 4).isActive = true
//        albumName.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 0).isActive = true
//        albumName.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 0).isActive = true
//        albumName.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0).isActive = true
        
        
        self.albumImage = image
        self.artistName = artistName
        self.albumName = albumName
    }
}
