//
//  VideoListView.swift
//  MusicSearchAPP
//
//  Created by UrataHiroki on 2021/11/12.
//

import UIKit

class VideoListView: UIViewController {

    @IBOutlet weak var videoListTableView: UITableView!
  
    private let videoAlamofireProcess = VideoAlamofireProcess()
    
    private var videoListContantArray = [VideoDetailDatas]()
    
    public var getArtistName = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        videoListTableView.register(UINib(nibName: "VideoListCell", bundle: nil), forCellReuseIdentifier: "VideoListCell")
        videoListTableView.delegate = self
        videoListTableView.dataSource = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        videoAlamofireProcess.getVideoDetailData(searchKeyword: getArtistName) {[self] result, error in
            
            if error != nil{
                
                return
            }
            
            showAnimation(showContent: "5", animationTime: 4, targetView: view) {[self] judgeBool in
                
                if judgeBool == false{
                    
                    return
                }
                videoListContantArray = []
                videoListContantArray = result!
                videoListTableView.reloadData()
            }
        }
        
    }
}

extension VideoListView:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return tableView.frame.height / 2.2
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let videoPlayView = VideoPlayView()
        videoPlayView.playVideoID = videoListContantArray[indexPath.row].videoPlayerContents?.videoId
        videoPlayView.playVideoTitle = videoListContantArray[indexPath.row].title
        videoPlayView.playVideoDescription = videoListContantArray[indexPath.row].videoPlayerContents?.description
        videoPlayView.modalPresentationStyle = .automatic
        videoPlayView.presentationController?.delegate = self
        present(videoPlayView, animated: true, completion: nil)

    }
}


extension VideoListView:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return videoListContantArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoListCell", for: indexPath) as! VideoListCell
        
        cell.thumbnailImageView.sd_setImage(with: URL(string: videoListContantArray[indexPath.row].thumbnailImageURL!), completed: nil)
        cell.titleLabel.text = videoListContantArray[indexPath.row].title
        cell.channelNameLabel.text = videoListContantArray[indexPath.row].channelTitle
        
        return cell
    }
}

extension VideoListView:UIAdaptivePresentationControllerDelegate{
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        
       let viewPlayView = VideoPlayView()
        viewPlayView.videoView.removeFromSuperview()
    }
    
}
