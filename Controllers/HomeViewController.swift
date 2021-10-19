//
//  HomeViewController.swift
//  CovidStatsApp
//
//  Created by Duash on 10/15/21.
//

import UIKit

class HomeViewController: UIViewController {

    let contactsTv = UITableView()
    var viewModel = ViewModel()
    let searchController = UISearchController(searchResultsController: nil)
    let spinner = UIActivityIndicatorView(style: .medium)
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(contactsTv);
        contactsTv.backgroundView = spinner
        self.initializeSearchController()
        self.forViewDidLoad()
        self.spinner.startAnimating()
        self.response()
        self.spinner.stopAnimating()
       
        
    }
    
    
    func response() {
        viewModel.viewModelResponse(for: ApiPath.path()) { [weak self] (_) in
            DispatchQueue.main.async { [self] in
                self?.contactsTv.reloadData()
            }
        }
    }
   
    
    func forViewDidLoad () {
        
        
        NSLayoutConstraint.activate([
            contactsTv.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contactsTv.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contactsTv.topAnchor.constraint(equalTo: view.topAnchor),
            contactsTv.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        contactsTv.translatesAutoresizingMaskIntoConstraints = false
        contactsTv.backgroundColor = .systemBackground
        contactsTv.register(CountryDetailsViewCellController.self, forCellReuseIdentifier: CountryDetailsViewCellController.reuseidentifier)
        contactsTv.dataSource = self
        contactsTv.delegate = self
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = LocalizedString.covidStatsNavTitle.translated
    }
    
    
    
  
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        if viewModel.countries.count == 0  && viewModel.filteredCountries.count == 0 {
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
//                self.spinner.startAnimating()
//            }
//        }
//    }
}

