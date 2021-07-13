//
//  algebraTableViewController.swift
//  Romana clasa a 8a
//
//  Created by Susca Bogdan on 22/02/2018.
//  Copyright © 2018 Susca Bogdan. All rights reserved.
//

import UIKit
import Foundation

var myIndexAlgebra = 0

var numarLectiiInvatateAlgebra = 0

class algebraTableViewController: UITableViewController, UISearchBarDelegate {

  //  let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animateTable()
        setMultimeInvatata()
        /*searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Cauta"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        navigationController?.navigationBar.prefersLargeTitles = true*/
    }
    
    /*func searchBarIsEmpty() -> Bool {
        
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        
    }*/
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if boolForAnimationAlgebra == false
        {
            self.tableView.reloadData()
        }
        else if boolForAnimationAlgebra == true
        {
            boolForAnimationAlgebra = false
        }
        numarLectiiInvatateAlgebra = 0
        var i = 0
        while i < algebraTitlu.count
        {
            if multimeInvatataAlgebra[i] == 3
            {
                numarLectiiInvatateAlgebra = numarLectiiInvatateAlgebra + 1
            }
            i = i + 1
        }
        self.navigationItem.title = "Algebră - " + String(numarLectiiInvatateAlgebra) + "/13"
    }
    
    func setMultimeInvatata()
    {
        var i = 0
        let salveazaCuloare = UserDefaults.standard
        while i < algebraTitlu.count
        {
            if salveazaCuloare.value(forKey: algebraTitlu[i]) != nil
            {
                let verifica = salveazaCuloare.value(forKey: algebraTitlu[i])
                multimeInvatataAlgebra[i] = verifica as! Int
            }
            i = i + 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellAlgebra", for: indexPath)
        cell.textLabel?.text = algebraTitlu[indexPath.row]
        let salveazaCuloare = UserDefaults.standard
        if salveazaCuloare.value(forKey: algebraTitlu[indexPath.row]) != nil
        {
            let culoare = salveazaCuloare.value(forKey: algebraTitlu[indexPath.row]) as! NSInteger
            if culoare == 2
            {
                cell.contentView.backgroundColor = UIColor.yellow
                cell.textLabel?.backgroundColor = UIColor.yellow
            }
            if culoare == 3
            {
                cell.contentView.backgroundColor = UIColor.green
                cell.textLabel?.backgroundColor = UIColor.green
            }
            if culoare == 1
            {
                cell.contentView.backgroundColor = UIColor.white
                cell.textLabel?.backgroundColor = UIColor.white
            }
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return algebraTitlu.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        myIndexAlgebra = indexPath.row
        performSegue(withIdentifier: "segueAlgebra", sender: self)
    }

    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    func animateTable() {
        tableView.reloadData()
        let cells = tableView.visibleCells
        let tableViewHeight = tableView.bounds.size.height
        for cell in cells {
            cell.transform = CGAffineTransform(translationX: 0, y: tableViewHeight)
        }
        var delayCounter = 0
        for cell in cells {
            UIView.animate(withDuration: 0.75, delay: Double(delayCounter) * 0.05, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {cell.transform = CGAffineTransform.identity}, completion: nil)
            delayCounter += 1
        }
    }
    
}
/*extension algebraTableViewController : UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}*/
