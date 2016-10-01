//
//  Song.swift
//  audioPlayer
//
//  Created by Marco Del Angel on 01/10/16.
//  Copyright © 2016 Marco Del Angel. All rights reserved.
//

import Foundation
import UIKit

struct Song {
    var titulo : String?
    var url : NSURL?
    var cover : UIImage?
    
    init(titulo:String?, url:NSURL?, cover:UIImage?){
        self.titulo = titulo
        self.url = url
        self.cover = cover
    }
}
