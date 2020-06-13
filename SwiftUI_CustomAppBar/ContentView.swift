//
//  ContentView.swift
//  SwiftUI_CustomAppBar
//
//  Created by Jimmy Leu on 2020/6/13.
//  Copyright © 2020 Jimmy Leu. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // Embedding Navigation View...
        
        NavigationView{
            Home()
                .navigationBarTitle("",displayMode: .inline)
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
