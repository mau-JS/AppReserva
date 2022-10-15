//
//  FontViewController.swift
//  appReserva
//
//  Created by Mauricio Juárez on 12/10/22.
//

import UIKit
import FirebaseAuth
import FirebaseCore
import FirebaseDatabase
import FirebaseAnalytics
import FirebaseFirestore
extension UILabel {
    @objc var substituteFontName : String {
        get {
            return self.font.fontName;
        }
        set {
            let fontNameToTest = self.font.fontName.lowercased();
            var fontName = newValue;
            if fontNameToTest.range(of: "bold") != nil {
                fontName += "-Bold";
            } else if fontNameToTest.range(of: "medium") != nil {
                fontName += "-Medium";
            } else if fontNameToTest.range(of: "light") != nil {
                fontName += "-Light";
            } else if fontNameToTest.range(of: "ultralight") != nil {
                fontName += "-UltraLight";
            }
            self.font = UIFont(name: fontName, size: self.font.pointSize)
        }
    }
}

extension UITextView {
    @objc var substituteFontName : String {
        get {
            return self.font?.fontName ?? "";
        }
        set {
            let fontNameToTest = self.font?.fontName.lowercased() ?? "";
            var fontName = newValue;
            if fontNameToTest.range(of: "bold") != nil {
                fontName += "-Bold";
            } else if fontNameToTest.range(of: "medium") != nil {
                fontName += "-Medium";
            } else if fontNameToTest.range(of: "light") != nil {
                fontName += "-Light";
            } else if fontNameToTest.range(of: "ultralight") != nil {
                fontName += "-UltraLight";
            }
            self.font = UIFont(name: fontName, size: self.font?.pointSize ?? 17)
        }
    }
}

extension UITextField {
    @objc var substituteFontName : String {
        get {
            return self.font?.fontName ?? "";
        }
        set {
            let fontNameToTest = self.font?.fontName.lowercased() ?? "";
            var fontName = newValue;
            if fontNameToTest.range(of: "bold") != nil {
                fontName += "-Bold";
            } else if fontNameToTest.range(of: "medium") != nil {
                fontName += "-Medium";
            } else if fontNameToTest.range(of: "light") != nil {
                fontName += "-Light";
            } else if fontNameToTest.range(of: "ultralight") != nil {
                fontName += "-UltraLight";
            }
            self.font = UIFont(name: fontName, size: self.font?.pointSize ?? 17)
        }
    }
}
class FontViewController: UIViewController,UIFontPickerViewControllerDelegate {
    let db = Firestore.firestore()
    
    
    
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        //Permite que el texto aparezca completo
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 24)
        label.text = "The quick brown fox jump over the lazy dog. The quick brown fox jump over the lazy dog.The quick brown fox jump over the lazy dog.The quick brown fox jump over the lazy dog."
        return label
    }()
    //Boton para cambiar Fondo
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        button.setTitle("Pick Font", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: - Asignando el fondo a aplicar
//        UILabel.appearance().substituteFontName = Usuario.fondo
//        UITextView.appearance().substituteFontName = Usuario.fondo
//        UITextField.appearance().substituteFontName = Usuario.fondo
        view.addSubview(label)
        view.addSubview(button)
        button.addTarget(self, action: #selector(presionaFondo), for: .touchUpInside)
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        label.frame = CGRect (x: 10, y: view.safeAreaInsets.top, width: view.frame.size.width-20, height: view.frame.size.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom - 100)
        button.frame = CGRect(x: 20, y: view.frame.size.height - 100, width: view.frame.size.width - 40, height: 50)
    }
    @objc private func presionaFondo(){
        let config = UIFontPickerViewController.Configuration()
        config.includeFaces = false
        let vc = UIFontPickerViewController(configuration: config)
        vc.delegate = self
        present(vc, animated: true)
    }
    
    func fontPickerViewControllerDidCancel(_ viewController: UIFontPickerViewController) {
        viewController.dismiss(animated: true, completion: nil)
    }
    
    func fontPickerViewControllerDidPickFont(_ viewController: UIFontPickerViewController) {
        viewController.dismiss(animated: true, completion: nil)
        //Estas líneas son las que cambian de fondo
        
        guard let descriptor = viewController.selectedFontDescriptor else{return}
        label.font = .systemFont(ofSize: 24)
        label.font = UIFont (descriptor: descriptor, size: 24)
        //print(descriptor)
        //Aquí almacenamos el nombre del fondo
        
        //Guardando el nombre del fondo para subirlo a la nube
        //MARK: - AQUÍ ES DONDE MANDAMOS A LA BASE DE DATOS UN DOC
       
        
        //Poscriptname guarda el nombre de la fuente
        
       db.collection("users").document("0XUdlY5qQxVmQ0F0COuH7DewWQt1").updateData(["fondoUsuario": descriptor.postscriptName])
        //Esto almacena el nombre del fondo en cadena
//        print(descriptor.postscriptName)
//       print(UIFontDescriptor(name: "American Typewriter", size: 20))
//        print("El tipo de variable es: \(type(of: descriptor)) \(descriptor)")
    
    }
}
