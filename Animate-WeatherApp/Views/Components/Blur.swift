//
//  Blur.swift
//  Animate-WeatherApp
//
//  Created by A'zamjon Abdumuxtorov on 27/08/24.
//

import SwiftUI

class UIBackdropView:UIView{
    override class var layerClass: AnyClass{
        NSClassFromString("CABackdropLayer") ?? CALayer.self
    }
}

struct Backdrop:UIViewRepresentable{
    
    func makeUIView(context: Context) -> some UIView {
        UIBackdropView()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {}
    
}

struct Blur: View {
    var radius:CGFloat = 3
    var opaque:Bool = false
    var body: some View {
       Backdrop()
            .blur(radius: radius,opaque: opaque)
    }
}

#Preview {
    Blur()
}
