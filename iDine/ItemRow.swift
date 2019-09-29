//
//  ItemRow.swift
//  iDine
//
//  Created by Francis Breidenbach on 9/29/19.
//  Copyright © 2019 Francis Breidenbach. All rights reserved.
//

import SwiftUI

struct ItemRow: View {
  var item: MenuItem
  
  var body: some View {
    HStack {
      Image(item.thumbnailImage)
      
      VStack(alignment: .leading) {
        Text(item.name)
        Text(String("$\(item.price)"))
      }
    }
  }
}

struct ItemRow_Previews: PreviewProvider {
  static var previews: some View {
    ItemRow(item: MenuItem.example)
  }
}
