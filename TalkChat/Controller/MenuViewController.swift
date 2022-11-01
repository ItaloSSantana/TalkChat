//
//  MenuViewController.swift
//  TalkChat
//
//  Created by Italo Santana on 01/11/22.
//

import UIKit

class MenuViewController: UIViewController {

    let menuView = MenuView()
    let menuCell = MenuMessagesCellTableViewCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = menuView
        menuView.buildHierarchy()
    }
}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cellMenu", for: indexPath) as? MenuMessagesCellTableViewCell
            cell?.buildCellHierarchy()
            return cell ?? MenuMessagesCellTableViewCell()
        }
    }
    
    
    
    

