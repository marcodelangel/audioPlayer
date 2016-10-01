//
//  DetailViewController.swift
//  audioPlayer
//
//  Created by Marco Del Angel on 27/09/16.
//  Copyright © 2016 Marco Del Angel. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var coverImage: UIImageView!
    var cover : UIImage = UIImage(imageLiteral: "noCoverImage.jpg")
    
    @IBOutlet weak var songName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coverImage.image = cover

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
