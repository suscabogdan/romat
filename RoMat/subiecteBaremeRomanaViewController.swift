//
//  subiecteBaremeRomanaViewController.swift
//  Romana clasa a 8a
//
//  Created by Susca Bogdan on 10/07/2018.
//  Copyright © 2018 Susca Bogdan. All rights reserved.
//

import UIKit

class subiecteBaremeRomanaViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var image: UIImageView!
    
    var subiectActive:Bool!
    var baremActive:Bool!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    func aniBarem1Rom()
    {
        if navigationItem.title == "2018"
        {
            image.image = UIImage(named: "Barem rom1 2018.png")
        }
        else if navigationItem.title == "2017"
        {
            image.image = UIImage(named: "Barem rom1 2017.png")
        }
        if navigationItem.title == "2016"
        {
            image.image = UIImage(named: "Barem rom1 2016.png")
        }
    }
    
    func aniBarem2Rom()
    {
        if navigationItem.title == "2018"
        {
            image.image = UIImage(named: "Barem rom2 2018.png")
        }
        else if navigationItem.title == "2017"
        {
            image.image = UIImage(named: "Barem rom2 2017.png")
        }
        if navigationItem.title == "2016"
        {
            image.image = UIImage(named: "Barem rom2 2016.png")
        }
    }
    
    
    func aniSubiect1Rom()
    {
        if navigationItem.title == "2018"
        {
            image.image = UIImage(named: "Var rom1 2018.jpg")
        }
        else if navigationItem.title == "2017"
        {
            image.image = UIImage(named: "Var rom1 2017.jpg")
        }
        if navigationItem.title == "2016"
        {
            image.image = UIImage(named: "Var rom1 2016.jpg")
        }
    }
    
    func aniSubiect2Rom()
    {
        if navigationItem.title == "2018"
        {
            image.image = UIImage(named: "Var rom2 2018.jpg")
        }
        else if navigationItem.title == "2017"
        {
            image.image = UIImage(named: "Var rom2 2017.jpg")
        }
        if navigationItem.title == "2016"
        {
            image.image = UIImage(named: "Var rom2 2016.PNG")
        }
    }
    
    @IBAction func subiect(_ sender: Any) {
        subiectActive = true
        baremActive = false
        self.view.backgroundColor = UIColor.blue
        aniSubiect1Rom()
    }
    
    @IBAction func barem(_ sender: Any) {
        baremActive = true
        subiectActive = false
        self.view.backgroundColor = UIColor.red
        aniBarem1Rom()
    }
    
    
    
    @IBAction func pagina1(_ sender: Any) {
        if subiectActive == true
        {
            aniSubiect1Rom()
        }
        else if baremActive == true
        {
            aniBarem1Rom()
        }
    }
    
    @IBAction func pagina2(_ sender: Any) {
        if subiectActive == true
        {
            aniSubiect2Rom()
        }
        else if baremActive == true
        {
            aniBarem2Rom()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollView.minimumZoomScale = 1.0
        self.scrollView.maximumZoomScale = 6.0
        subiectActive = true
        self.view.backgroundColor = UIColor.blue
        navigationItem.title = aniRomana[myIndexSubiecteRomana]
        aniSubiect1Rom()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return image
    }
    
}
