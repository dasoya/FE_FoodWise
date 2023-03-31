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
                       // .frame(height: 467)
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
                .edgesIgnoringSafeArea(.all)
        }}
}

struct ImageSlider: View {
    
    // 1
    @StateObject private var dataModel = RecipesDataModel()
    //private let images = ["sample", "sample1", "sample"]
    
    init() {
         UIScrollView.appearance().bounces = false
      }
    
    func recipeView(recipes : [Recipe]) -> some View {
        
        ForEach(recipes) { recipe in
            NavigationLink(destination: RecipeDetailView(recipe: recipe)){
                ZStack(alignment: .bottomLeading){
                    getGradientImage(image: recipe.image ?? Image("sample"))
                        .ignoresSafeArea()
                    
                    VStack(alignment: .leading){
                        Text("지금 HOT한 레시피")
                            .subTitle1()
                            
                            .padding(.bottom,1)
                        
                        Text(recipe.name)
                            .title1()
                    }
                    .padding(.leading,20)
                    .padding(.bottom,50)
                    
                }.foregroundColor(.black)
                
            }
        } .ignoresSafeArea()
        
    }
    
    var body: some View {
        // 2
        
        ScrollView(showsIndicators: false) {
            TabView {
                recipeView(recipes: dataModel.hotRecipes.count != 0 ? dataModel.hotRecipes : TestData.hotrecipe )
                
            }
            .frame(
                width: UIScreen.main.bounds.width ,
                height: 467
            )
            .tabViewStyle(PageTabViewStyle())
            .onAppear {
                setupAppearance()
                dataModel.fetch()
            }
            
        }
       
        
    }
    
    func setupAppearance() {
       UIPageControl.appearance().currentPageIndicatorTintColor = .black
       UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
     }
}



    func getGradientImage(image : Image) -> some View {
        
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
            
            
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width,height: 467)//467
                .mask(
                    LinearGradient(gradient:
                                    Gradient(stops:[
                                        .init(color: Color.white, location: 0),
                                        .init(color:Color.white, location: 0.3),
                                        .init(color:Color.white.opacity(0), location: 1.0)]), startPoint: .top, endPoint: .bottom)
                )
        }
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
