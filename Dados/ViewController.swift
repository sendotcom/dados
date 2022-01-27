//
//  ViewController.swift
//  Dados
//
//  Created by H.Gio on 26/01/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageViewDiceLeft: UIImageView!
    @IBOutlet weak var imageViewDiceRight: UIImageView!
    @IBOutlet weak var SumaTotal: UILabel!
    
    var randomDiceIndexLeft : Int = 0
    var randomDiceIndexRight : Int = 0
    
    
    let _diceImages = ["cara-1","cara-2","cara-3","cara-4","cara-5","cara-6"]
    
    let nFaces: UInt32
    
    required init?(coder aDecoder: NSCoder) {
        nFaces = UInt32(_diceImages.count)
        super.init(coder: aDecoder)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        generateRandomDices()
        
    }

    @IBAction func rollPressed(_ sender: UIButton) {
        generateRandomDices()
    }
    
    
    func generateRandomDices(){
        randomDiceIndexLeft = Int(arc4random_uniform(nFaces))
        randomDiceIndexRight = Int(arc4random_uniform(nFaces))
        
        var SumaDeLosDato: Int = 0
        
        SumaDeLosDato = (randomDiceIndexLeft+randomDiceIndexRight)+2
        
        SumaTotal.text = String(SumaDeLosDato)
        
        print("El izk es \(randomDiceIndexLeft)")
        print("El der es \(randomDiceIndexRight)")
        
        imageViewDiceLeft.image = UIImage(named: _diceImages[randomDiceIndexLeft])
        imageViewDiceRight.image = UIImage(named: _diceImages[randomDiceIndexRight])
        
        
        let alerta = UIAlertController(title: "Resultado", message: "El resultado fue \(SumaDeLosDato)", preferredStyle: .alert)
        
        let botonAceptar = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
        
        alerta.addAction(botonAceptar)
        
        show(alerta, sender: nil)
        
        
    }
    
    override func becomeFirstResponder() -> Bool {
        return true;
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake{
            generateRandomDices()
        }
    }
    
}

