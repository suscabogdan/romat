//
//  geometrieTeorieViewController.swift
//  Romana clasa a 8a
//
//  Created by Susca Bogdan on 09/05/2018.
//  Copyright © 2018 Susca Bogdan. All rights reserved.
//

import UIKit

class geometrieTeorieViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBAction func stareaLectiei(_ sender: Any) {
        createAlert(title: "Starea lectiei", message: "Ai invatat lectia?")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if checkIfRoMatIdPaid == true
        {
            self.scrollView.minimumZoomScale = 1.0
            self.scrollView.maximumZoomScale = 6.0
            label.text = "Sursa: Culegerea Evaluare Nationala Matematica Consolidare" + "\n" + "Editura: Paralela 45"
            
            navigationItem.title = geomeTitlu[myIndexGeome]
            if navigationItem.title == "Unitati de masura"
            {
                myImage.image = UIImage(named: "Unitati.png")
            }
            else if navigationItem.title == "Unghiul"
            {
                myImage.image = UIImage(named: "Unghiul.png")
            }
            else if navigationItem.title == "Triunghiul"
            {
                myImage.image = UIImage(named: "Triunghiul.jpg")
            }
            else if navigationItem.title == "Linii importante in triunghi"
            {
                navigationController?.navigationBar.prefersLargeTitles = false
                myImage.image = UIImage(named: "Linii importante.jpg")
            }
            else if navigationItem.title == "Triunghiuri speciale"
            {
                navigationController?.navigationBar.prefersLargeTitles = false
                myImage.image = UIImage(named: "Triunghiuri speciale.png")
            }
            else if navigationItem.title == "Patrulatere"
            {
                myImage.image = UIImage(named: "Patrulatere.jpg")
            }
            else if navigationItem.title == "Relatii metrice"
            {
                myImage.image = UIImage(named: "Relatii metrice.jpg")
            }
            else if navigationItem.title == "Arii"
            {
                myImage.image = UIImage(named: "Arii.jpg")
            }
            else if navigationItem.title == "Cercul"
            {
                myImage.image = UIImage(named: "Cercul.png")
            }
            else if navigationItem.title == "Poligoane regulate"
            {
                myImage.image = UIImage(named: "Poligoane regulate.png")
            }
            else if navigationItem.title == "Elemente de geometrie in spatiu"
            {
                navigationController?.navigationBar.prefersLargeTitles = false
                myImage.image = UIImage(named: "Elemente4.png")
            }
        }
        else
        {
            if myIndexGeome <= 2
            {
                self.scrollView.minimumZoomScale = 1.0
                self.scrollView.maximumZoomScale = 6.0
                label.text = "Sursa: Culegerea Evaluare Nationala Matematica Consolidare" + "\n" + "Editura: Paralela 45"
                
                navigationItem.title = geomeTitlu[myIndexGeome]
                if navigationItem.title == "Unitati de masura"
                {
                    myImage.image = UIImage(named: "Unitati.png")
                }
                else if navigationItem.title == "Unghiul"
                {
                    myImage.image = UIImage(named: "Unghiul.png")
                }
                else if navigationItem.title == "Triunghiul"
                {
                    myImage.image = UIImage(named: "Triunghiul.jpg")
                }
            }
            else
            {
                navigationItem.title = geomeTitlu[myIndexGeome]
                if navigationItem.title == "Linii importante in triunghi"
                {
                    navigationController?.navigationBar.prefersLargeTitles = false
                }
                else if navigationItem.title == "Triunghiuri speciale"
                {
                    navigationController?.navigationBar.prefersLargeTitles = false
                }
                else if navigationItem.title == "Elemente de geometrie in spatiu"
                {
                    navigationController?.navigationBar.prefersLargeTitles = false
                }
                label.text = "Aceasta este o versiune gratuita a aplicatiei. Deblocheaza toata aplicatia pentru numai 9,99 lei!"
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if multimeInvatataGeometrie[myIndexGeome] == 2
        {
            self.navigationController?.navigationBar.barTintColor = UIColor.yellow
        }
        if multimeInvatataGeometrie[myIndexGeome] == 3
        {
            self.navigationController?.navigationBar.barTintColor = UIColor.green
        }
        if multimeInvatataGeometrie[myIndexGeome] == 1
        {
            self.navigationController?.navigationBar.barTintColor = UIColor.white
        }
        
        let salveazaCuloare = UserDefaults.standard
        if salveazaCuloare.value(forKey: geomeTitlu[myIndexGeome]) != nil
        {
            let culoare = salveazaCuloare.value(forKey: geomeTitlu[myIndexGeome]) as! NSInteger
            if culoare == 2
            {
                self.navigationController?.navigationBar.barTintColor = UIColor.yellow
            }
            if culoare == 3
            {
                self.navigationController?.navigationBar.barTintColor = UIColor.green
            }
            if culoare == 1
            {
                self.navigationController?.navigationBar.barTintColor = UIColor.white
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.navigationBar.barTintColor = UIColor.white
    }

    func createAlert(title: String, message: String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Lectie invatata", style: UIAlertAction.Style.default, handler:{ (action) in
            multimeInvatataGeometrie[myIndexGeome] = 3
            self.navigationController?.navigationBar.barTintColor = UIColor.green
            self.saveProgress()
        }))
        alert.addAction(UIAlertAction(title: "Lectie in curs de invatare", style: UIAlertAction.Style.default, handler:{ (action) in
            multimeInvatataGeometrie[myIndexGeome] = 2
            self.navigationController?.navigationBar.barTintColor = UIColor.yellow
            self.saveProgress()
        }))
        alert.addAction(UIAlertAction(title: "Lectie neinvatata", style: UIAlertAction.Style.default, handler:{ (action) in
            multimeInvatataGeometrie[myIndexGeome] = 1
            self.navigationController?.navigationBar.barTintColor = UIColor.white
            self.saveProgress()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func saveProgress()
    {
        let salveazaCuloare = UserDefaults.standard
        if multimeInvatataGeometrie[myIndexGeome] == 2
        {
            salveazaCuloare.setValue(2, forKey: geomeTitlu[myIndexGeome])
        }
        if multimeInvatataGeometrie[myIndexGeome] == 3
        {
            salveazaCuloare.setValue(3, forKey: geomeTitlu[myIndexGeome])
        }
        if multimeInvatataGeometrie[myIndexGeome] == 1
        {
            salveazaCuloare.setValue(1, forKey: geomeTitlu[myIndexGeome])
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return myImage
    }
    
}
