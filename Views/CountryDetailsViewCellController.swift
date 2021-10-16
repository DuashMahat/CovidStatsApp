//
//  CountryDetailsViewCellController.swift
//  CovidStatsApp
//
//  Created by Duash on 10/15/21.
//

import UIKit

class CountryDetailsViewCellController: UITableViewCell , SelfConfiguringCell {
    
    
    let countryName: UILabel = {
        let countryName = UILabel()
        countryName.textAlignment = .center
        countryName.layer.cornerRadius = 15
        countryName.layer.borderColor  = UIColor.white.cgColor
        countryName.translatesAutoresizingMaskIntoConstraints = false
        countryName.setContentHuggingPriority(.required, for: .horizontal)
        return countryName
    }()
    
    
    let countryImage: UIImageView = {
        let countryImage = UIImageView()
        countryImage.layer.cornerRadius = 35
        countryImage.clipsToBounds = true
        countryImage.translatesAutoresizingMaskIntoConstraints = false
        countryImage.contentMode = .scaleAspectFit
        countryImage.setContentHuggingPriority(.required, for: .horizontal)
        return countryImage
        
    }()
    
    
    let spacingView: UILabel = {
        let sview = UILabel()
        sview.translatesAutoresizingMaskIntoConstraints = false
        sview.backgroundColor = .lightGray
        return sview
    }()
    
    
    let cImageView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 15
        view.layer.borderWidth = 3
        view.layer.borderColor = UIColor.darkGray.cgColor
        view.layer.shadowColor = UIColor.darkGray.cgColor
        view.layer.shadowOpacity = 0.9
        return view
    }()
    
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let stackview = UIStackView(arrangedSubviews: [countryName , UIView() ,countryImage])
        self.selectionStyle  = .none
        cImageView.addSubview(stackview)
        stackview.axis = .horizontal
        stackview.distribution = .fillEqually
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.backgroundColor = .lightGray
        self.contentView.addSubview(cImageView)
        
        
        
        
        NSLayoutConstraint.activate([
            
            
            cImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor , constant: 20),
            cImageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor , constant: -20),
            cImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor , constant: 20),
            cImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor , constant: -20),
            
            
            
            
            stackview.leadingAnchor.constraint(equalTo: self.cImageView.leadingAnchor , constant: 10),
            stackview.trailingAnchor.constraint(equalTo: self.cImageView.trailingAnchor , constant: -10),
            stackview.topAnchor.constraint(equalTo: self.cImageView.topAnchor , constant: 10),
            stackview.bottomAnchor.constraint(equalTo: self.cImageView.bottomAnchor , constant: -10),
        ])
    }
    
    
    static var reuseidentifier: String = "SelfConfiguringCell"
    
    func configure(with country: Country, for indexpath: IndexPath) {
        countryImage.image = UIImage(named: country.CountryCode.lowercased())
        countryName.text = country.Country
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

