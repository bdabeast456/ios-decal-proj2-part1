//
//  ThreadSelectionViewController.swift
//  snapChatProject
//
//  Created by Brandon Pearl on 3/13/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class ThreadSelectionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var userSelection: UILabel!
    
    var imageToPost: UIImage!
        
    @IBOutlet weak var threadTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        threadTable.delegate = self
        threadTable.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection: Int) -> Int {
        return threadNames.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        userSelection.text = threadNames[indexPath.row]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellToReturn: ThreadPostCell = threadTable.dequeueReusableCell(withIdentifier: "threadID", for: indexPath) as! ThreadPostCell
        cellToReturn.threadName.text = threadNames[indexPath.row]
        return cellToReturn
    }
    
    @IBAction func madeIntentToPost(_ sender: UIButton) {
        if let destThread = userSelection.text {
            threads[destThread]!.append(PostInfo(imageToPost!, "bpearl"))
            let alert = UIAlertController(title: "Post Successful!",
                                          message: "Your image has been successfully posted to " + destThread,
                                          preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Return",
                                          style: UIAlertActionStyle.default,
                                          handler: {
                                            action in
                                            _ = self.navigationController?.popViewController(animated: true)
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
