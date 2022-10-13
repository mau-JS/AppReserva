//
//  AjustesViewController.swift
//  appReserva
//
//  Created by Mauricio Juárez on 12/10/22.
//

import UIKit

struct Section{
    let title: String
    let options: [SettingsOption]
}



struct SettingsOption{
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)
}
class AjustesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(AjustesTableViewCell.self, forCellReuseIdentifier: AjustesTableViewCell.identifier)
        return table
    }()
    var models = [Section]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        title = "Ajustes"
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        // Do any additional setup after loading the view.
    }
    func configure(){
        
        //1RA SECCIÓN
        models.append(Section(title: "General", options: [
            
            SettingsOption(title: "Modo Oscuro", icon: UIImage(systemName: "moon.circle"), iconBackgroundColor: .systemCyan){
            },
            SettingsOption(title: "Cambiar Fondo", icon: UIImage(systemName: "a.circle.fill"), iconBackgroundColor: .systemGreen){
            },
            
            SettingsOption(title: "Icloud", icon: UIImage(systemName: "cloud"), iconBackgroundColor: .systemOrange){
            }
            
        ]))
        //2DA SECCIÓN
        models.append(Section(title: "Accesibilidad", options: [
            
            SettingsOption(title: "Wifi", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemPink){
            },
            SettingsOption(title: "BlueTooth", icon: UIImage(systemName: "bluetooth"), iconBackgroundColor: .link){
            },
            SettingsOption(title: "Airplane mode", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemGreen){
            },
            
            SettingsOption(title: "Icloud", icon: UIImage(systemName: "cloud"), iconBackgroundColor: .systemOrange){
            }
            
        ]))
        //3RA SECCIÓN
        models.append(Section(title: "Apps", options: [
            
            SettingsOption(title: "Wifi", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemPink){
            },
            SettingsOption(title: "BlueTooth", icon: UIImage(systemName: "bluetooth"), iconBackgroundColor: .link){
            },
            SettingsOption(title: "Airplane mode", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemGreen){
            },
            
            SettingsOption(title: "Icloud", icon: UIImage(systemName: "cloud"), iconBackgroundColor: .systemOrange){
            }
            
        ]))
        
    }
    
    //Títulos de secciones
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = models[section]
        return section.title
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].options.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    //Opciones al clickear las opciones
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].options[indexPath.row]
       guard let cell = tableView.dequeueReusableCell(withIdentifier: AjustesTableViewCell.identifier, for: indexPath) as? AjustesTableViewCell else{
            return UITableViewCell()
        }
        cell.configure(with: model)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model = models[indexPath.section].options[indexPath.row]
        model.handler()
        //Aquí realizamos acciones al seleccionar celdas
        if indexPath.row == 0 && indexPath.section == 0{
            
            print("Escena 1")
            let myWebView = self.storyboard!.instantiateViewController(withIdentifier: "fontViewController") as! FontViewController
                     //Aquí configuramos como deseamos que se presente la pantalla
                     myWebView.modalPresentationStyle = .fullScreen
                      self.present(myWebView, animated: true, completion: nil)
        }
    }
    //Opciones al clickear menú de ajustes
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath:IndexPath){
//
//        if indexPath.row == 0 {
//            print("Escena 1")
//            let myWebView = self.storyboard!.instantiateViewController(withIdentifier: "firstTabSegue") as! firstTabViewController
//            //Aquí configuramos como deseamos que se presente la pantalla
//            myWebView.modalPresentationStyle = .fullScreen
//            self.present(myWebView, animated: true, completion: nil)
//        }
//        if indexPath.row == 1 {
//            let myWebView = self.storyboard!.instantiateViewController(withIdentifier: "MainView") as! MainViewController
//            //Aquí configuramos como deseamos que se presente la pantalla
//            myWebView.modalPresentationStyle = .fullScreen
//            self.present(myWebView, animated: true, completion: nil)
//        }
//
//    }

}
