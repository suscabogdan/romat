//
//  argumentariTableViewController.swift
//  Romana clasa a 8a
//
//  Created by Susca Bogdan on 27/11/2018.
//  Copyright © 2018 Susca Bogdan. All rights reserved.
//

import UIKit

class argumentariTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        animateTable()
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
