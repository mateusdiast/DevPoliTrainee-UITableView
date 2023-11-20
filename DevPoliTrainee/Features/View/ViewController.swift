//
//  ViewController.swift
//  DevPoliChallenge
//
//  Created by DevPoli on 29/07/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var tableView: UITableView!
    
    let fisrtViewModel = ViewModel()
    var data: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        fisrtViewModel.delegate = self
        fisrtViewModel.onLoadDatas()
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomCell
        cell.textLabel?.text = data![indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            data?.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alertNameIsInvalidate = UIAlertController(title: "Tapped", message: data![indexPath.row], preferredStyle: UIAlertController.Style.alert)
        alertNameIsInvalidate.addAction(UIAlertAction(title: "OK!", style: UIAlertAction.Style.default, handler: nil))
        self.present(alertNameIsInvalidate, animated: true, completion: nil)
        print(indexPath)
        print(indexPath.row)
    }

    
    
}

extension ViewController: ViewModelDelegate{
    
    func setData(data: [String]){
        self.data = data
    }
    
    
}
