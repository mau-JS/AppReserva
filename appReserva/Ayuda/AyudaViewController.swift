//
//  AyudaViewController.swift
//  appReserva
//
//  Created by Mauricio Juárez on 19/09/22.
//

import UIKit
import MessageUI
import SafariServices

class AyudaViewController: UIViewController, MFMailComposeViewControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet var ayudaLabel: UILabel!
    @IBOutlet var botonEmail: UIButton!
    @IBOutlet var contactanosLabel: UILabel!
    
    @IBOutlet var llamanosBoton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Ayuda"
        /*self.navigationController!.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Helvetica Neue", size: 36)!]*/
        ayudaLabel.text = "Preguntas Frecuentes"
        ayudaLabel.font = UIFont.boldSystemFont(ofSize: 26.0)
        contactanosLabel.text = "   Contáctanos"
        contactanosLabel.font = UIFont.boldSystemFont(ofSize: 26.0)
    }
    
   
    
    @IBAction func presionaBotonEmail(_ sender: Any) {
        if MFMailComposeViewController.canSendMail(){
            let vc = MFMailComposeViewController()
            vc.delegate = self
            vc.setSubject("Contáctanos")
            vc.setToRecipients(["soporte@reservatio.com"])
            vc.setMessageBody("<h1>Necesito ayuda<h1>", isHTML: true)
            present(UINavigationController(rootViewController: vc),animated: true)
        }
        else{
            guard let url = URL(string: "https://mail.google.com") else{
                return
            }
            let vc = SFSafariViewController(url: url)
            present(vc, animated: true)
        }
       
        
       
        
    }
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func presionaLlamanosBoton(_ sender: Any) {
        dialNumber(number: "+525571214765")
    }
    
}
func dialNumber(number : String) {

 if let url = URL(string: "tel://\(number)"),
   UIApplication.shared.canOpenURL(url) {
      if #available(iOS 10, *) {
        UIApplication.shared.open(url, options: [:], completionHandler:nil)
       } else {
           UIApplication.shared.openURL(url)
       }
   } else {
            // add error message here
   }
}

    

