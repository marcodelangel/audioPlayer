//
//  DetailViewController.swift
//  audioPlayer
//
//  Created by Marco Del Angel on 27/09/16.
//  Copyright © 2016 Marco Del Angel. All rights reserved.
//

import UIKit
import AVFoundation

class DetailViewController: UIViewController {

    private var reproductor : AVAudioPlayer!
    
    @IBOutlet weak var coverImage: UIImageView!
    var cover : UIImage = UIImage(imageLiteral: "noCoverImage.jpg")
    @IBOutlet weak var songName: UILabel!
    var tituloDeLaCancion : String = "No song selected"
    var songURL = NSURL()
    @IBOutlet weak var volumeSlider: UISlider!
    var songList = [Song] ()
    var actualIndexSong = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coverImage.image = cover
        songName.text = tituloDeLaCancion
        
        do{
            try reproductor =  AVAudioPlayer(contentsOfURL: songURL)
        }catch{
            print("Error en la reproducción")
        }
        
        reproductor.play()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func play() {
        if !reproductor.playing{
            reproductor.play()
        }
    }

    @IBAction func pause() {
        if reproductor.playing{
           reproductor.pause()
        }
    }
    
     @IBAction func stop() {
        if reproductor.playing{
            reproductor.pause()
            reproductor.currentTime = 0.0
        }
        if !reproductor.playing{
            reproductor.currentTime = 0.0
        }
     }
   
    @IBAction func volumen() {
        
        let volume = volumeSlider.value
        reproductor.volume = volume
        
    }
    @IBAction func nextSong() {
        
        var nextSongToPlay = self.songList[actualIndexSong]
        
        if actualIndexSong == self.songList.count-1{
            
            actualIndexSong = 0
            nextSongToPlay = self.songList[actualIndexSong]
        
        }else{
            
         actualIndexSong = self.actualIndexSong + 1
        nextSongToPlay = self.songList[actualIndexSong]

        }
       
        self.songURL = nextSongToPlay.url!
        
        do{
            try reproductor =  AVAudioPlayer(contentsOfURL:songURL)
        }catch{
            print("Error en la reproducción")
        }
        reproductor.play()
        self.tituloDeLaCancion = nextSongToPlay.titulo!
        self.cover = nextSongToPlay.cover!
        
        self.viewDidLoad()
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }*/


}
