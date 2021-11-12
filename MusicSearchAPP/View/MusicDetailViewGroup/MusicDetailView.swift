//
//  MusicDetailView.swift
//  MusicSearchAPP
//
//  Created by UrataHiroki on 2021/11/12.
//

import UIKit
import SDWebImage

class MusicDetailView: UIViewController {

    @IBOutlet weak var mediumImageView: UIImageView!
    @IBOutlet weak var playListTableVew: UITableView!
    
    private var playListCellContentsArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        playListTableVew.register(UINib(nibName: "PlayListTableViewCell", bundle: nil), forCellReuseIdentifier: "PlayListCell")
        playListTableVew.delegate = self
        playListTableVew.dataSource = self
        
    }

}

extension MusicDetailView:UITableViewDelegate{
    
    
}

extension MusicDetailView:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
}
