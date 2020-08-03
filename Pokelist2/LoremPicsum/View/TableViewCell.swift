import UIKit

class TableViewCell: UITableViewCell {
    
    static let reuseId: String = "MyCell"
    
    //var id: UILabel?
    var name: UILabel?
    var typeOne: UILabel?
    var typeTwo: UILabel?
    var img: UIImageView?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        self.contentView.heightAnchor.constraint(equalToConstant: 176).isActive = true
        
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        
        let name = UILabel(frame: .zero)
        name.translatesAutoresizingMaskIntoConstraints = false
        name.textColor = UIColor(red: CGFloat(0.0/255.0), green: CGFloat(0.0/255.0), blue: CGFloat(80.0/255.0), alpha: 0.8)
        name.font = UIFont(name: "AvenirNextCondensed-Regular", size: 32.0)
        //labelFont = [UIFont fontWithName:@"AvenirNextCondensed-Bold" size:9.0];
        name.textAlignment = .center
        
        let typeOne = UILabel(frame: .zero)
        typeOne.translatesAutoresizingMaskIntoConstraints = false
        typeOne.textColor = .black
        typeOne.font = UIFont(name: "AvenirNextCondensed-Medium", size: 24.0)
        typeOne.textAlignment = .center
        
        let typeTwo = UILabel(frame: .zero)
        typeTwo.translatesAutoresizingMaskIntoConstraints = false
        typeTwo.textColor = .black
        typeTwo.font = UIFont(name: "AvenirNextCondensed-Medium", size: 24.0)
        typeTwo.textAlignment = .center
        
        self.contentView.addSubview(imageView)
        self.contentView.addSubview(name)
        self.contentView.addSubview(typeOne)
        self.contentView.addSubview(typeTwo)
        
        imageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8).isActive = true
        imageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 8).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 160).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 160).isActive = true
        //imageView.ratio
        
        name.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16).isActive = true
        name.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 16).isActive = true
        name.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16).isActive = true
        //name.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -16).isActive = true
        name.heightAnchor.constraint(equalToConstant: 56).isActive = true
        
        typeOne.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 8).isActive = true
        typeOne.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 16).isActive = true
        typeOne.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16).isActive = true
        //name.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -16).isActive = true
        typeOne.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        typeTwo.topAnchor.constraint(equalTo: typeOne.bottomAnchor, constant: 8).isActive = true
        typeTwo.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 16).isActive = true
        typeTwo.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16).isActive = true
        typeTwo.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -32).isActive = true
        typeTwo.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        self.img = imageView
        self.name = name
        self.typeOne = typeOne
        self.typeTwo = typeTwo
    }
    
}



