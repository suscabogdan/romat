//
//  listaSubiecteRomanaTableViewController.swift
//  Romana clasa a 8a
//
//  Created by Susca Bogdan on 12/06/2018.
//  Copyright © 2018 Susca Bogdan. All rights reserved.
//

import UIKit

var aniRomana = ["2018", "2017", "2016"]
var myIndexSubiecteRomana = 0

class listaSubiecteRomanaTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        animateTable()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return aniRomana.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellSubiecteRomana", for: indexPath)
        cell.textLabel!.text = aniRomana[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndexSubiecteRomana = indexPath.row
        performSegue(withIdentifier: "segueSubiecteRomana", sender: self)
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
