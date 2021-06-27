//
//  FilteredGameList.swift
//  CoreDataProject
//
//  Created by Максим Нуждин on 27.06.2021.
//

import SwiftUI
import CoreData

struct FilteredGameList<T: NSManagedObject, Content: View>: View {
    
    var fetchRequest: FetchRequest<T>
    var games: FetchedResults<T> { fetchRequest.wrappedValue }
    let content: (T) -> Content
    
    var body: some View {
        List(games, id: \.self) { game in
            HStack {
                content(game)
            }
        }
    }
    init(filterKey: String, filterValue: String, @ViewBuilder content: @escaping (T) -> Content) {
        fetchRequest = FetchRequest<T>(entity: T.entity(), sortDescriptors: [], predicate: NSPredicate(format: "%K == %@", filterKey, filterValue))
        self.content = content
    }
}
