//
//  StarWarsListView.swift
//  StarWars
//
//  Created by Renu Punjabi on 5/6/20.
//  Copyright © 2020 Renu Punjabi. All rights reserved.
//

import Foundation
import UIKit

final class StarWarsListView: UITableView {
    
    var peopleList: [People] = [] {
        didSet {
            reloadData()
        }
    }
    let searchController = UISearchController(searchResultsController: nil)
    var activityView: UIActivityIndicatorView = UIActivityIndicatorView(style: .large)
    var didSelectStarWar: (People) -> Void = {_ in }
    var searching: (String) -> Void = { _ in }
    var refreshList: () -> Void = { }
    
    var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        registerCell()
        backgroundColor = .white
        dataSource = self
        delegate = self
        setUpSearch()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func registerCell() {
        register(StarWarListCell.self)
    }
    
    private func setUpSearch() {
       searchController.searchBar.delegate = self
       searchController.obscuresBackgroundDuringPresentation = false
       searchController.searchBar.placeholder = "Search by StarWar name"
    }
    
    @objc private func filterContentForSearchText(_ searchText: String) {
        searching(searchText)
    }
    
    //MARK: Activity Indicator methods
      
    func showActivityIndicator() {
     activityView.center = self.center
     addSubview(activityView)
     activityView.startAnimating()
    }

    func hideActivityIndicator(){
       activityView.stopAnimating()
       activityView.hidesWhenStopped = true
    }
}

extension StarWarsListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peopleList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueResuableCell(for: indexPath) as StarWarListCell
        cell.configure(peopleList[indexPath.row])
        return cell
    }
    
}

extension StarWarsListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defer {
            tableView.deselectRow(at: indexPath, animated: true)
        }
        didSelectStarWar(peopleList[indexPath.row])
    }
}

extension StarWarsListView: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        refreshList()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
         // to limit network activity, reload half a second after last key press.
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(filterContentForSearchText), object: nil)
        perform(#selector(filterContentForSearchText), with: searchText, afterDelay: 1.0)
    }
}
