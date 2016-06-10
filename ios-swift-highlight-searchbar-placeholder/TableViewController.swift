//
//  TableViewController.swift
//  ios-swift-highlight-searchbar-placeholder
//
//  Created by Yong Su on 6/10/16.
//  Copyright © 2016 Yong Su. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, UISearchResultsUpdating, UISearchBarDelegate {
    
    var searchController: UISearchController!
    
    var names = ["Apple", "Box", "Facebook", "Google"]

    override func viewDidLoad() {
        super.viewDidLoad()

        configSearchController()
    }
    
    func configSearchController() {
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = true
        searchController.hidesNavigationBarDuringPresentation = false
        
        let searchBar = searchController.searchBar
        searchBar.sizeToFit()
        searchBar.delegate = self
        configPlaceholder(searchBar)
        
        // Add the search bar to the top
        navigationItem.titleView = searchBar
        
        definesPresentationContext = true
    }
    
    func configPlaceholder(searchBar: UISearchBar) {
        let placeholder = "Search in Swift iOS Development"
        let keyword = "Swift iOS Development"
        let range = (placeholder as NSString).rangeOfString(keyword)
        
        let attributedString = NSMutableAttributedString(string: placeholder)
        attributedString.addAttribute(NSForegroundColorAttributeName, value: UIColor.blueColor(), range: range)
        
        let searchTextField = searchBar.valueForKey("searchField") as? UITextField
        searchTextField?.attributedPlaceholder = attributedString
    }
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        let searchBar = searchController.searchBar
        searchBar.placeholder = "Search"
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        let searchBar = searchController.searchBar
        configPlaceholder(searchBar)
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        // Perform the search here...
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        cell.textLabel?.text = names[indexPath.row]
        return cell
    }

}
