//
//  MissionView.swift
//  MoonShot
//
//  Created by Joseph Norris on 05/09/2023.
//

import SwiftUI

struct MissionView: View {
    
    struct CrewMember  {
        let role : String
        let astronaut: Astronaut
        
        
    }
    let crew : [CrewMember]
    let mission : Mission
    var body: some View {
        GeometryReader{
            geo  in
            ScrollView{
                VStack{
                    Image (mission.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geo.size.width * 0.6)
                    
                    VStack(alignment: .leading){
                        Text("Mission highlights")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        
                        
                        Text(mission.description)
                        
                    }
                    .padding(.horizontal)
                }
                    
//indicator is the scroll line
                    
                    
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            ForEach(crew, id:\.role) {crewmember in
                                NavigationLink {
                                    Text("astonaut details")
                                    
                                } label: {
                                    
                                    HStack{
                                        Image(crewmember.astronaut.id)
                                            .resizable()
                                            .frame(width: 104, height: 72)
                                            .clipShape(Capsule())
                                            .overlay(
                                        Capsule()
                                            .strokeBorder(.white, lineWidth: 1))
                                        
                                        
                                        VStack(alignment: .leading){
                                            Text(crewmember.astronaut.name)
                                                .foregroundColor(.white)
                                                .font(.headline)
                                            
                                            Text(crewmember.role)
                                                .foregroundColor(.secondary)
                                                
                                            
                                        }
                                    }
                                    .padding(.horizontal)
                                    
                                    
                                    
                                }
                            }
                        }
                        
                    }
                }
            
                
            }
            
            .padding(.bottom)
            
            
            .navigationTitle(mission.displayName)
            .navigationBarTitleDisplayMode(.inline)
            .background(.darkbackgroundColor)
            
        
    }
        
        init(mission: Mission, astronauts: [String : Astronaut]){
            
            self.mission = mission
            
            self.crew = mission.crew.map {member in
                if let astronaut = astronauts[member.name] {
                    return CrewMember(role: member.role, astronaut: astronaut)
                }
                else {
                    fatalError("missing \(member.name)")
                }
            }
            
            
        }
        
        
    }
    
    struct Mission_VIew_Previews: PreviewProvider {
        static let missions: [Mission] = Bundle.main.decode("missions.json")
        
        static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
        static var previews: some View {
            MissionView(mission: missions[0], astronauts: astronauts)
                .preferredColorScheme(.dark)
        }
    }

