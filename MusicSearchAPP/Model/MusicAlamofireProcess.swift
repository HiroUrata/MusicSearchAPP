//
//  AlamofireProcess.swift
//  MusicSearchAPP
//
//  Created by UrataHiroki on 2021/11/12.
//

import Alamofire
import SwiftyJSON

class MusicAlamofireProcess{

    private var privateMusicDetailData = [MusicDetailData]()
}

extension MusicAlamofireProcess{
    
    public func getMusicDetailData(searchKeyWord:String?,completion: @escaping ([MusicDetailData]?,Error?) -> Void){
     
        guard let keyword = searchKeyWord else { return }
        
        let apiKey = ""
        
        AF.request(apiKey, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON {[self] response in
            
            switch response.result{
                
            case .success:
                
                let detailData = JSON(response.data as Any)
                
                privateMusicDetailData = []
                
                for dataCount in 0..<detailData["Items"].count{
                    
                    if let getMediumImageUrl = detailData["Items"][dataCount]["Item"]["mediumImageUrl"].string,
                       let getTitle = detailData["Items"][dataCount]["Item"]["title"].string,
                       let getArtistName = detailData["Items"][dataCount]["Item"]["artistName"].string,
                       let getPlayList = detailData["Items"][dataCount]["Item"]["playList"].string{
                        
                        privateMusicDetailData.append(MusicDetailData(mediumImageUrl: getMediumImageUrl,
                                                                      title: getTitle,
                                                                      artistName: getArtistName,
                                                                      playList: PlayListDetail(playListContents: getPlayList)))
                    }
                }
                completion(privateMusicDetailData, nil)
                
                
            case .failure(let error):
            
                completion(nil, error)
            }
        }
    }
}


extension String{
    
    var urlEncoded:String{
        
        let charset = CharacterSet.alphanumerics.union(.init(charactersIn: "/?-._~"))
        let remove = removingPercentEncoding ?? self
        
        return remove.addingPercentEncoding(withAllowedCharacters: charset) ?? remove
    }
}
