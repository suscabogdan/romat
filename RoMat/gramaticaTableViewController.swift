//
//  TableViewController.swift
//  Romana clasa a 8a
//
//  Created by Susca Bogdan on 31/01/2018.
//  Copyright © 2018 Susca Bogdan. All rights reserved.
//

import UIKit

var myIndex2 = 0

var numarLectiiInvatateGramatica = 0

class gramaticaTableViewController: UITableViewController{
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return parti.count
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animateTable()
        setMultimeInvatata()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if boolForAnimationGramatica == false
        {
            self.tableView.reloadData()
        }
        else if boolForAnimationGramatica == true
        {
            boolForAnimationGramatica = false
        }
        numarLectiiInvatateGramatica = 0
        var i = 0
        while i < subiect.count
        {
            if multimeInvatataLaGramatica[i] == 3
            {
                numarLectiiInvatateGramatica = numarLectiiInvatateGramatica + 1
            }
            i = i + 1
        }
        self.navigationItem.title = "Gramatică - " + String(numarLectiiInvatateGramatica) + "/14"
    }
    
    func setMultimeInvatata()
    {
        var i = 0
        let salveazaCuloare = UserDefaults.standard
        while i < parti.count
        {
            if salveazaCuloare.value(forKey: parti[i]) != nil
            {
                let verifica = salveazaCuloare.value(forKey: parti[i])
                multimeInvatataLaGramatica[i] = verifica as! Int
            }
            i = i + 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellGram", for: indexPath)
        cell.textLabel?.text = parti[indexPath.row]
        let salveazaCuloare = UserDefaults.standard
        if salveazaCuloare.value(forKey: parti[indexPath.row]) != nil
        {
            let culoare = salveazaCuloare.value(forKey: parti[indexPath.row]) as! NSInteger
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
        myIndex2 = indexPath.row
        performSegue(withIdentifier: "segue6", sender: self)
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
