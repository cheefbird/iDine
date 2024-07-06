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
    @State private var showingPaymentAlert = false

    // TODO: Refactor to optimize totalPrice & tipAmount
    var totalPrice: String {
        let total = Double(order.total)
        let tipValue = total / 100 * Double(tipSize)
        return (total + tipValue).formatted(.currency(code: "USD"))
    }

    var tipAmount: String {
        let total = Double(order.total)
        let tipValue = total / 100 * Double(tipSize)
        return tipValue.formatted(.currency(code: "USD"))
    }

    let paymentTypes = ["Cash", "Credit Card", "iDine Points"]
    let tipSizes = [7, 10, 15, 20, 0]

    var body: some View {
        Form {
            Section {
                Picker("How do you want to pay?", selection: $paymentType) {
                    ForEach(paymentTypes, id: \.self) {
                        Text($0)
                    }
                }
                Toggle(
                    "Add iDine loyalty card",
                    isOn: $addLoyaltyDetails.animation()
                )
                if addLoyaltyDetails {
                    TextField("Enter your iDine ID", text: $loyaltyNumber)
                }
            }

            Section("Add a tip?") {
                Picker("Percentage", selection: $tipSize) {
                    ForEach(tipSizes, id: \.self) {
                        Text("\($0)%")
                    }
                }
                .pickerStyle(.segmented)

                if tipSize > 0 {
                    Text("Tip: \(tipAmount)")
                        .padding(.leading, 30)
                        .fontWeight(.light)
                        .italic()
                        .font(.footnote)
                }
            }

            Section("Total: \(totalPrice)") {
                Button("Confirm Order") {
                    showingPaymentAlert.toggle()
                }
            }
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Order Confirmed", isPresented: $showingPaymentAlert) {
            // TODO: Add custom buttons here
        } message: {
            Text("Your total was \(totalPrice) -- Thank You!")
        }
    }
}

#Preview {
    CheckoutView().environmentObject(Order())
}
