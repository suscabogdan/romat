//
//  algebraDetailsViewController.swift
//  Romana clasa a 8a
//
//  Created by Susca Bogdan on 09/05/2018.
//  Copyright © 2018 Susca Bogdan. All rights reserved.
//

import UIKit

class algebraDetailsViewController: UIViewController, UIScrollViewDelegate {

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
            
            navigationItem.title = algebraTitlu[myIndexAlgebra]
            if navigationItem.title == "Multimi numerice"
            {
                navigationController?.navigationBar.prefersLargeTitles = true
                myImage.image = UIImage(named: "Multimi_numerice.png")
            }
            else if navigationItem.title == "Divizibilitate in N"
            {
                navigationController?.navigationBar.prefersLargeTitles = true
                myImage.image = UIImage(named: "Divizibilitate_in_N.png")
            }
            else if navigationItem.title == "Puteri"
            {
                navigationController?.navigationBar.prefersLargeTitles = true
                myImage.image = UIImage(named: "Puteri.png")
            }
            else if navigationItem.title == "Fractii ordinare/zecimale"
            {
                navigationController?.navigationBar.prefersLargeTitles = false
                myImage.image = UIImage(named: "Fractii.png")
            }
            else if navigationItem.title == "Media aritmetica/geometrica"
            {
                navigationController?.navigationBar.prefersLargeTitles = false
                myImage.image = UIImage(named: "Medii.png")
            }
            else if navigationItem.title == "Modulul unui numar real |x|"
            {
                navigationController?.navigationBar.prefersLargeTitles = false
                myImage.image = UIImage(named: "Modulul.png")
            }
            else if navigationItem.title == "[x]; {x}"
            {
                navigationController?.navigationBar.prefersLargeTitles = true
                myImage.image = UIImage(named: "Partea_intreaga:fractionara.png")
            }
            else if navigationItem.title == "Radacina patrata (radicalul)"
            {
                navigationController?.navigationBar.prefersLargeTitles = false
                myImage.image = UIImage(named: "Radicali.png")
            }
            else if navigationItem.title == "Intervale in R"
            {
                navigationController?.navigationBar.prefersLargeTitles = true
                myImage.image = UIImage(named: "Intervale_in_R.png")
            }
            else if navigationItem.title == "Formule de calcul prescurtat"
            {
                navigationController?.navigationBar.prefersLargeTitles = false
                myImage.image = UIImage(named: "Calcul_prescurtat.png")
            }
            else if navigationItem.title == "Produsul cartezian"
            {
                myImage.image = UIImage(named: "Produsul_cartezian.png")
            }
            else if navigationItem.title == "Functii"
            {
                navigationController?.navigationBar.prefersLargeTitles = true
                myImage.image = UIImage(named: "Functii.png")
            }
            else if navigationItem.title == "Ecuatia de gradul al II-lea"
            {
                navigationController?.navigationBar.prefersLargeTitles = false
                myImage.image = UIImage(named: "Ecuatia_grad2.png")
            }
        }
        else
        {
            if myIndexAlgebra <= 2
            {
                self.scrollView.minimumZoomScale = 1.0
                self.scrollView.maximumZoomScale = 6.0
                label.text = "Sursa: Culegerea Evaluare Nationala Matematica Consolidare" + "\n" + "Editura: Paralela 45"
                navigationItem.title = algebraTitlu[myIndexAlgebra]
                if navigationItem.title == "Multimi numerice"
                {
                    navigationController?.navigationBar.prefersLargeTitles = true
                    myImage.image = UIImage(named: "Multimi_numerice.png")
                }
                else if navigationItem.title == "Divizibilitate in N"
                {
                    navigationController?.navigationBar.prefersLargeTitles = true
                    myImage.image = UIImage(named: "Divizibilitate_in_N.png")
                }
                else if navigationItem.title == "Puteri"
                {
                    navigationController?.navigationBar.prefersLargeTitles = true
                    myImage.image = UIImage(named: "Puteri.png")
                }
            }
            else
            {
                navigationItem.title = algebraTitlu[myIndexAlgebra]
                label.text = "Aceasta este o versiune gratuita a aplicatiei. Deblocheaza toata aplicatia pentru numai 9,99 lei!"
                if navigationItem.title == "Fractii ordinare/zecimale"
                {
                    navigationController?.navigationBar.prefersLargeTitles = false
                }
                else if navigationItem.title == "Media aritmetica/geometrica"
                {
                    navigationController?.navigationBar.prefersLargeTitles = false
                }
                else if navigationItem.title == "Modulul unui numar real |x|"
                {
                    navigationController?.navigationBar.prefersLargeTitles = false
                }
                else if navigationItem.title == "[x]; {x}"
                {
                    navigationController?.navigationBar.prefersLargeTitles = true
                }
                else if navigationItem.title == "Radacina patrata (radicalul)"
                {
                    navigationController?.navigationBar.prefersLargeTitles = false
                }
                else if navigationItem.title == "Intervale in R"
                {
                    navigationController?.navigationBar.prefersLargeTitles = true
                }
                else if navigationItem.title == "Formule de calcul prescurtat"
                {
                    navigationController?.navigationBar.prefersLargeTitles = false
                }
                else if navigationItem.title == "Produsul cartezian"
                {
                }
                else if navigationItem.title == "Functii"
                {
                    navigationController?.navigationBar.prefersLargeTitles = true
                }
                else if navigationItem.title == "Ecuatia de gradul al II-lea"
                {
                    navigationController?.navigationBar.prefersLargeTitles = false
                }
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if multimeInvatataAlgebra[myIndexAlgebra] == 2
        {
            self.navigationController?.navigationBar.barTintColor = UIColor.yellow
        }
        if multimeInvatataAlgebra[myIndexAlgebra] == 3
        {
            self.navigationController?.navigationBar.barTintColor = UIColor.green
        }
        if multimeInvatataAlgebra[myIndexAlgebra] == 1
        {
            self.navigationController?.navigationBar.barTintColor = UIColor.white
        }
        
        let salveazaCuloare = UserDefaults.standard
        if salveazaCuloare.value(forKey: algebraTitlu[myIndexAlgebra]) != nil
        {
            let culoare = salveazaCuloare.value(forKey: algebraTitlu[myIndexAlgebra]) as! NSInteger
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
            multimeInvatataAlgebra[myIndexAlgebra] = 3
            self.navigationController?.navigationBar.barTintColor = UIColor.green
            self.saveProgress()
        }))
        alert.addAction(UIAlertAction(title: "Lectie in curs de invatare", style: UIAlertAction.Style.default, handler:{ (action) in
            multimeInvatataAlgebra[myIndexAlgebra] = 2
            self.navigationController?.navigationBar.barTintColor = UIColor.yellow
            self.saveProgress()
        }))
        alert.addAction(UIAlertAction(title: "Lectie neinvatata", style: UIAlertAction.Style.default, handler:{ (action) in
            multimeInvatataAlgebra[myIndexAlgebra] = 1
            self.navigationController?.navigationBar.barTintColor = UIColor.white
            self.saveProgress()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func saveProgress()
    {
        let salveazaCuloare = UserDefaults.standard
        if multimeInvatataAlgebra[myIndexAlgebra] == 2
        {
            salveazaCuloare.setValue(2, forKey: algebraTitlu[myIndexAlgebra])
        }
        if multimeInvatataAlgebra[myIndexAlgebra] == 3
        {
            salveazaCuloare.setValue(3, forKey: algebraTitlu[myIndexAlgebra])
        }
        if multimeInvatataAlgebra[myIndexAlgebra] == 1
        {
            salveazaCuloare.setValue(1, forKey: algebraTitlu[myIndexAlgebra])
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return myImage
    }
  
}
