//
//  MainTabBarController.swift
//  appReserva
//
//  Created by Mauricio Juárez on 29/09/22.
//

import UIKit

class MainTabBarController: UITabBarController {
    //Recibiendo información desde pantalla de inicio
    var idUsuario: String = "Not set"
    override func viewDidLoad() {
        
        super.viewDidLoad()
        print(idUsuario)
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.hidesBackButton = true
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
