//
//  CollectionViewCustomCell.swift
//  MusicSearchAPP
//
//  Created by UrataHiroki on 2021/11/12.
//

import UIKit

class CollectionViewCustomCell: UICollectionViewCell {

    @IBOutlet weak var mediumImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
   
        
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        mediumImageView.image = UIImage(named: "")
        titleLabel.text = ""
        artistNameLabel.text = ""
        
    }
}
