//
//  subiecteBaremeMatematicaViewController.swift
//  Romana clasa a 8a
//
//  Created by Susca Bogdan on 10/07/2018.
//  Copyright © 2018 Susca Bogdan. All rights reserved.
//

import UIKit

class subiecteBaremeMatematicaViewController: UIViewController, UIScrollViewDelegate {

    var subiectActive:Bool!
    var baremActive:Bool!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var image: UIImageView!
    
    func aniBarem1Mate()
    {
        if navigationItem.title == "2018"
        {
            image.image = UIImage(named: "Barem mate1 2018.jpg")
        }
        else if navigationItem.title == "2017"
        {
            image.image = UIImage(named: "Barem mate1 2017.png")
        }
        if navigationItem.title == "2016"
        {
            image.image = UIImage(named: "Barem mate1 2016.PNG")
        }
    }
    
    func aniBarem2Mate()
    {
        if navigationItem.title == "2018"
        {
            image.image = UIImage(named: "Barem mate2 2018.jpg")
        }
        else if navigationItem.title == "2017"
        {
            image.image = UIImage(named: "Barem mate2 2017.png")
        }
        if navigationItem.title == "2016"
        {
            image.image = UIImage(named: "Barem mate2 2016.PNG")
        }
    }
    
    func aniSubiect1Mate()
    {
        if navigationItem.title == "2018"
        {
            image.image = UIImage(named: "Var mate1 2018.jpg")
        }
        else if navigationItem.title == "2017"
        {
            image.image = UIImage(named: "Var mate1 2017.jpg")
        }
        if navigationItem.title == "2016"
        {
            image.image = UIImage(named: "Var mate1 2016.jpg")
        }
    }
    
    func aniSubiect2Mate()
    {
        if navigationItem.title == "2018"
        {
            image.image = UIImage(named: "Var mate2 2018.jpg")
        }
        else if navigationItem.title == "2017"
        {
            image.image = UIImage(named: "Var mate2 2017.jpg")
        }
        if navigationItem.title == "2016"
        {
            image.image = UIImage(named: "Var mate2 2016.jpg")
        }
    }
    
    @IBAction func subiect(_ sender: Any) {
        subiectActive = true
        baremActive = false
        self.view.backgroundColor = UIColor.blue
        aniSubiect1Mate()
    }
    
    @IBAction func barem(_ sender: Any) {
        baremActive = true
        subiectActive = false
        self.view.backgroundColor = UIColor.red
        aniBarem1Mate()
    }
    
    @IBAction func pagina1(_ sender: Any) {
        if subiectActive == true
        {
            aniSubiect1Mate()
        }
        else if baremActive == true
        {
            aniBarem1Mate()
        }
    }
    
    @IBAction func pagina2(_ sender: Any) {
        if subiectActive == true
        {
            aniSubiect2Mate()
        }
        else if baremActive == true
        {
            aniBarem2Mate()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollView.minimumZoomScale = 1.0
        self.scrollView.maximumZoomScale = 6.0
        subiectActive = true
        self.view.backgroundColor = UIColor.blue
        navigationItem.title = aniRomana[myIndexSubiecteRomana]
        aniSubiect1Mate()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
  
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return image
    }
    
}
