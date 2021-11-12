//
//  VideoListView.swift
//  MusicSearchAPP
//
//  Created by UrataHiroki on 2021/11/12.
//

import UIKit

class VideoListView: UIViewController {

    @IBOutlet weak var videoListTableView: UITableView!
  
    private var videoListContantArray = [VideoDetailDatas]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        videoListTableView.register(UINib(nibName: "VideoListCell", bundle: nil), forCellReuseIdentifier: "")
        videoListTableView.delegate = self
        videoListTableView.dataSource = self
    }

  
}


extension VideoListView:UITableViewDelegate{
    
    
}

extension VideoListView:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
}
