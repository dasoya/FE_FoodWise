//
//  HotRecipeView.swift
//  FoodWise
//
//  Created by dasoya on 26.02.23.
//

//import ImageSlidesShow
import SwiftUI
import ImageSlideshow
import UIKit

struct HotRecipeView: View {
    
    var slideshow = ImageSlideshow()
    
    var body: some View {
        
        NavigationView {
            
               List {
                    ImageSlider()
                        .frame(height: 300)
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
                .toolbar(.hidden, for: .navigationBar)
                .edgesIgnoringSafeArea(.all)
        }
      
        
        
    }
}

struct ImageSlider: View {
    
    // 1
    private let images = ["sample", "sample1", "sample"]
    
    var body: some View {
        // 2
        ScrollView {
            TabView {
                ForEach(images, id: \.self) { item in
                    getGradientImage(image: item)
                        .ignoresSafeArea()
                } .ignoresSafeArea()
            }
            .frame(
                width: UIScreen.main.bounds.width ,
                height: UIScreen.main.bounds.height
            )
            .frame(minWidth: 0, maxWidth: .infinity)
            .tabViewStyle(PageTabViewStyle())
            .onAppear {
                setupAppearance()
            }}
        
    }
    
    func setupAppearance() {
       UIPageControl.appearance().currentPageIndicatorTintColor = .black
       UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
     }
}



    func getGradientImage(image : String) -> some View {
        
       return  ZStack{
            
            
//                    Image(item)
//                        .resizable()
//                        .frame(height: 467)
//                        .scaledToFill()
//
//                    Blur(style: .light)
//                        .frame(height: 467)

            Rectangle()
                .fill(.white)
            
            
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxHeight: .infinity)//467

                .mask(
                    LinearGradient(gradient:
                                    Gradient(stops:[
                                        .init(color: Color.white, location: 0),
                                        .init(color:Color.white, location: 0.3),
                                        .init(color:Color.white.opacity(0), location: 1.0)]), startPoint: .top, endPoint: .bottom)
                )
        }.edgesIgnoringSafeArea(.top)
    }
    


struct HotRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        HotRecipeView()
    }
}

struct Blur: UIViewRepresentable {
    
    var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}
