//
//  ViewController.swift
//  MyFavoriteShow
//
//  Created by Ivan on 13.01.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let idCell = "showCell"
    var myFavoriteShow = [
        "Wheeler Dealers",
        "Naked and Afraid",
        "Alaskan Bush People",
        "Gold Rush",
        "Baggage Battles",
        "How Do They Do It?",
        "Aussie Gold Hunters",
        "Salvage Hunters",
        "River Monsters",
        "Air Crash Investigation",
        "The Incredible Dr. Pol",
        "Dr. Oakley: Yukon Vet"
    ]
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
//        tableView.register(UINib(nibName: "ShowTableViewCell", bundle: nil), forCellReuseIdentifier: idCell)
//        self.navigationController?.navigationBar.prefersLargeTitles = true
    }


func goToShowViewController() {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let showViewController = storyboard.instantiateViewController(withIdentifier: "ShowViewController") as? ShowViewController else { return }
    
        navigationController?.pushViewController(showViewController, animated: true)
    }
}
    
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 3
        } else {
            return myFavoriteShow.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell
        if let reusableCell = tableView.dequeueReusableCell(withIdentifier: idCell) {
            cell = reusableCell
        } else {
            cell = UITableViewCell(style: .default, reuseIdentifier: idCell)
        }
        let show = myFavoriteShow[indexPath.row]
        cell.textLabel?.text = show
        cell.imageView?.image = #imageLiteral(resourceName: "image")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "My Favorite Show"
        } else {
            return "Show"
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        goToShowViewController()
    }
}
