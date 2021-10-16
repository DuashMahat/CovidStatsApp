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
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(contactsTv);
        self.response()
        self.initializeSearchController()
        self.forViewDidLoad()
        
    }
    
    
    func response() {
        viewModel.viewModelResponse(for: ApiPath.path()) { [weak self] (_) in
            DispatchQueue.main.async {
                self?.contactsTv.reloadData()
            }
        }
    }
   
    
    func forViewDidLoad () {
        contactsTv.translatesAutoresizingMaskIntoConstraints = false
        contactsTv.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        contactsTv.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        contactsTv.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        contactsTv.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        contactsTv.backgroundColor = .systemBackground
        contactsTv.register(CountryDetailsViewCellController.self, forCellReuseIdentifier: CountryDetailsViewCellController.reuseidentifier)
        contactsTv.dataSource = self
        contactsTv.delegate = self
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = LocalizedString.covidStatsNavTitle.translated
    }
}

