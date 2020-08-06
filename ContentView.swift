//
//  ContentView.swift
//  Concentration1
//
//  Created by mamotlatsi makhate  on 2020/07/21.
//  Copyright © 2020 mamotlatsi makhate . All rights reserved.
//

import SwiftUI

struct ContentView: View {
  @ObservedObject  var viewmodel:EmojiMemoryGame
    
    var body: some View {
         HStack
            {
                ForEach(viewmodel.cards){ card in
                    CardView(card:card).onTapGesture{ self.viewmodel.choose(card:card)}
                        
                    
         
        
            }
            }
            .padding()
            .foregroundColor(Color.orange)
           
}
    }

struct CardView: View {
    var card:MemoryGame<String>.Card
    
var body: some View {
    GeometryReader{ geometry in
        self.body(for:geometry.size)
    }
    }
    func body (for size : CGSize)-> some View{
    ZStack{
        if  card.isFaceUp {
            RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
            RoundedRectangle(cornerRadius:cornerRadius).stroke(lineWidth: edgeLinewidth)
            Text(card.content)
        }else{
            RoundedRectangle(cornerRadius:cornerRadius).fill()
    }
    
    }
    .font(Font.system(size: min(geometry.size.width,geometry.size.height) * self.fontScaleFactor))
}
}

//control pannel

let cornerRadius:CGFloat = 10.0
let edgeLinewidth:CGFloat = 3
let fontScaleFactor:CGFloat=0.75




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewmodel: EmojiMemoryGame())
    }
}


