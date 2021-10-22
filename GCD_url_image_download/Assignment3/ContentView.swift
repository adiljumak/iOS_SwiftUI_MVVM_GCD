//
//  ContentView.swift
//  Assignment3
//
//  Created by Adilzhan Jumakanov on 14.10.2021.
//

import SwiftUI





struct ContentView: View {
    
    var body: some View {
        
        NavigationView {
            VStack{
        NavigationLink(destination: Detail(url:  "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b4/Flag_of_Turkey.svg/1200px-Flag_of_Turkey.svg.png")) {
                        Text("Turkey")
                }
            
        NavigationLink(destination: Detail(url:  "https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Flag_of_Australia_%28converted%29.svg/1200px-Flag_of_Australia_%28converted%29.svg.png")) {
                        Text("Austrailia")
                }
                
                
                NavigationLink(destination: Detail(url:  "https://static.toiimg.com/photo/82901922.cms")) {
                                Text("UAE")
                        }
            }
            
            
        }
        
            
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


