//
//  ViewController.swift
//  IMC
//
//  Created by Gabriel Pereira on 06/04/19.
//  Copyright © 2019 Gabriel Pereira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textFieldWeight: UITextField!
    @IBOutlet weak var textFieldHeight: UITextField!
    @IBOutlet weak var labelResult: UILabel!
    @IBOutlet weak var imageViewResult: UIImageView!
    @IBOutlet weak var uiViewResult: UIView!
    
    var imc: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    @IBAction func actionCalculateImc(_ sender: Any) {
        if let weight = Double(textFieldWeight.text!), let height = Double(textFieldHeight.text!) {
            imc = weight / (height * height)
            showResults()
        }
    }
    
    func showResults() {
        var result = String()
        var image = String()
        
        switch imc {
            case 0..<16:
                result = "Magreza"
                image = "abaixo"
            
            case 16..<18.5:
                result = "Abaixo do peso"
                image = "abaixo"
            
            case 18.5..<25:
                result = "Peso ideal"
                image = "ideal"
            
            case 25..<30:
                result = "Sobrepeso"
                image = "sobrepeso"
            
            default:
                result = "Obesidade"
                image = "obesidade"
        }
        
        labelResult.text = "\(Int(imc)): \(result)"
        imageViewResult.image = UIImage(named: image)
        uiViewResult.isHidden = false
        
        // This method will lost focus of editing text and hide keyboard
        view.endEditing(true)
    }
}

