//
//  geometrieTableViewController.swift
//  Romana clasa a 8a
//
//  Created by Susca Bogdan on 22/02/2018.
//  Copyright © 2018 Susca Bogdan. All rights reserved.
//

import UIKit

var myIndexGeome = 0

var numarLectiiInvatateGeometrie = 0

class geometrieTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        
        animateTable()
        setMultimeInvatata()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if boolForAnimationGeometrie == false
        {
            self.tableView.reloadData()
        }
        else if boolForAnimationGeometrie == true
        {
            boolForAnimationGeometrie = false
        }
        numarLectiiInvatateGeometrie = 0
        var i = 0
        while i < geomeTitlu.count
        {
            if multimeInvatataGeometrie[i] == 3
            {
                numarLectiiInvatateGeometrie = numarLectiiInvatateGeometrie + 1
            }
            i = i + 1
        }
        self.navigationItem.title = "Geometrie - " + String(numarLectiiInvatateGeometrie) + "/11"
    }
    
    func setMultimeInvatata()
    {
        var i = 0
        let salveazaCuloare = UserDefaults.standard
        while i < geomeTitlu.count
        {
            if salveazaCuloare.value(forKey: geomeTitlu[i]) != nil
            {
                let verifica = salveazaCuloare.value(forKey: geomeTitlu[i])
                multimeInvatataGeometrie[i] = verifica as! Int
            }
            i = i + 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellGeometrie", for: indexPath)
        cell.textLabel!.text = geomeTitlu[indexPath.row]
        let salveazaCuloare = UserDefaults.standard
        if salveazaCuloare.value(forKey: geomeTitlu[indexPath.row]) != nil
        {
            let culoare = salveazaCuloare.value(forKey: geomeTitlu[indexPath.row]) as! NSInteger
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
        return geomeTitlu.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        myIndexGeome = indexPath.row
        performSegue(withIdentifier: "segueGeome", sender: self)
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
