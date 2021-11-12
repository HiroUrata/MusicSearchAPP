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
    
    private let musicAlamofireProcess = MusicAlamofireProcess()
    
    private var cellLayout = UICollectionViewFlowLayout()
    
    private var cellContentsArray = [MusicDetailData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchResultCollectionView.register(UINib(nibName: "CollectionViewCustomCell", bundle: nil), forCellWithReuseIdentifier: "MusicDetailCell")
        searchResultCollectionView.delegate = self
        searchResultCollectionView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        cellLayout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        searchResultCollectionView.collectionViewLayout = cellLayout
    }

    @IBAction func search(_ sender: UIButton) {
        
        musicAlamofireProcess.getMusicDetailData(searchKeyWord: searchTextField.text) {[self] result, error in
            
            if error != nil{
                
                return
            }
            
            showAnimation(showContent: "5", animationTime: 3.0, targetView: view) { resultBool in
                
                if resultBool == false{
                    
                    return
                }
                
                cellContentsArray = result!
                searchResultCollectionView.reloadData()
            }
            
        }
        
    }
    
}

extension ViewController:UICollectionViewDelegate{
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        <#code#>
//    }
}

extension ViewController:UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return cellContentsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MusicDetailCell", for: indexPath) as! CollectionViewCustomCell
        
        cell.mediumImageView.sd_setImage(with: URL(string: cellContentsArray[indexPath.row].mediumImageUrl!), completed: nil)
        cell.titleLabel.text = cellContentsArray[indexPath.row].title
        cell.artistNameLabel.text = cellContentsArray[indexPath.row].artistName
        
        return cell
    }
    
}

extension ViewController:UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width / 2 - 10, height: collectionView.frame.height / 2 - 10)
    }
}

