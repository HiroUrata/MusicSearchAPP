//
//  VideoPlayView.swift
//  MusicSearchAPP
//
//  Created by UrataHiroki on 2021/11/12.
//

import UIKit
import youtube_ios_player_helper

class VideoPlayView: UIViewController{

    @IBOutlet weak var videoOnView: UIView!
    @IBOutlet weak var videoTitleLabel: UILabel!
    @IBOutlet weak var videoDescriptionView: UITextView!
    
    public var videoView = YTPlayerView()
    
    public var playVideoID:String?
    public var playVideoTitle:String?
    public var playVideoDescription:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        videoTitleLabel.text = playVideoTitle
        videoDescriptionView.text = playVideoDescription
        videoView.frame = videoOnView.frame
        videoView.load(withVideoId: playVideoID!, playerVars: ["playersinline":1])
        videoOnView.addSubview(videoView)
        
        videoView.delegate = self
    }

}

extension VideoPlayView:YTPlayerViewDelegate{
    
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
            
        videoView.playVideo()
    }
}


extension VideoPlayView{
    
    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        super.dismiss(animated: flag, completion: completion)
        
        guard let presentationController = presentationController else { return }
        
        presentationController.delegate?.presentationControllerDidDismiss?(presentationController)
    }
}
