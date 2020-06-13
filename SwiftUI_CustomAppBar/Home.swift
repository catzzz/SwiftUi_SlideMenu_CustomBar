//
//  Home.swift
//  SwiftUI_CustomAppBar
//
//  Created by Jimmy Leu on 2020/6/13.
//  Copyright © 2020 Jimmy Leu. All rights reserved.
//

import SwiftUI

struct Home: View {
    @State var search = ""
    @State var detailCard : Card = data[0] // Intialization
    @State var show = false
    @State var menu = false
    
    
    var body: some View {
        ZStack{
            // Navigation Link
            NavigationLink(destination: DetailPage(detail: self.detailCard, show: self.$show), isActive: self.$show) {
                Text("")
            }
            
            VStack(spacing: 0){
                   VStack(spacing: 20){
                       HStack{
                           Text("Home")
                               .fontWeight(.bold)
                               .font(.title)
                           
                           Spacer(minLength: 0)
                           Button(action: {
                               
                           }) {
                               Image(systemName: "gear")
                                   .font(.system(size: 25, weight: .bold))
                                   
                           }
                       }
                       .foregroundColor(.white)
                       .padding(.horizontal)
                       
                       HStack(spacing: 15){
                           
                           Button(action: {
                                // Toggling Menu
                            withAnimation {
                                self.menu.toggle()
                            }
                            
                           }) {
                               Image(systemName: "list.dash")
                                   
                           }
                           
                           TextField("Search", text: self.$search)
                           
                           Button(action: {
                               
                           }) {
                               Image(systemName: "magnifyingglass")
                                   
                           }
                           
                           Button(action: {
                               
                           }) {
                               Image(systemName: "bell.fill")
                                   
                           }
                           
                           
                       }
                       .padding()
                       .background(Color.white)
                       .padding(.horizontal, 25)
                       // shadow...
                       .shadow(color: Color.black.opacity(0.11), radius: 5, x: 5, y: 5)
                   }
                   .padding(.top, (UIApplication.shared.windows.first?.safeAreaInsets.top)! + 8)
                   .padding(.horizontal)
                   // reduing height..
                   .padding(.bottom, -25)
                   .background(Color.green)
                       .zIndex(1)
                   
                   ScrollView(.vertical, showsIndicators: false){
                       VStack(spacing: 15){
                           ForEach(data) { i in
                               Image(i.image)
                               .resizable()
                                   .frame(height:250)
                               .cornerRadius(15)
                                   .onTapGesture{
                                       self.detailCard = i
                                       // Navigation
                                       self.show.toggle()
                                       
                               }
                           }
                       }
                       .padding([.horizontal, .bottom])
                       .padding(.top, 45)
                   }
            
               }
            
            // Slide Out Menu
            
            HStack{
                VStack(spacing:15){
                    Image("john_snow")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                        .padding(.top, (UIApplication.shared.windows.first?.safeAreaInsets.top)! + 30)
                    
                    Text("John Snow")
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                    Spacer(minLength: 0)
                }
                    // Custom width
                .frame(width: UIScreen.main.bounds.width / 1.5)
                .background(Color.white)
                
                Spacer(minLength: 0)
            }
            // hiddent view...
                .offset(x: self.menu ? 0 : -UIScreen.main.bounds.width)
                .background(Color.black.opacity(self.menu ? 0.28 : 0).edgesIgnoringSafeArea(.all).onTapGesture {
                // Close side menu
                withAnimation {
                    self.menu.toggle()
                }
                
            })
               
        }.background(Color.black.opacity(0.07).edgesIgnoringSafeArea(.all))
        .edgesIgnoringSafeArea(.all)
        
        
        
        
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


struct Card: Identifiable {
    var id: Int
    var image: String
    var title : String
    var details:String
}


var data = [
    Card(id: 0, image: "turtlerock", title: "National Park Turtlerock", details: "Turtle Rock Park Campground is located near Markleeville, California at an elevation of 6100'. It is 29 miles south of South Lake Tahoe, California and 32 miles west of Carson City, Nevada. The park has a combination of 26 RV or trailer sites, two of which are handicap accessible."),
    Card(id: 1, image: "download", title: "National Park download", details: "Turtle Rock Park Campground is located near Markleeville, California at an elevation of 6100'. It is 29 miles south of South Lake Tahoe, California and 32 miles west of Carson City, Nevada. The park has a combination of 26 RV or trailer sites, two of which are handicap accessible.")
]
