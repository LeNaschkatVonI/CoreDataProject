//
//  AdvancedContentView.swift
//  CoreDataProject
//
//  Created by Максим Нуждин on 27.06.2021.
//

import SwiftUI
import CoreData

struct AdvancedContentView: View {
    
    @Environment(\.managedObjectContext) var viewContext
    @State var filter: String = ""
    var genreArray = ["co-op", "solo"]
    
    var body: some View {
        VStack {
            FilteredGameList(filterKey: "genre", filterValue: filter) { (gameProvide: Games) in
                HStack {
                    Text(gameProvide.wrappedGenre)
                    Text(gameProvide.wrappedTitle)
                }
            }
            
            Button("add games") {
                let remnant = Games(context: viewContext)
                remnant.genre = "co-op"
                remnant.title = "remnant"
                
                let codeVein = Games(context: viewContext)
                codeVein.genre = "co-op"
                codeVein.title = "codeVein"
                
                let detroid = Games(context: viewContext)
                detroid.genre = "solo"
                detroid.title = "Detroit: Become degrod"
                
                try? viewContext.save()
            }
            Picker("select sorting way", selection: $filter) {
                ForEach(genreArray, id: \.self) {
                    Text($0)
                }
            }
        }
    }
}

struct AdvancedContentView_Previews: PreviewProvider {
    static var previews: some View {
        AdvancedContentView()
    }
}
