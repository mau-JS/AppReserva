//
//  EmojiTableViewController.swift
//  appReserva
//
//  Created by Mauricio Juárez on 23/09/22.
//

import UIKit

class ReservaTableViewController: UITableViewController {
    var reservas: [Reservas] = [
        Reservas(dia: 10, mes: 10, anio: 10,diaFinal: 10, mesFinal: 10, anioFinal: 10, titulo: "A-102", tipo: "dsd", description: "Esta es una descripción")
        //Reservas(dia: 5, mes: 10, anio: 2021, titulo: "happiness"),
        //Reservas(dia: 7, mes: 10, anio: 2022, titulo: "marte"),
        //Reservas(dia: 5, mes: 10, anio: 1994, titulo: "retiroA"),
        //Reservas(dia: 5, mes: 10, anio: 1996, titulo: "Mapas"),
        //Reservas(dia: 5, mes: 10, anio: 2010, titulo: "hola")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
        {
            if editingStyle == .delete {
                // Delete the row from the data source
                reservas.remove(at: indexPath.row)
                // Then, delete the row from the table itself
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let moverReserva = reservas.remove(at: fromIndexPath.row)
        reservas.insert(moverReserva, at: to.row)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return reservas.count
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let reserva = reservas[indexPath.row]
        print("\(reserva.titulo) \(indexPath)")
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReserva", for: indexPath) as! ReservaTableViewCell
        let reserva = reservas[indexPath.row]
        cell.update(with: reserva)
        cell.showsReorderControl = true
        // Configure the cell...
        cell.showsReorderControl = true
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
