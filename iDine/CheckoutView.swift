//
//  CheckoutView.swift
//  iDine
//
//  Created by Francis Breidenbach on 7/5/24.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order

    @State private var paymentType = "Cash"
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tipSize = 0

    let paymentTypes = ["Cash", "Credit Card", "iDine Points"]
    let tipTest = [10]
    let tipSizes = [7, 10, 15, 0]

    var body: some View {
        Form {
            Section {
                Picker("How do you want to pay?", selection: $paymentType) {
                    ForEach(paymentTypes, id: \.self) {
                        Text($0)
                    }
                }
                Toggle("Add iDine loyalty card", isOn: $addLoyaltyDetails.animation())
                if addLoyaltyDetails {
                    TextField("Enter your iDine ID", text: $loyaltyNumber)
                }
            }
            Section("Add a tip?") {
                Picker("Percentage:", selection: $tipSize) {
                    ForEach(tipSizes, id: \.self) {
                        Text("\($0)")
                    }
                }
                .pickerStyle(.segmented)
            }
            Section("Total: $100") {
                Button("Confirm Order") {
                    // TODO: Place the order
                }
            }
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    CheckoutView().environmentObject(Order())
}
