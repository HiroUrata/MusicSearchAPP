//
//  VideoAlamofireProcess.swift
//  MusicSearchAPP
//
//  Created by UrataHiroki on 2021/11/12.
//

import Alamofire
import SwiftyJSON




class VideoAlamofireProcess{
    
    private var videoDetailResultArray = [VideoDetailDatas]()
}

extension VideoAlamofireProcess{
    
    public func getVideoDetailData(searchKeyword:String?,comletion: @escaping ([VideoDetailDatas]?,Error?) -> Void){
        
        guard let keyword = searchKeyword else { return }
        
        let apiKey = ""
        
        AF.request(apiKey, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON {[self] response in
            
            switch response.result{
                
            case .success:
                
                let detailData = JSON(response.data as Any)
                videoDetailResultArray = []
                
                for dataCount in 0..<detailData["items"].count{
                    
                    if let getThumbnail = detailData["items"][dataCount]["snippet"]["thumbnails"]["medium"]["url"].string,
                       let getTitle = detailData["items"][dataCount]["snippet"]["title"].string,
                       let getChannelName = detailData["items"][dataCount]["snippet"]["channelTitle"].string,
                       let getVideoID = detailData["items"][dataCount]["id"]["videoId"].string,
                       let getDiscription = detailData["items"][dataCount]["snippet"]["description"].string{
                        
                        if detailData["items"][dataCount]["id"]["channelId"].string != getChannelName{
                            
                            videoDetailResultArray.append(VideoDetailDatas(thumbnailImageURL: getThumbnail,
                                                                           title: getTitle,
                                                                           channelTitle: getChannelName,
                                                                           videoPlayerContents: VideoPlayerContents(videoId: getVideoID,
                                                                                                                    description: getDiscription)))
                        }
                    }
                }
                comletion(videoDetailResultArray, nil)
                
            case .failure(let error):
                
                comletion(nil, error)
            }
        }
        
    }
}
