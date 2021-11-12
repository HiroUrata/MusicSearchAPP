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
    
    public var playListCellContentsArray = [String]()
    public var mediumImageURL = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        playListTableVew.register(UINib(nibName: "PlayListTableViewCell", bundle: nil), forCellReuseIdentifier: "PlayListCell")
        playListTableVew.delegate = self
        playListTableVew.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        mediumImageView.sd_setImage(with: URL(string: mediumImageURL), completed: nil)
        
    }

}

extension MusicDetailView:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return tableView.frame.height / 8
    }
    
}

extension MusicDetailView:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return playListCellContentsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayListCell", for: indexPath) as! PlayListTableViewCell
        
        cell.playListContentsLabel.text = "\(String(indexPath.row + 1))曲目. \(playListCellContentsArray[indexPath.row])"
        
        return cell
    }
    
}
