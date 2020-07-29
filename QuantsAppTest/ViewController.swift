//
//  ViewController.swift
//  QuantsAppTest
//
//  Created by EPIC CHANNEL on 29/07/20.
//  Copyright © 2020 QuantsApp. All rights reserved.
//

import UIKit
import EmptyDataSet_Swift

class ViewController: UIViewController, EmptyDataSetDelegate {
    
    fileprivate let feedTVC: String = "feedTVC"
    
    @IBOutlet weak var tableView: UITableView!
    
    fileprivate var feeds: [Feed] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(feedTVC.getNIB(), forCellReuseIdentifier: feedTVC)
        
        getFeed()
    }
    
    func setEmptyTableView(){
        self.feeds = []
        tableView.emptyDataSetView { (view) in
            view.titleLabelString(NSAttributedString(string: "No  feeds Found for now!!"))
            view.image(#imageLiteral(resourceName: "no_result"))
            
        }
        self.tableView.reloadData()
    }



    func getFeed(){
        self.loadingView(flag: true)
        NetworkManager.sharedInstance.getFeed { (feeds, error) in
            if !(feeds.isEmpty){
                
                self.feeds = feeds
                DispatchQueue.main.async {
                    self.loadingView(flag: false)
                    self.tableView.reloadData()
                }
            }else{
                DispatchQueue.main.async {
                    self.loadingView(flag: false)
                    self.setEmptyTableView()
                }
            }
        }
    }
}

extension ViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feeds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: feedTVC, for: indexPath) as! feedTVC
        cell.populateFeed(feeds[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 238
    }
}

