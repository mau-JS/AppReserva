//
//  firstTabViewController.swift
//  appReserva
//
//  Created by Mauricio Juárez on 05/10/22.
//

import UIKit


class firstTabViewController: UIViewController {
    @IBOutlet var botonSalida: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func presionaBoton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
