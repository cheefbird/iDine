//
//  ItemDetail.swift
//  iDine
//
//  Created by Francis Breidenbach on 7/5/24.
//

import SwiftUI

struct ItemDetail: View {
    @EnvironmentObject var order: Order

    let item: MenuItem

    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .background(.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(y: -3)
            }
            Text(item.description)
                .padding()

            Button("Order This") {
                order.add(item: item)
            }
            .buttonStyle(.borderedProminent)

            Spacer()
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        ItemDetail(item: MenuItem.example)
            .environmentObject(Order())
    }
}
