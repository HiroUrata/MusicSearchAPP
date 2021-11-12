//
//  ViewController.swift
//  MusicSearchAPP
//
//  Created by UrataHiroki on 2021/11/12.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var searchResultCollectionView: UICollectionView!
    
    private let cellContentsArray = [MusicDetailData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchResultCollectionView.register(UINib(nibName: "CollectionViewCustomCell", bundle: nil), forCellWithReuseIdentifier: "MusicDetailCell")
        searchResultCollectionView.delegate = self
        searchResultCollectionView.dataSource = self
    }


}

extension ViewController:UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        <#code#>
    }
}

extension ViewController:UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return cellContentsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    
    

}

