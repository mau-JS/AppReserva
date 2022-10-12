//
//  Hub2ViewController.swift
//  appReserva
//
//  Created by Mauricio Juárez on 07/10/22.
//

import UIKit


class Hub2ViewController: UIViewController, UITableViewDataSource {
  
    @IBOutlet var tableView: UITableView!
    var data = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
        tableView.estimatedRowHeight = 100
        tableView.dataSource = self
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            for _ in 0 ..< 5 {
                self.data.append("Some Text")
            }
            self.tableView.reloadData()
        })
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyTableViewCell", for: indexPath) as! Carta2TableViewCell
        if !data.isEmpty {
            cell.myLabel.text = data[indexPath.row]
            cell.myImageView.image = UIImage(systemName: "star")
        }
        return cell
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
