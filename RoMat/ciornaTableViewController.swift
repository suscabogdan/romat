//
//  ciornaTableViewController.swift
//  Romana clasa a 8a
//
//  Created by Susca Bogdan on 15/07/2018.
//  Copyright © 2018 Susca Bogdan. All rights reserved.
//

import UIKit
import CoreData

var titluCiorne:[String] = []
var textCiorne:[String] = []

var myCiorneIndex = 0

var addIndex:Bool = false

class ciornaTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addIndex = false
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.add, target: self, action: #selector(ciornaTableViewController.addItem))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView.reloadData()
        addIndex = false
    }

    func addItem()
    {
        performSegue(withIdentifier: "addCiornaSegue", sender: self)
        addIndex = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return titluCiorne.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellCiorna", for: indexPath)
        cell.textLabel!.text = titluCiorne[indexPath.row]
            return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        myCiorneIndex = indexPath.row
        
        performSegue(withIdentifier: "addCiornaSegue", sender: self)
        
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.delete
        {
            titluCiorne.remove(at: indexPath.row)
            
            self.tableView.reloadData()
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            
            let context = appDelegate.persistentContainer.viewContext
            
            _ = NSEntityDescription.insertNewObject(forEntityName: "Compunere", into: context)
            
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Compunere")
            
            request.returnsObjectsAsFaults = false
            
            if let result = try? context.fetch(request)
            {
                for object in result
                {
                    context.delete(object as! NSManagedObject)
                    self.tableView.reloadData()
                }
            }
            
            self.tableView.reloadData()
        }
    }
    
}
