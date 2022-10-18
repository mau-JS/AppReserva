//
//  EmojiTableViewController.swift
//  appReserva
//
//  Created by Mauricio Juárez on 23/09/22.
//

import UIKit
import FirebaseCore
import FirebaseAnalytics
import FirebaseAuth
import FirebaseFirestore
import ViewAnimator

class ReservaTableViewController: UITableViewController {
    //Al presionar el botón save se crea un objeto y es agregado al vector
    @IBOutlet var reservaTableView: UITableView!
    let db = Firestore.firestore()
    var docID: [String] = []
    @IBAction func unwindToTableView(_ segue: UIStoryboardSegue){
        
        guard segue.identifier == "saveUnwind",
              let sourceViewController = segue.source as? AddEditReservaTableViewController,
              //Recibe el objeto reserva creado desde reservaTableViewCell
              let reserva = sourceViewController.reservas else {return}
            
        // MARK: - Update en la base de datos.
        if let selectedIndexPath = tableView.indexPathForSelectedRow{
            //Aquí atrapa a los objetos agregados
            reservas[selectedIndexPath.row] = reserva
            
            db.collection("users").document(Usuario.id).collection("reservasAula").document(String(docID[selectedIndexPath.row])).updateData(["Aula": reserva.nombreRecurso,"tipo": reserva.tipo, "ubicacion": reserva.ubicacion, "horarioInicio": reserva.horarioInicio, "horarioFinal": reserva.horarioFinal])
            
            tableView.reloadRows(at: [selectedIndexPath], with: .none)
            
        }
        // Aquí es donde insertamos el objeto agregado
        
        else{
            let newIndexPath = IndexPath(row: reservas.count, section: 0)
            reservas.append(reserva)
            
            
            //Aquí creamos una referencia de donde obtendremos el ID del documento
            var ref: DocumentReference? = nil
            //Aquí subimos los datos de cada reservación
            ref = db.collection("users").document(Usuario.id).collection("reservasAula").addDocument(data: [
                "Aula": reserva.nombreRecurso,
                "tipo": reserva.tipo,
                "ubicacion": reserva.ubicacion,
                "horarioInicio":reserva.horarioInicio,
                "horarioFinal": reserva.horarioFinal
                ] ) { err in
                    if let err = err {
                        print("Error al agregar el documento: \(err)")
                    } else {
                        //print("Document added with ID: \(ref!.documentID)")
                        self.docID.append(ref!.documentID)
                    }
                }
            /*db.collection("users/" + String(Usuario.id) + "/reservas").document("reserva_" + String(reservas.count)).setData([
                "nombreRecurso": reserva.nombreRecurso,
                "tipo": reserva.tipo,
                "ubicacion": reserva.ubicacion,
                "horarioInicio":reserva.horarioInicio,
                "horarioFinal": reserva.horarioFinal],merge:true)*/

            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
    //Creamos un vector donde guardamos los ID de las reservas
    
    var reservas: [Reservas] = []
        
    
    override func viewDidLoad() {
        //print(Usuario.id)
        super.viewDidLoad()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44.0
        navigationItem.leftBarButtonItem = editButtonItem
        
        
        
        
            db.collection("users").document(Usuario.id).collection("reservasAula").getDocuments(){ (querySnapshot,err) in
            if let err = err {
                print("Error getting documents: \(err)")
            }
            else{
                
                //Aquí es donde recibimos la información de la base de datos.
                for document in querySnapshot!.documents{
                    self.reservas.append(Reservas(json: document.data()))
                    self.docID.append(document.documentID)
                    //Aquí guardamos el ID del documento al momento de recibirlos
                    //self.docID.append(document.documentID)
                    self.tableView.reloadData()
                    
                   // print(self.reservas)
                    
                    print("\(document.documentID) =>  \(document.data())")
                }
                
            }
        }
        
        /*docRef.getDocument{(document, error) in
            if let document = document, document.exists {
                let dataubicacion = document.data().map(String.init(describing:)) ?? "nil"
                print("Document data: \(dataubicacion)")
            }
            else{
                print("Document does not exist")
            }
        }*/
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return reservas.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReserva", for: indexPath) as! ReservaTableViewCell
        
        let reserva = reservas[indexPath.row]
        
        cell.update(with: reserva)
        //Update a la base de datos
        print(indexPath.row)
        
       
//        cell.showsReorderControl = true
//        cell.showsReorderControl = true
        
        return cell
    }
    
    

  

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            //Aquí borramos la información
            reservas.remove(at: indexPath.row)
            
            //Borrando información de la base de datos
            db.collection("users").document(String(Usuario.id)).collection("reservasAula").document(String(docID[indexPath.row])).delete()
            
            //Borrando información del ID
            docID.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            //Borrar información
            print(indexPath.row)
            //.document("reserva_" + String((indexPath.row) + 1)).delete()
        } 
    }
    

    @IBSegueAction func addEditReserva(_ coder: NSCoder, sender: Any?) -> UITableViewController? {
        if let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell){
            //Editando Reserva
            let reservaToEdit = reservas[indexPath.row]
            return AddEditReservaTableViewController(coder: coder, reservas: reservaToEdit)
        }
        else{
            //Agregando reserva
            return AddEditReservaTableViewController(coder: coder, reservas: nil)
        }
    }
    //Escribiendo en base de datos
    func writeData(text: String){
        let docRef = db.document("users/\(Usuario.id)/reservasAula")
        docRef.setData(["nombre": text])
    }
  
}


