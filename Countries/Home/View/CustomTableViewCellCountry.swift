//
//  PostCell.swift
//  Countries
//
//  Created by Luis Morante on 20/02/24.
//

import UIKit
import SDWebImage

class CustomTableViewCellCountry: UITableViewCell {
    
    static let identifier = "CustomTableViewCellCountry"
    
    static func nib() -> UINib{
        return UINib(nibName: "CustomTableViewCellCountry", bundle: nil)
    }
    
    let countryNameLabel : UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 18,weight: .semibold)
        label.text = "error"
        return label
    }()
    
    let flagImageView : UIImageView = {
        let flagImage = UIImageView()
        flagImage.contentMode = .scaleAspectFit
        flagImage.image = UIImage(systemName: "questionmark")
        flagImage.tintColor = .black
        return flagImage
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.countryNameLabel.text = nil
        self.flagImageView.image = nil
    }
    
    private func setupUI() {
        self.addSubview(flagImageView)
        self.addSubview(countryNameLabel)
        
        flagImageView.translatesAutoresizingMaskIntoConstraints = false
        countryNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            flagImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            flagImageView.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor),
            flagImageView.widthAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.75),
            flagImageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.75),
            countryNameLabel.leadingAnchor.constraint(equalTo: flagImageView.trailingAnchor, constant: 16),
            countryNameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
        
    }
    
    func setup(country: CountryResponse) {
        countryNameLabel.text = country.name
        if let imageURL = URL(string: country.flags){
            flagImageView.sd_setImage(with: imageURL)
        }else{
            flagImageView.image = UIImage(named:"placeholder_image")
        }
    }
}
