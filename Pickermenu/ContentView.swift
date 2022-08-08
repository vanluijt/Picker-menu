//
//  ContentView.swift
//  Pickermenu
//
//  Created by P.A. van Luijt on 08/08/2022.
//

import SwiftUI

struct ContentView: View {
    let locations = [
        "Mexico City",
        "New York City",
        "Los Angeles",
        "Toronto",
        "Chicago",
        "Houston",
        "Havana",
        "Montréal",
        "Ecatepec de Morelos",
        "Philadelphia"
    ]
    
    let menuItems = [
        "Sweet potato fries",
        "Nachos",
        "Grilled salmon salad",
        "Pad thai",
        "Fish tacos",
        "Turkey burger",
        "Poutine",
        "Potato leek soup"
    ]
    
    let times = [
        "5 pm",
        "6 pm",
        "7 pm",
        "8 pm",
        "9 pm"
    ]
    
    @State private var locationSelection = 2
    @State private var menuSelection = 4
    @State private var timeSelection = 2
    @State private var time = Date()
    
    var body: some View {
        VStack(){
            Text("Ottimo Ristorante").bold()
            HStack{
                Picker("Location:",selection: $locationSelection){
                    ForEach(0..<locations.count) {
                        index in Text(locations[index]).tag(index)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                Text(locations[locationSelection])
                    .padding(.leading,15)
            }
            VStack{
                Text("Order:")
                Picker("Menu:",selection: $menuSelection){
                    ForEach(0..<menuItems.count){
                        index in Text(menuItems[index]).tag(index)
                    }
                }
                .pickerStyle(WheelPickerStyle())
 
            }
        
                Text("Pickup time:")
                Picker("Pu time:", selection: $timeSelection){
                    ForEach(0..<times.count){
                        index in Text(times[index]).tag(index)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                Button("kies voor mij"){
                    locationSelection = .random(in: 0..<locations.count)
                    menuSelection = .random(in: 0..<menuItems.count)
                    timeSelection = .random(in: 0..<times.count)
                }
           
        }.padding(.bottom,50)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
