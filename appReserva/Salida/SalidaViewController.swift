//
//  SalidaViewController.swift
//  appReserva
//
//  Created by Mauricio Juárez on 19/10/22.
//

import UIKit

class SalidaViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.performSegue(withIdentifier: "cerrarSesion", sender: nil)
    }
    

}
