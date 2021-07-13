//
//  TableViewController.swift
//  Romana clasa a 8a
//
//  Created by Susca Bogdan on 31/01/2018.
//  Copyright © 2018 Susca Bogdan. All rights reserved.
//

import UIKit
import Foundation

var myIndex = 0

class TableViewController: UITableViewController, UISearchBarDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animateTable()
        setMultimeInvatata()
        let salveazaCuloare = UserDefaults.standard
        if salveazaCuloare.value(forKey: "verificaDacaAFostFacutVreunTest") == nil
        {
            valoareaInitialaSalvataInUserDefaults()
        }
    }
    
    func setMultimeInvatata()
    {
        var i = 0
        let salveazaCuloare = UserDefaults.standard
        while i < subiect.count
        {
            if salveazaCuloare.value(forKey: subiect[i]) != nil
            {
                let verifica = salveazaCuloare.value(forKey: subiect[i])
                multimeInvatataLiteratura[i] = verifica as! Int
            }
            i = i + 1
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        if boolForAnimationLiteratura == false
        {
            self.tableView.reloadData()
        }
        else if boolForAnimationLiteratura == true
        {
            boolForAnimationLiteratura = false
        }
        numarLectiiInvatateLiteratura = 0
        var i = 0
        while i < subiect.count
        {
            if multimeInvatataLiteratura[i] == 3
            {
                numarLectiiInvatateLiteratura = numarLectiiInvatateLiteratura + 1
            }
            i = i + 1
        }
        self.navigationItem.title = "Literatură - " + String(numarLectiiInvatateLiteratura) + "/11"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return subiect.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel!.text = subiect[indexPath.row]
        let salveazaCuloare = UserDefaults.standard
        if salveazaCuloare.value(forKey: subiect[indexPath.row]) != nil
        {
            let culoare = salveazaCuloare.value(forKey: subiect[indexPath.row]) as! NSInteger
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

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        myIndex = indexPath.row
        performSegue(withIdentifier: "segueLit", sender: self)
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
    
    func valoareaInitialaSalvataInUserDefaults()
    {
        var i = 0
        let salveazaCuloare = UserDefaults.standard
        while i < subiect.count
        {
            salveazaCuloare.setValue(1, forKey: subiect[i])
            i = i + 1
        }
        salveazaCuloare.setValue(1, forKey: "verificaDacaAFostFacutVreunTest")
    }
    
}
