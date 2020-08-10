import UIKit

class CollectionViewCell: UICollectionViewCell {

    static let reuseId: String = "MyCell"
    
    var numberLabel: UILabel?
    
    //Initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        let numberLabel = UILabel(frame: .zero)
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        numberLabel.textColor = .black
        
        self.contentView.addSubview(numberLabel)
        
        numberLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8).isActive = true
        numberLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8).isActive = true
        numberLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8).isActive = true
        numberLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8).isActive = true
            
        self.numberLabel = numberLabel
    }
    
}
