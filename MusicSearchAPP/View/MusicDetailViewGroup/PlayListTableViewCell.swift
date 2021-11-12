//
//  PlayListTableViewCell.swift
//  MusicSearchAPP
//
//  Created by UrataHiroki on 2021/11/12.
//

import UIKit

class PlayListTableViewCell: UITableViewCell {

    @IBOutlet weak var playListContentsLabel: UILabel!
    @IBOutlet weak var musicPlayButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        playListContentsLabel.text = ""
    }
    
    @IBAction func playMusic(_ sender: UIButton) {
        
        
    }
    
    
}
