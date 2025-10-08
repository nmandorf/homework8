/*.
 Homework 8
 I’ve added a description page for each food item that explains what
 it is, along with a larger image and photo credit. I’ve also included
 the price for each item so users can see the cost. Lastly, I placed
 dietary restrictions at the bottom of the description.
 Noa Mandorf
 10/7/25
 */

import SwiftUI
let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")

struct cars: View {
    var body: some View {
        Text("Tesla")
        Text("Prius")
        Text("Rav4")
    }
}


struct FoodDetail: View {
    var body: some View {
        List {
            ForEach(menu) { section in
                NavigationLink(destination: {
                    List {
                        ForEach(section.items) { item in
                            NavigationLink(destination: {
                                VStack{
                                    VStack(alignment: .trailing) {
                                        Image("\(item.mainImage)")
                                        Text("\(item.photoCredit)")
                                            .font(.footnote)
                                            .multilineTextAlignment(.trailing)
                                            .padding(.trailing)
                                    }
                                    Text(item.name)
                                        .font(.title)
                                        .fontWeight(.semibold)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.leading)
                                    Text(item.description)
                                        .padding([.top, .leading, .trailing])
                                    Text("\(item.restrictions)")
                                        .padding([.top, .leading])
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    Spacer()
                                    
                                }}){
                                    HStack{
                                        HStack(alignment: .top) {
                                            Image(item.thumbnailImage)
                                            Text(item.name)
                                        }
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        Text("$\(item.price).00")
                                    }
                                }
                        }
                    }.frame(maxWidth: .infinity, alignment: .leading)
                        .listStyle(.plain)
                        .listRowInsets(EdgeInsets())
                }) {
                    Text(section.name)
                }
            }
        }.frame(maxWidth: .infinity, alignment: .leading)
            .listStyle(.plain)
            .listRowInsets(EdgeInsets())
    }
}



struct ContentView: View {
    var body: some View {
        NavigationView{
            List {
                NavigationLink(destination: cars()){
                    HStack(alignment: .center, spacing: 10) {
                        Image(systemName: "car.fill")
                        Text("Cars")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }

                
                    HStack(alignment: .center, spacing: 10) {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                

              
                    HStack(alignment: .center, spacing: 10) {
                        Image(systemName: "figure.run")
                        Text("Fitness")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                

                NavigationLink(destination: FoodDetail()) {
                    HStack(alignment: .center, spacing: 10) {
                        Image(systemName: "fork.knife")
                        Text("Food")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .navigationTitle("Menu")
        }
    }
}

#Preview {
    ContentView()
}
