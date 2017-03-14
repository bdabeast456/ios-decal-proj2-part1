//
//  FeedViewController.swift
//  snapChatProject
//
//  Created by Brandon Pearl on 3/13/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var feedTable: UITableView!
    
    var imageToView: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        feedTable.delegate = self
        feedTable.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
        self.tabBarController?.tabBar.isHidden = false
        feedTable.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section < threadNames.count {
            return threadNames[section]
        }
        return nil
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return threadNames.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection: Int) -> Int {
        return threads[threadNames[numberOfRowsInSection]]!.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let post: PostInfo = threads[threadNames[indexPath.section]]![indexPath.row]
        if !post.isRead() {
            imageToView = post.setPostReadAndGetImage()
            performSegue(withIdentifier: "FeedToPostSegue", sender: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellToReturn: PostTableCell = feedTable.dequeueReusableCell(withIdentifier: "postID", for: indexPath) as! PostTableCell
        let post: PostInfo = threads[threadNames[indexPath.section]]![indexPath.row]
        if post.isRead() {
            cellToReturn.readImage.image = #imageLiteral(resourceName: "read")
        } else {
            cellToReturn.readImage.image = #imageLiteral(resourceName: "unread")
        }
        cellToReturn.userName.text = post.getPoster()
        cellToReturn.timeSincePosted.text = post.getTimeSincePost()
        return cellToReturn
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? SelectedImageViewController {
            dest.uiImageToView = imageToView
        }
    }
 

}
