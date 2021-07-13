//
//  calculatorTableViewController.swift
//  Romana clasa a 8a
//
//  Created by Susca Bogdan on 22/02/2018.
//  Copyright © 2018 Susca Bogdan. All rights reserved.
//

import UIKit

class calculatorTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        
        //let searchController = UISearchController(searchResultsController: nil)
       // navigationItem.searchController = searchController
        
        animateTable()
    }
    
    /*
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    */
    
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
