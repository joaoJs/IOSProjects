import UIKit

class TableViewCell: UITableViewCell {

    static let reuseId: String = "MyCell"
    
    var id: UILabel?
    var img: UIImageView?
    
     override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           super.init(style: style, reuseIdentifier: reuseIdentifier)
           self.setUp()
       }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        
        let id = UILabel(frame: .zero)
        id.translatesAutoresizingMaskIntoConstraints = false
        id.textColor = .blue
        
        self.contentView.addSubview(imageView)
        self.contentView.addSubview(id)
        
        imageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8).isActive = true
        imageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        id.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8).isActive = true
        id.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 8).isActive = true
        id.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8).isActive = true
        id.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 56).isActive = true
            
        self.img = imageView
        self.id = id
    }
    
}



