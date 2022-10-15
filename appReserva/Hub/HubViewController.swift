//
//  HubViewController.swift
//  appReserva
//
//  Created by Mauricio Juárez on 05/10/22.
//

import UIKit
import CardSlider

struct Item: CardSliderItem{

    var image: UIImage
    var rating: Int?
    var title: String
    var subtitle: String?
    var description: String?
}

class HubViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    //Aquí creamos un arreglo de estructuras
    
    @IBOutlet var tituloLabel: UILabel!
    @IBOutlet var cardTableView: UITableView!
    
    let pictures: [UIImage] = [UIImage(systemName: "star")!, UIImage(systemName: "star")!, UIImage(systemName: "star")!]
    let titles: [String] = ["Laboratorio de Ciberseguridad","Exteriores 2", "Exteriores 3"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tituloLabel.text = "Bienvenido al HUB"
        
//        myButton.backgroundColor = .link
//        myButton.setTitleColor(.white, for: .normal)
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    //Define que celdas están siendo utilizadas
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cartaCell", for: indexPath) as! CartaTableViewCell
        
        
        cell.configure(picture: pictures[indexPath.row], title: titles[indexPath.row])
        return cell
    }
    
    
    //Acciones a realizar cuando presionamos una celda.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath:IndexPath){
        //Es para remover la selección 
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            print("Escena 1")
            let myWebView = self.storyboard!.instantiateViewController(withIdentifier: "firstTabSegue") as! firstTabViewController
            //Aquí configuramos como deseamos que se presente la pantalla
            myWebView.modalPresentationStyle = .formSheet
            self.present(myWebView, animated: true, completion: nil)
        }
        if indexPath.row == 1 {
            let myWebView = self.storyboard!.instantiateViewController(withIdentifier: "MainView") as! MainViewController
            //Aquí configuramos como deseamos que se presente la pantalla
            myWebView.modalPresentationStyle = .fullScreen
            self.present(myWebView, animated: true, completion: nil)
        }
        
    }
    
}
