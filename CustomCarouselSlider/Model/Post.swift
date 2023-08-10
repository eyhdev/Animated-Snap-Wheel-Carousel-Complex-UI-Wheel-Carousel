//
//  Post.swift
//  CustomCarouselSlider
//
//  Created by Developer Light on 28.07.2022.
//

import SwiftUI
struct Post: Identifiable{
    var id = UUID().uuidString
    var postImage: String
    var starRating: Int
}
var posts = [
    Post(postImage: "post1", starRating: 4),
    
    
    Post(postImage: "post2", starRating: 5),
    
    
    Post(postImage: "post3", starRating: 4),
    
    
    Post(postImage: "post4", starRating: 5),
]
