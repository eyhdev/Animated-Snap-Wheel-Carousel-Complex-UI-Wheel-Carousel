//
//  Home.swift
//  CustomCarouselSlider
//
//  Created by Developer Light on 28.07.2022.
//

import SwiftUI

struct Home: View {
    @State var currentIndex = 0
    var body: some View {
        ZStack{
            TabView(selection: $currentIndex){
                ForEach(posts.indices,id: \.self){index in
                    GeometryReader{proxy in
                        Image(posts[index].postImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: proxy.size.width,height: proxy.size.height)
                            .cornerRadius(0)
                            .blur(radius: 22)
                      }
                    .ignoresSafeArea()
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
             .animation(.easeInOut, value: currentIndex)
            .overlay(
             LinearGradient(colors: [
             Color.black.opacity(0.2),
             Color.black.opacity(0.2),
             Color.black,
             Color.black.opacity(0.2),
               ], startPoint: .top, endPoint: .bottom)
        )
             .ignoresSafeArea()
            SnapCarousel(trailingSpace: 180, index: $currentIndex , items: posts){post in
               CardView(post: post)
            }
            .offset(y: getRect().height / 5)
       }
    }
    @ViewBuilder
    func CardView(post: Post)->some View{
        VStack(spacing:40){
            GeometryReader{proxy in
                Image(post.postImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: proxy.size.width, height: proxy.size.height)
                    .cornerRadius(35)
            }
            .frame(height: getRect().height / 2.2)
            .padding(.bottom, 13)
            
           HStack(spacing: 2){
                ForEach(1...5, id: \.self){ index in
                    Image(systemName: "star.fill")
                        .foregroundColor(index <= post.starRating ? .yellow : .gray)
                 }
                Text("(\(post.starRating).0)")
                    .foregroundColor(.white)
            }
        }
    }
}
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
extension View{
    func getRect()->CGRect{
        return UIScreen.main.bounds
    }
}
