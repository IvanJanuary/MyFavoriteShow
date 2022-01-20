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
        Show(imageName: "wheeler-dealers",
             name: "Wheeler Dealers",
             description: "Original release: 7 October 2003 – present"),
        Show(imageName: "naked-afraid",
             name: "Naked and Afraid",
             description: "Original release: June 23, 2013 – present"),
        Show(imageName: "alaskanbushpeople",
             name: "Alaskan Bush People",
             description: "Original release: May 6, 2014 – present"),
        Show(imageName: "goldrush",
             name: "Gold Rush",
             description: "Original release: December 3, 2010 – present"),
        Show(imageName: "baggagebattles",
             name: "Baggage Battles",
             description: "Original release: April 11, 2012 – March 17, 2016"),
        Show(imageName: "howdotheydoit",
             name: "How Do They Do It?",
             description: "Original release: 6 May 2006 – present"),
        Show(imageName: "aussiegoldhunters",
             name: "Aussie Gold Hunters",
             description: "Original release: 15 September 2016 – present"),
        Show(imageName: "salvagehunters",
             name: "Salvage Hunters",
             description: "Original release: 14 November 2011 – present"),
        Show(imageName: "rivermonsters",
             name: "River Monsters",
             description: "Original release: 5 April 2009 – 28 May 2017"),
        Show(imageName: "aircrashinvestigation",
             name: "Air Crash Investigation",
             description: "Original release: 3 September 2003 – present"),
        Show(imageName: "drpol",
             name: "The Incredible Dr. Pol",
             description: "Original release: 1 January 2011 – present"),
        Show(imageName: "droakley",
             name: "Dr. Oakley: Yukon Vet",
             description: "Original release: 12 April 2014 - present"),
    ]
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }

    func goToShowViewController(_ myShow: Show) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let showViewController = storyboard.instantiateViewController(withIdentifier: "ShowViewController") as? ShowViewController else { return }
           showViewController.show = myShow
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
        cell.textLabel?.text = show.name
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
        let show = myFavoriteShow[indexPath.row]
        goToShowViewController(show)
    }
}
