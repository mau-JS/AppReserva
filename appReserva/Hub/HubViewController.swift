//
//  HubViewController.swift
//  appReserva
//
//  Created by Mauricio Juárez on 05/10/22.
//

import UIKit
import CardSlider
import ViewAnimator

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
    @IBOutlet var reservaButton: UIButton!
    let pictures: [UIImage] = [UIImage(named: "labCiberseguridad1")!, UIImage(systemName: "star")!, UIImage(systemName: "star")!]
    let titles: [String] = ["Laboratorio de Ciberseguridad","Exteriores 2", "Exteriores 3"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reservaButton.setTitle("Plataforma de Reservas", for: .normal)
        reservaButton.layer.borderWidth = 1.5
        tituloLabel.text = "Bienvenido al HUB"
        Utilities.styleFilledButton(reservaButton)
        
//        myButton.backgroundColor = .link
//        myButton.setTitleColor(.white, for: .normal)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let animation = AnimationType.from(direction: .left, offset: 300)
        UIView.animate(views: cardTableView.visibleCells, animations: [animation], delay: 0.5, duration: 1)
        
//        cardTableView.animate(animations: <#T##[Animation]#>, reversed: <#T##Bool#>, initialAlpha: <#T##CGFloat#>, finalAlpha: <#T##CGFloat#>, delay: <#T##Double#>, duration: <#T##TimeInterval#>, usingSpringWithDamping: <#T##CGFloat#>, initialSpringVelocity: <#T##CGFloat#>, options: <#T##UIView.AnimationOptions#>, completion: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>)
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
    
    @IBAction func presionaReservaButton(_ sender: Any) {
        let myWebView = self.storyboard!.instantiateViewController(withIdentifier: "MainView") as! MainViewController
        //Aquí configuramos como deseamos que se presente la pantalla
        myWebView.modalPresentationStyle = .fullScreen
        self.present(myWebView, animated: true, completion: nil)
    }
}
