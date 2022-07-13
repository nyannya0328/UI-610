//
//  Home.swift
//  UI-610
//
//  Created by nyannyan0328 on 2022/07/13.
//

import SwiftUI

struct Home: View {
    @StateObject var model : CoreMotion = .init()
    var body: some View {
        VStack{
            
            HStack{
                
                
                Button {
                    
                } label: {
                    
                    Image(systemName: "line.3.horizontal")
                        .font(.title2)
                }
                
                Spacer()
                
                
                Button {
                    
                } label: {
                    
                    Image(systemName: "person")
                        .font(.title2)
                }
                
                
                

            }
            .foregroundColor(.white)
            .padding(.vertical,10)
            
            Text("Exculusive tips just for you")
                .font(.custom("GabrielaStencilW00-Lightit", size: 30))
                .foregroundColor(.white)
            
            PallaxCards()
            
            
            TabBar()
            
            
        }
        .padding(15)
        .frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .top)
        .background{
         
            Color("BG")
                .ignoresSafeArea()
        }
    }
    
    @ViewBuilder
    func PallaxCards()->some View{
        
        TabView(selection:$model.currentSlider){
            
            ForEach(sample_places){place in
                
                GeometryReader{proxy in
                    
                     let size = proxy.size
                    
                    ZStack{
                        
                        Image(place.bgName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .offset(x:model.currentSlider.id == place.id ? -model.xValue * 75 : 0)
                            .frame(width:size.width ,height:size.height)
                        
                        Image(place.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .offset(x:model.currentSlider.id == place.id ? overlayOffset() : 0)
                            .frame(width:size.width ,height:size.height)
                            .scaleEffect(1.05,anchor: .bottom)
                        
                        
                        VStack(spacing:20){
                            
                            
                            Text("FEATURES")
                                .font(.caption)
                                .foregroundColor(.white)
                            
                            Text(place.placeName)
                                .font(.custom("Gabriela Stencil", size: 30))
                                .foregroundColor(.white)
                                .shadow(color : .black.opacity(0.1), radius: 20,x: 5,y: -5)
                                .shadow(color : .red.opacity(0.5), radius: 20,x: 5,y: -5)
                                
                            
                            Button {
                                
                            } label: {
                                
                                Text("EXPLORE")
                                    .font(.custom("Gabriela Stencil", size: 30))
                                    .foregroundColor(.white)
                                    .padding(.vertical,8)
                                    .padding(.horizontal,60)
                                    .background{
                                     
                                        Rectangle()
                                            .fill(.white.opacity(0.3))
                                        
                                        Rectangle()
                                            .fill(.red.opacity(0.03))
                                    }
                                
                            }

                            
                            
                        }
                        .frame( maxHeight: .infinity,alignment: .top)
                        .padding(.top,60)
                        
                        
                    
                        
                        
                    }
                    .frame(width:size.width ,height:size.height )
                    .clipShape(RoundedRectangle(cornerRadius: 10,style: .continuous))
                }
                .padding(.vertical,30)
                .padding(.horizontal,35)
                .tag(place)
              
            }
            
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .onAppear{model.detectMotion()}
        .onDisappear{model.stopMotionManager()}
        
        
    }
    
    func overlayOffset()->CGFloat{
        
        let offset = model.xValue * 7
        
        if offset > 0{
            
            return offset > 8 ? 8 : offset
            
        }
        
        return -offset > 8 ? -8 : offset
        
    }
    @ViewBuilder
    func TabBar()->some View{
        
        HStack(spacing:0){
            
            ForEach(["house","suit.heart","magnifyingglass"],id:\.self){image in
                
                Image(systemName: image)
                    .font(.title)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity,alignment: .center)
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
