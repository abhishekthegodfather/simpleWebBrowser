//
//  webBrowserViewController.swift
//  webviewTutorials
//
//  Created by Cubastion on 12/01/23.
//

import UIKit
import WebKit

class webBrowserViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var reloadBtn: UIButton!
    @IBOutlet weak var forewordBtn: UIButton!
    
    
    var currentLink = ""
    
    var presenter = ViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        self.stylingbtn()
        self.hidebtn()
        self.btnAction()
        self.webView.isHidden = true
    }
}

extension webBrowserViewController : UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let query = searchBar.text else { return }
        var encodedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string: currentLink+encodedQuery!)
        let request = URLRequest(url: url!)
        self.showbtn()
        self.webView.isHidden = false
        webView.load(request)
    }
    
    func stylingbtn(){
        backBtn.layer.borderColor = UIColor.black.cgColor
        reloadBtn.layer.borderColor = UIColor.black.cgColor
        forewordBtn.layer.borderColor = UIColor.black.cgColor
        
        backBtn.layer.borderWidth = 2.0
        reloadBtn.layer.borderWidth = 2.0
        forewordBtn.layer.borderWidth = 2.0
        
        backBtn.layer.cornerRadius = 10.0
        reloadBtn.layer.cornerRadius = 10.0
        forewordBtn.layer.cornerRadius = 10.0
    }
    
    func hidebtn(){
        backBtn.isHidden = true
        reloadBtn.isHidden = true
        forewordBtn.isHidden = true
    }
    
    func showbtn(){
        backBtn.isHidden = false
        reloadBtn.isHidden = false
        forewordBtn.isHidden = false
    }
    
    func btnAction(){
        self.forewordBtn.addTarget(self, action: #selector(forAction(_ :)), for: .touchUpInside)
        self.reloadBtn.addTarget(self, action: #selector(relAction(_ :)), for: .touchUpInside)
        self.backBtn.addTarget(self, action: #selector(bkpAction(_ :)), for: .touchUpInside)
    }
    
    @objc func forAction(_ sender : UIButton){
        webView.goForward()
    }
    
    @objc func relAction(_ sender : UIButton){
        webView.reload()
    }
    
    @objc func bkpAction(_ sender : UIButton){
        webView.goBack()
    }
    
}


