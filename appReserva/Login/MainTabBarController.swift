//
//  MainTabBarController.swift
//  appReserva
//
//  Created by Mauricio Juárez on 29/09/22.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth
import FirebaseAnalytics
class MainTabBarController: UITabBarController {
    @IBOutlet var TabBar: UITabBar!
    //Recibiendo información desde pantalla de inicio
    var idUsuario: String = "Hola logré imprimir"
    override func viewDidLoad() {
        
        super.viewDidLoad()
        //print(viewControllers!)
        
        //print(idUsuario)
        Usuario.id = idUsuario
        TabBar.tintColor = UIColor.init(red: 204/255, green: 0/255, blue: 204/255, alpha: 0.5)
        TabBar.unselectedItemTintColor = .lightGray
        //Para enviar información a tab bars sin navigation controller
        
        /*let navController = self.tabBarController!.viewControllers![1] as! UINavigationController
        let vc = navController.topViewController as! ReservaTableViewController
        vc.idUsuario = idUsuario*/
        
        //self.performSegue(withIdentifier: "cuenta", sender: self)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.hidesBackButton = true
    }
}
