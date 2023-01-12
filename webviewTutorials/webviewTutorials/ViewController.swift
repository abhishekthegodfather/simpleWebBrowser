//
//  ViewController.swift
//  webviewTutorials
//
//  Created by Cubastion on 11/01/23.
//

import UIKit
import WebKit
import SnapKit

class ViewController: UIViewController {

    var linksArray : [String] = ["Google", "Bing", "Yahoo", "Duck Duck Go", "AOL"]
    var linksImage = [#imageLiteral(resourceName: "googleImage") , #imageLiteral(resourceName: "bingImage") , #imageLiteral(resourceName: "YahooImage") , #imageLiteral(resourceName: "duckduck"), #imageLiteral(resourceName: "AolImage") ]
    var linkUrls = ["https://www.google.com/search?q=", "https://www.bing.com/search?q=", "https://in.search.yahoo.com/search?q=", "https://duckduckgo.com/?q=", "https://www.aol.com/aol/search?q="]
    
    var collectionView : UICollectionView!
    var labels : UILabel!
    var screenHeight = 0.0
    var screenWidth = 0.0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        screenWidth = self.view.frame.width
        screenHeight = self.view.frame.height
        self.setupcollectionview()
        self.setuplabel()
        collectionView.register(UINib(nibName: "SelectCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SelectCollectionViewCell")
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension ViewController {
    func setupcollectionview(){
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//        layout.itemSize = CGSize(width: 100, height: 100)
        let collectionFrame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        collectionView = UICollectionView(frame: collectionFrame, collectionViewLayout: layout)
//        collectionView.backgroundColor = .green
        self.view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(self.view).offset(250)
            make.bottom.equalTo(self.view).offset(-225)
            make.left.equalTo(self.view).offset(10)
            make.right.equalTo(self.view).offset(-10)
        }
    }
    
    func setuplabel(){
        let rectFrame = CGRect(x: 0, y: 0, width: 100, height: 35)
        labels = UILabel(frame: rectFrame)
        labels.text = " Choose A Search Engine "
        self.view.addSubview(labels)
        labels.layer.borderWidth = 2
        labels.layer.borderColor = UIColor.black.cgColor
        labels.layer.cornerRadius = 10.0
        labels.translatesAutoresizingMaskIntoConstraints = false
        labels.snp.makeConstraints { make in
            make.top.equalTo(self.view).offset(200)
            make.bottom.equalTo(self.view).offset(-610)
            make.center.equalTo(self.view)
        }
        
    }
}

extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return linksArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectCollectionViewCell", for: indexPath) as! SelectCollectionViewCell
        cell.linkName.text = linksArray[indexPath.row]
        cell.imageLink.image = linksImage[indexPath.row]
        cell.layer.borderWidth = 2.0
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.cornerRadius = 10
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width/2 - 2.0, height: self.collectionView.frame.width/3 - 2.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2.0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        var webBrowserVC = self.storyboard?.instantiateViewController(withIdentifier: "webbrowser") as! webBrowserViewController
        
        switch indexPath.row {
            case 0 :
                webBrowserVC.currentLink = linkUrls[indexPath.row]
            case 1:
                webBrowserVC.currentLink = linkUrls[indexPath.row]
            case 2:
                webBrowserVC.currentLink = linkUrls[indexPath.row]
            case 3:
                webBrowserVC.currentLink = linkUrls[indexPath.row]
            case 4:
                webBrowserVC.currentLink = linkUrls[indexPath.row]
            default:
                print("No Link Are Pressed")
        }
        
        self.navigationController?.pushViewController(webBrowserVC, animated: true)
    }
    
}


