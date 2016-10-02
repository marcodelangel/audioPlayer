//
//  TableTableViewController.swift
//  audioPlayer
//
//  Created by Marco Del Angel on 27/09/16.
//  Copyright © 2016 Marco Del Angel. All rights reserved.
//

import UIKit
import AVFoundation

class TableTableViewController: UITableViewController {
    
    var songs = [Song] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sonido1Url = NSBundle.mainBundle().URLForResource("I don't worry about a thing", withExtension: "mp3")
        let sonido2Url = NSBundle.mainBundle().URLForResource("Las Transeuntes", withExtension: "mp3")
        let sonido3Url = NSBundle.mainBundle().URLForResource("LaTrama", withExtension: "mp3")
        let sonido4Url = NSBundle.mainBundle().URLForResource("Noctiluca", withExtension: "mp3")
        
       let songSample1 = Song(titulo: "I don't worry about a thing", url: sonido1Url, cover: UIImage(imageLiteral: "DondWorryAboutAThing.jpg"))
        let songSample2 = Song(titulo: "Las Transeuntes", url: sonido2Url, cover: UIImage(imageLiteral: "jorgeDrexler.jpg"))
        let songSample3 = Song(titulo: "La trama y el desenlace", url: sonido3Url, cover: UIImage(imageLiteral: "latrama.jpg"))
        let songSample4 = Song(titulo: "Noctiluca", url: sonido4Url, cover: UIImage(imageLiteral: "noctiluca.jpg"))
        
        self.songs.append(songSample1)
        self.songs.append(songSample2)
        self.songs.append(songSample3)
        self.songs.append(songSample4)
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        var rows = 0
        
        if section == 0{
            rows = 1
        }
        
        if section == 1{
            
            rows = songs.count
        }
        
        return rows
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        if indexPath.section == 0{
         
            cell.textLabel?.text = "Aleatorio"
            cell.imageView?.image = UIImage(imageLiteral: "shuffle.jpg")
    
            
        }
        
        if indexPath.section == 1{
        
        cell.textLabel?.text = self.songs[indexPath.row].titulo
        }
        
        return cell
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let detailVC = segue.destinationViewController as? DetailViewController
       
        if self.tableView.indexPathForSelectedRow?.section == 0{
            let shuffle = arc4random_uniform(UInt32(songs.count))
            let selectSong = Int(shuffle.hashValue)
            let shuffleSong = songs[selectSong]
            detailVC?.cover = shuffleSong.cover!
            detailVC?.tituloDeLaCancion = shuffleSong.titulo!
            detailVC?.songURL = shuffleSong.url!
            
        }
        
        if self.tableView.indexPathForSelectedRow?.section == 1{
        let ip = self.tableView.indexPathForSelectedRow?.row
        let selectedSong = songs[ip!]
        detailVC?.cover = selectedSong.cover!
        detailVC?.tituloDeLaCancion = selectedSong.titulo!
        detailVC?.songURL = selectedSong.url!
        }
    }
    

}
