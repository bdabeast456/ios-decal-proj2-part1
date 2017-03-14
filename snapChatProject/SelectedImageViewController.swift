//
//  SelectedImageViewController.swift
//  snapChatProject
//
//  Created by Brandon Pearl on 3/13/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class SelectedImageViewController: UIViewController {
    
    @IBOutlet weak var imageToView: UIImageView!
    var uiImageToView: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageToView.image = uiImageToView
        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = true
        imageToView.isUserInteractionEnabled = true
        let goBack = UITapGestureRecognizer(target: self, action: #selector(SelectedImageViewController.backToPrevious))
        imageToView.addGestureRecognizer(goBack)
        // Do any additional setup after loading the view.
    }

    func backToPrevious() -> Void {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
