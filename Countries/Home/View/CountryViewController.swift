//
//  PostViewController.swift
//  Countries
//
//  Created by Luis Morante on 20/02/24.
//

import UIKit
import Foundation
import SDWebImage

protocol HomeViewProtocol : AnyObject {
    
    func updateDataCountries(countries: [CountryResponse])
    func updateDataCountriesFiltered(countries: [CountryResponse])
    
}

class CountryViewController: UIViewController, UISearchControllerDelegate , UISearchResultsUpdating {
    
    private let loadingView = LoadingView()
    private let tableView: UITableView = {
        let tableview = UITableView()
        tableview.backgroundColor = .systemBackground
        tableview.register(CustomTableViewCellCountry.self, forCellReuseIdentifier: CustomTableViewCellCountry.identifier)
        return tableview
    }()
    
    var presenter: HomePresenterInputProtocol?
    let searchController : UISearchController = UISearchController(searchResultsController: nil )

    private var listCountries: [CountryResponse] = []{
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
   
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupUI()
        setupLoadingView()
        setupSearchController()
        tableView.dataSource = self
        tableView.delegate = self
        HomeConfigurator.createModuleHome(view: self)
        presenter?.getCountries()
        loadingView.startAnimating()
        
    }
    
    private func setupLoadingView() {
        
        view.addSubview(loadingView)
        loadingView.backgroundColor = UIColor(white: 1, alpha: 0)
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            loadingView.topAnchor.constraint(equalTo: view.topAnchor),
            loadingView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loadingView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            loadingView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        loadingView.isHidden = false
        loadingView.isUserInteractionEnabled = false
        
    }
    
    private func setupUI() {
        
        navigationItem.title = listCountry.title
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ])
        
    }
    
    private func setupSearchController() {
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = listCountry.search
        navigationItem.searchController = searchController
        definesPresentationContext = false
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
        searchController.searchBar.showsBookmarkButton = true
        searchController.searchBar.setImage(UIImage(systemName: "questionmark"),for: .bookmark, state: .normal)
        
    }
        
    private func showAlert(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }

    public func inSearchMode(_ searchController: UISearchController) -> Bool {
        
        let isActive = searchController.isActive
        let searchText = searchController.searchBar.text ?? ""
        return isActive && !searchText.isEmpty
        
    }
    
    public func updateSearchController(searchBarText: String) -> [CountryResponse] {
        
        return searchBarText.isEmpty ? listCountries : listCountries.filter {
            $0.name.lowercased().contains(searchBarText.lowercased())
        }
        
    }
    
    func updateSearchResults(for searchController: UISearchController) {}
    
}

extension CountryViewController : HomeViewProtocol {
    
    func updateDataCountriesFiltered(countries: [CountryResponse]) {
        listCountries = countries
    }
    
    func updateDataCountries(countries: [CountryResponse]) {
        listCountries = countries
        loadingView.stopAnimating()
    }
    
}

extension CountryViewController : UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        presenter?.searchCountry(name: searchText)
    }
    
}

extension CountryViewController : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listCountries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCellCountry.identifier, for: indexPath) as? CustomTableViewCellCountry else {
            return UITableViewCell()
        }
        
        let country = listCountries[indexPath.row]
        cell.setup(country: country)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let country = listCountries[indexPath.row]
        presenter?.selectCountry(country: country)
    }
    
}
