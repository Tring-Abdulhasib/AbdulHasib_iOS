//
//  DataModel.swift
//  AbdulHasib_iOS
//
//  Created by Abdul Hasib on 16/09/25.
//

import Foundation


struct PlaylistResponse : Decodable {
    let title: String
    let playlist : [PlaylistMediaList]
}

struct PlaylistMediaList : Decodable {
    let title : String
    let image : String
    let description: String
}
