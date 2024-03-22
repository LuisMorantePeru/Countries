//
//  DetailCountryViewController.swift
//  Countries
//
//  Created by Luis Morante on 26/02/24.
//

import UIKit
import SDWebImage

protocol HomeViewDetailProtocol: AnyObject{
    
    func updateDetailCountry(country: CountryResponse)
}

class DetailCountryViewController : UIViewController{
    
    var country: CountryResponse?
    var presenter : DetailPresenterProtocol?
    
    private let detailImageView : UIImageView = {
        let detailImage = UIImageView()
        detailImage.contentMode = .scaleAspectFit
        detailImage.translatesAutoresizingMaskIntoConstraints = false
        return detailImage
    }()
    
    let countryNamelabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 30, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let regionLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let capitalLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let continentLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        presenter?.getCountry()
    }
    
    init(country: CountryResponse ) {
        self.country = country
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(country: CountryResponse){
        if let imageURL = URL(string: country.flags){
            self.detailImageView.sd_setImage(with: imageURL)
        }
        self.countryNamelabel.text = country.name
        self.regionLabel.text =  "\(detailCountry.region) : \(country.region)"
        self.capitalLabel.text = "\(detailCountry.capital) : \(country.capital)"
        self.continentLabel.text = "\(detailCountry.continente) : \(country.continents)"
    }
    
    private func setupView(){
        view.addSubview(detailImageView)
        view.addSubview(countryNamelabel)
        view.addSubview(regionLabel)
        view.addSubview(capitalLabel)
        view.addSubview(continentLabel)
        
        NSLayoutConstraint.activate([
            detailImageView.centerXAnchor.constraint(equalTo:view.centerXAnchor),
            detailImageView.topAnchor.constraint(equalTo:view.topAnchor, constant:90),
            detailImageView.heightAnchor.constraint(equalToConstant: 200),
            detailImageView.widthAnchor.constraint(equalToConstant: 300),
            
            countryNamelabel.leadingAnchor.constraint(equalTo:view.leadingAnchor,constant: 20),
            countryNamelabel.trailingAnchor.constraint(equalTo:view.trailingAnchor,constant: -20),
            countryNamelabel.topAnchor.constraint(equalTo: detailImageView.bottomAnchor, constant: 20),
            
            regionLabel.leadingAnchor.constraint(equalTo:view.leadingAnchor,constant: 20),
            regionLabel.trailingAnchor.constraint(equalTo:view.trailingAnchor,constant: -20),
            regionLabel.topAnchor.constraint(equalTo: countryNamelabel.bottomAnchor, constant: 20),
            
            capitalLabel.leadingAnchor.constraint(equalTo:view.leadingAnchor,constant: 20),
            capitalLabel.trailingAnchor.constraint(equalTo:view.trailingAnchor,constant: -20),
            capitalLabel.topAnchor.constraint(equalTo: regionLabel.bottomAnchor, constant: 20),
            
            continentLabel.leadingAnchor.constraint(equalTo:view.leadingAnchor,constant: 20),
            continentLabel.trailingAnchor.constraint(equalTo:view.trailingAnchor,constant: -20),
            continentLabel.topAnchor.constraint(equalTo: capitalLabel.bottomAnchor, constant: 20),
        ])
    }
    
}

extension DetailCountryViewController: HomeViewDetailProtocol{
    
    func updateDetailCountry(country: CountryResponse) {
        self.country = country
        setup(country: country)
    }
    
}
