//
//  MoreAdvancedContentView.swift
//  CoreDataProject
//
//  Created by Максим Нуждин on 28.06.2021.
//

import SwiftUI

struct MoreAdvancedContentView: View {
    
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(entity: Country.entity(), sortDescriptors: []) var countries: FetchedResults<Country>
    
    var body: some View {
        VStack {
            List {
                ForEach(countries, id: \.self) { country in
                    Section(header: Text(country.wrappedFullName)) {
                        ForEach(country.candyArray, id: \.self) { candy in
                            Text(candy.wrappedName)
                        }
                    }
                }
            }
            Button("add candy"){
                let candy1 = Candy(context: viewContext)
                candy1.name = "Mars"
                candy1.origin = Country(context: viewContext)
                candy1.origin?.shortName = "UK"
                candy1.origin?.name = "United Kingdom"
                
                let candy2 = Candy(context: viewContext)
                candy2.name = "KitKat"
                candy2.origin = Country(context: viewContext)
                candy2.origin?.shortName = "UK"
                candy2.origin?.name = "United Kingdom"
                
                let candy3 = Candy(context: viewContext)
                candy3.name = "Twix"
                candy3.origin = Country(context: viewContext)
                candy3.origin?.shortName = "UK"
                candy3.origin?.name = "United Kingdom"
                
                let candy4 = Candy(context: viewContext)
                candy4.name = "Toblerome"
                candy4.origin = Country(context: viewContext)
                candy4.origin?.shortName = "CH"
                candy4.origin?.name = "Switzerland"
                
                try? viewContext.save()
            }
        }
    }
}

struct MoreAdvancedContentView_Previews: PreviewProvider {
    static var previews: some View {
        MoreAdvancedContentView()
    }
}
