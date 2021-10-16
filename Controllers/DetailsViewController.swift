//
//  DetailsViewController.swift
//  CovidStatsApp
//
//  Created by Duash on 10/15/21.
//

import UIKit

class DetailsViewController: UIViewController , selfConfiguringViewController{
    let containerView: UIView  = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 15
        view.layer.borderWidth = 3
        view.layer.borderColor = UIColor.darkGray.cgColor
        view.layer.shadowColor = UIColor.darkGray.cgColor
        view.layer.shadowOpacity = 0.9
        return view
    }()
    
    let NewConfirmedLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.textAlignment = .center
        nameLabel.backgroundColor = .lightGray
        nameLabel.textColor = .white
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    
    let TotalConfirmedfirmedLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.textAlignment = .center
        nameLabel.backgroundColor = .lightGray
        nameLabel.textColor = .white
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    
    
    let NewDeathsLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.textAlignment = .center
        nameLabel.backgroundColor = .lightGray
        nameLabel.textColor = .white
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    
    let TotalDeathsLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.textAlignment = .center
        nameLabel.backgroundColor = .lightGray
        nameLabel.textColor = .white
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    
    
    let NewRecoveredLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.textAlignment = .center
        nameLabel.backgroundColor = .lightGray
        nameLabel.textColor = .white
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    
    let TotalRecoveredLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.textAlignment = .center
        nameLabel.backgroundColor = .lightGray
        nameLabel.textColor = .white
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let stackview = UIStackView(arrangedSubviews: [
            NewConfirmedLabel,TotalConfirmedfirmedLabel,NewDeathsLabel,TotalDeathsLabel,NewRecoveredLabel,TotalRecoveredLabel
        ])
        containerView.addSubview(stackview)
        stackview.axis = .vertical
        stackview.distribution = .fillEqually
        stackview.spacing = 10
        stackview.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor , constant: 20),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor , constant: -20),
            containerView.topAnchor.constraint(equalTo: view.topAnchor , constant: 20),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor , constant: -20),
            
            
            
            containerView.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor , constant: 20),
            containerView.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor , constant: -20),
            containerView.safeAreaLayoutGuide.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor , constant: 20),
            containerView.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor , constant: -20),
            
            
            
            
            stackview.leadingAnchor.constraint(equalTo: containerView.leadingAnchor , constant: 20),
            stackview.trailingAnchor.constraint(equalTo: containerView.trailingAnchor , constant: -20),
            stackview.topAnchor.constraint(equalTo: containerView.topAnchor , constant: 20),
            stackview.bottomAnchor.constraint(equalTo: containerView.bottomAnchor , constant: -20)
            
            
        ])
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: UIButton(type: .system))
        navigationItem.title = "Afghanistan"
      
        
    }
    
    func configure(with country: Country) {
        NewDeathsLabel.text =  LocalizedString.newDeaths.translated  +  ":  " +    String(country.NewDeaths)
        NewConfirmedLabel.text =  LocalizedString.newConfirmed.translated  +  ":  " +   String(country.NewConfirmed)
        TotalConfirmedfirmedLabel.text =  LocalizedString.totalConfirmed.translated  +  ":  " +   String(country.TotalConfirmed)
        TotalRecoveredLabel.text =  LocalizedString.totalRecovered.translated  +  ":  " +  String(country.TotalRecovered)
        TotalDeathsLabel.text =   LocalizedString.totalDeaths.translated  +  ":  " +  String(country.TotalDeaths)
        NewRecoveredLabel.text =   LocalizedString.newRecovered.translated  +  ":  " +  String(country.TotalRecovered)
        
    }
   
}
