//
//  extension.all.swift
//  CovidStatsApp
//
//  Created by Duash on 10/15/21.
//


import UIKit

extension UITableViewCell  {
    func configureCell (name: String) {
        self.textLabel?.text = name
    }
}

extension HomeViewController: UISearchResultsUpdating  {
    func initializeSearchController ()  {
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        searchController.searchBar.placeholder = LocalizedString.navPlaceHolder.translated
        searchController.obscuresBackgroundDuringPresentation = true
        definesPresentationContext = true
    }
    
    
    func filterCountries (using searchText: String) {
        viewModel.filteredCountries = viewModel.countries.filter({ country in
            return country.Country.lowercased().contains(searchText.lowercased())
        })
        
        DispatchQueue.main.async {
            self.contactsTv.reloadData()
        }
    }
    func updateSearchResults(for searchController: UISearchController) {
        let searchbar = searchController.searchBar
        self.filterCountries(using: searchbar.text!)
        
    }
    
    var isBeingSearched: Bool {
        return searchController.isActive && !isNotBeingSearched
    }
    
    var isNotBeingSearched: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
}


extension HomeViewController: UITableViewDataSource , UITableViewDelegate  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(viewModel.filteredCountries)
        return isBeingSearched == true ? viewModel.filteredCountries.count : viewModel.countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CountryDetailsViewCellController.reuseidentifier , for: indexPath) as! CountryDetailsViewCellController
        let countriesInProgress = isBeingSearched == true ? viewModel.filteredCountries: viewModel.countries
        cell.configure(with: countriesInProgress[indexPath.row], for: indexPath)
        return cell
    
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailview = DetailsViewController()
        let countriesInProgress = isBeingSearched == true ? viewModel.filteredCountries: viewModel.countries
        detailview.configure(with: countriesInProgress[indexPath.row])
        navigationController?.pushViewController(detailview, animated: true)
        
    }
}






