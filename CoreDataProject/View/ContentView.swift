//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Максим Нуждин on 26.06.2021.
//

import SwiftUI
import CoreData

struct ContentView: View {

    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(entity: Ship.entity(), sortDescriptors: [], predicate: NSPredicate(format: "universe == %@", "SW")) var ships: FetchedResults<Ship>
    @FetchRequest(entity: Ship.entity(), sortDescriptors: [], predicate: NSCompoundPredicate(type: .and, subpredicates: [NSPredicate(format: "name BEGINSWITH %@", "dolboeb"), NSPredicate(format: "universe < %@", "b")])) var anotherShips: FetchedResults<Ship>
    @FetchRequest(entity: Ship.entity(), sortDescriptors: []) var wholeShips: FetchedResults<Ship>

    var body: some View {
        NavigationView {
            VStack {
                List(ships, id: \.self) { ship in
                    Text(ship.name ?? "unknown name")
                }
                Button("add ship") {
                    let ship = Ship(context: viewContext)
                    ship.name = "dolboeb"
                    ship.universe = "aw2021"
                    
                    let ship2 = Ship(context: viewContext)
                    ship2.name = "vitalya"
                    ship2.universe = "SW"
                    
                    try? viewContext.save()
                }
                Button("pure CD") {
                    for item in wholeShips {
                        viewContext.delete(item)
                    }
                    try? viewContext.save()
                }
                List(anotherShips, id: \.self) { ship in
                    Text(ship.name ?? "unknown name")
                }
            }
            .navigationBarItems(trailing: NavigationLink(
                                    destination: AdvancedContentView(),
                                    label: {
                                        /*@START_MENU_TOKEN@*/Text("Navigate")/*@END_MENU_TOKEN@*/
                                    }))
        }
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
