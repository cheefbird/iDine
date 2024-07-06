//
//  MainView.swift
//  iDine
//
//  Created by Francis Breidenbach on 7/5/24.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        TabView {
            Tab("Menu", systemImage: "list.dash") {
                ContentView()
            }
            
            Tab("Order", systemImage: "square.and.pencil") {
                OrderView()
            }
                
        }
    }
}

#Preview {
    MainView().environmentObject(Order())
}
