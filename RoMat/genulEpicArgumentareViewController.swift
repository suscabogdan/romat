//
//  genulEpicArgumentareViewController.swift
//  Romana clasa a 8a
//
//  Created by Susca Bogdan on 05/09/2018.
//  Copyright © 2018 Susca Bogdan. All rights reserved.
//

import UIKit

class genulEpicArgumentareViewController: UIViewController {

    var primaParte = "  Genul epic cuprinde totalitatea operelor literare in care autorul isi exprima gandurile, ideile si sentimentele in mod indirect, prin intermediul actiunii si al personajelor. În opinia mea, opera ''" + String(titluEpic) + "'' scrisă de " + String(autorEpic) + " aparține genului epic deoarece prezintă toate particulariățile acestuia.\n    În primul rând, se remarcă prezența narațiunii, ca mod de expunere specific. Aceasta se face la " + String(persoanaEpic) + ", implicând prezența unui narator " + String(naratorEpic) + "."
    var aDouaParte = "  În al doilea rând, apar " + String(personajeEpic) + ", care sunt implicate in derularea unor evenimente. " + String(rezumatEpic) + ". Aceste acțiuni sunt plasate într-un anumit timp " + String(indiciTimpEpic) + " și spațiu " + String(indiciSpatiuEpic) + ".\n     În concluzie, toate argumentele prezentate mai sus justifică apartenența la genul epic al operei literare ''" + String(titluEpic) + "'' scrisa de " + String(autorEpic) + "."
    
    @IBOutlet weak var argumetareTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if checkIfRoMatIdPaid == true
        {
            // afisam argumentarea
            argumetareTextView.text = primaParte + aDouaParte
            
            // numaram cuvintele
            let words = argumetareTextView.text.components(separatedBy: .whitespacesAndNewlines)
            let filteredWords = words.filter({ (word) -> Bool in
                word != ""
            })
            let wordCount = filteredWords.count
            
            // afisam titlul si numarul de cuvinte
            navigationItem.title = titluEpic + " - " + String(wordCount) + " cuvinte"
        }
        else
        {
            argumetareTextView.text = "Aceasta este o versiune gratuita a aplicatiei. Deblocheaza toata aplicatia pentru numai 9,99 lei!"
            navigationItem.title = ""
        }
    }
    
}
