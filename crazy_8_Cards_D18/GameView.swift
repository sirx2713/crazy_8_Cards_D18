//
//  ContentView.swift
//  crazy_8_Cards_D18
//
//  Created by Tafadzwa Alexander Razaro on 2024/03/23.
//

import SwiftUI

struct GameView: View {
    
    @State var playerCard = "back"
    @State var cpuCard = "back"
    @State var backGround = "background2"
    @State var playerScore = 0
    @State var cpuScore = 0
    
    
    var body: some View {
        NavigationStack{
            ZStack{
                Image(backGround)
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .ignoresSafeArea()
                VStack{
                    Spacer()
                    Image("logo")
                    Spacer()
                    HStack{
                        Spacer()
                        Image(playerCard)
                        Spacer()
                        Image(cpuCard)
                        Spacer()
                    }
                    Spacer()
                    Button(action: {
                        deal()
                    }, label: {
                        Image("button")
                    })
                    Spacer()
                    HStack{
                        Spacer()
                        VStack{
                            Text("Player")
                                .font(.headline)
                                .foregroundColor(Color.white)
                                .padding(.bottom)
                            Text(String(playerScore))
                                .scaleEffect(2)
                                .font(.largeTitle)
                                .bold()
                                .foregroundColor(Color.white)
                        }
                        Spacer()
                        VStack{
                            Text("CPU")
                                .font(.headline)
                                .foregroundColor(Color.white)
                                .padding(.bottom)
                            Text(String(cpuScore))
                                .scaleEffect(2)
                                .font(.largeTitle)
                                .bold()
                                .foregroundColor(Color.white)
                        }
                        Spacer()
                    }
                    Spacer()
                    HStack{
                        Spacer()
                        NavigationLink {
                            HomeView()
                                .navigationBarBackButtonHidden()
                        } label: {
                            Text("Home")
                                .bold()
                                .foregroundColor(.white)
                                .frame(width: 80)
                                .background(Color(.orange))
                                .cornerRadius(10)

                        }
                        Spacer()
                        Button(action: {
                            back()
                        }, label: {
                            Text("BG")
                                .bold()
                                .foregroundColor(.white)
                                .frame(width: 80)
                                .background(Color(.orange))
                                .cornerRadius(10)
                        })
                        Spacer()
                        Button(action: {
                            reset()
                        }, label: {
                            Text("Restart")
                                .bold()
                                .foregroundColor(.white)
                                .frame(width: 80)
                                .background(Color(.orange))
                                .cornerRadius(10)
                        })
                        Spacer()
                    }
                    Spacer()
                }
            }
        }
       
    }
    
    func deal(){
        
        //Randomise the player cards
        let playCardValue = Int.random(in: 2...14)
        playerCard = "card" + String(playCardValue)
        
        //Randomise the cpu cards
        let cpuCardValue = Int.random(in: 2...14)
        cpuCard = "card" + String(cpuCardValue)
        
        //Add 4 to player score
        if playerCard > cpuCard {
            playerScore += 4
        }
        
        //Add 4 to cpu score
        if cpuCard > playerCard {
            cpuScore += 4
        }
        
        //Add 1 to both scores if it's a tie
        else if playerCard == cpuCard {
            playerScore += 1
            cpuScore += 1
        }
    }
    
    func back(){
        //Randomise the background
        let backGroundValue = Int.random(in: 1...4)
        backGround = "background" + String(backGroundValue)
    }
    
    func reset(){
        //Resets everything to default
        playerCard = "back"
        cpuCard = "back"
        playerScore = 0
        cpuScore = 0
        backGround = "background2"
    }
}

#Preview {
    GameView()
}
