//
//  ShowViewController.swift
//  MyFavoriteShow
//
//  Created by Ivan on 15.01.2022.
//

import UIKit

class ShowViewController: UIViewController {
    let idCustomCell = "CustomCell"
    var show: Show?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: "ShowTableViewCell", bundle: nil), forCellReuseIdentifier: idCustomCell)
    }    
}

extension ShowViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = tableView.dequeueReusableCell(withIdentifier: idCustomCell) as! ShowTableViewCell
        customCell.titleLabel.text = show?.name
        customCell.descriptionLabel.text = show?.description
        customCell.imageCell.image = #imageLiteral(resourceName: "image2-1")
        return customCell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "List"
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
    }
}
