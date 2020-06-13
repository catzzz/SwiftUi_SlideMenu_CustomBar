//
//  DetailPageswift.swift
//  SwiftUI_CustomAppBar
//
//  Created by Jimmy Leu on 2020/6/13.
//  Copyright © 2020 Jimmy Leu. All rights reserved.
//

import SwiftUI

struct DetailPage: View {
    @State var detail: Card
    @Binding var show: Bool
    
    var body: some View {
        VStack(spacing: 0){
            HStack(spacing: 20) {
                
                Button(action: {
                    // Poping View back
                    self.show.toggle()
                }) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 24, weight: .bold))
                    
                }
                Text(self.detail.title)
                    .font(.title)
                    .fontWeight(.bold)
                Spacer(minLength: 0)
            }
            .foregroundColor(.white)
            .padding(.top, (UIApplication.shared.windows.first?.safeAreaInsets.top)! + 8)
            .padding([.horizontal,.bottom])
            .background(Color.green)
            
            Image(self.detail.image)
                .resizable()
                .frame( height: 320)
            
            VStack(alignment: .leading, spacing: 15){
                Text(self.detail.title)
                    .fontWeight(.bold)
                    .font(.title)
                
                Text(self.detail.details)

            }.foregroundColor(.black)
                .padding()
            
            Spacer(minLength: 0)
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

//struct DetailPageswift_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailPageswift()
//    }
//}
