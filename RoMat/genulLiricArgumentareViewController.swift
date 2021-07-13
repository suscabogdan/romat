//
//  genulLiricArgumentareViewController.swift
//  Romana clasa a 8a
//
//  Created by Susca Bogdan on 03/08/2018.
//  Copyright © 2018 Susca Bogdan. All rights reserved.
//

import UIKit

class genulLiricArgumentareViewController: UIViewController {

    var primaParte = "      Genul liric cuprinde totalitatea operelor literare, în care autorul își exprima gândurile, ideile și sentimentele în mod direct, prin intermediul eului liric și al mijloacelor de expresivitate artistică. Opera literară ''" + String(titluLiric) + "'' scrisă de " + String(autorLiric) + " aparține genului liric, întrucât prezintă toate particularitățile sale la nivel formal și de conținut.\n     În primul rând, autorul percepe realitatea în mod subiectiv, filtrând ceea ce simte, prin propria sensibilitate. Eul liric, aflat în ipostaza " + String(ipostazaLiric) + " își exteriorizează sentimentele puternice de " + String(sentimenteLiric) + ".\n   Tema poeziei este " + String(temaLiric) + ", iar titlul, ca element paratextual, este alcătuit din " + String(partiDeVorbireLiric) + " și se află în perfectă concordanță cu mesajul poetic, simbolizând " + String(simbolTitluLiric)
    
    var aDouaParte = ".\n       În al doilea rând, limbajul se caracterizează prin expresivitate, dobândită prin utilizarea figurilor de stil și imaginilor artistice. Dintre acestea se remarcă " + String(figuriDeStilLiric) + " și " + String(imaginiArtisticeLiric) + " care emoționeaza cititorul. De asemenea, muzicalitatea versurilor dată de rimă " + String(rimaLiric) + ", de masura versurilor de " + String(masuraLiric) + " silabe și de ritmul " + String(ritmLiric) + " sporesc valoarea artistică a limbajului.\n        În concluzie, toate argumentele prezentate mai sus justifică apartenența la genul liric al operei literare ''" + String(titluLiric) + "'' scrisă de " + String(autorLiric) + "."
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // afisam argumentarea
        textView.text = primaParte + aDouaParte
        
        // numaram cuvintele
        let words = textView.text.components(separatedBy: .whitespacesAndNewlines)
        let filteredWords = words.filter({ (word) -> Bool in
            word != ""
        })
        let wordCount = filteredWords.count
        
        // afisam titlul si numarul de cuvinte
        navigationItem.title = titluLiric + " - " + String(wordCount) + " cuvinte"
    }
    
}
