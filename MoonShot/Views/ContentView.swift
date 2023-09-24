//
//  ContentView.swift
//  MoonShot
//
//  Created by Joseph Norris on 21/08/2023.
//

import SwiftUI

struct ContentView: View {
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    let mission : [Mission] = Bundle.main.decode("missions.json")
    
    let coloumns = [
        GridItem(.adaptive(minimum: 150))]
    
   
    
 
    
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVGrid(columns: coloumns){
                    ForEach(mission) { mission in
                        NavigationLink{
                            MissionView(mission: mission, astronauts: astronauts)
                        }
                    label: {
                        VStack{
                            Image(mission.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .padding()
                            VStack {
                               
                                Text(mission.displayName)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                
                            
                                    
                                
                                Text(mission.formattedlaunchdate)
                                    .font(.caption)
                                    .foregroundColor(.white.opacity(0.5))
                                    
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.vertical)
                            .background(.lightbackgroundColor)
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(.lightbackgroundColor))
                                 
                                 
                    }
                        
                    }
                
                }
                .padding([.horizontal, .bottom])
            }.navigationTitle("Moonshot")
                .background(.darkbackgroundColor)
                .preferredColorScheme(.dark)
                
                
        }
        
    }
            
    }





    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}





