//
//  DrawingView.swift
//  Blip
//
//  Created by Natasha Radika on 03/04/24.
//

import SwiftUI

struct DrawingView: View {
    @Binding var isShowDrawView: Bool
    
    @State private var lines = [Line]()
    
    public init(isShowDrawView: Binding<Bool>) {
        _isShowDrawView = isShowDrawView
    }
    
    private var selectedColor: Color = .black
    private var selectedLineWidth: CGFloat = 10
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                Spacer()
                
                Button("Delete", role: .destructive) {
                    lines = [Line]()
                }
                
            }.padding()
            
            
            ZStack {
                Color.white
                
                ForEach(lines){ line in
                    DrawingShape(points: line.points)
                        .stroke(line.color, style: StrokeStyle(lineWidth: line.lineWidth, lineCap: .round, lineJoin: .round))
                }
            }
            .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local).onChanged({ value in
                let newPoint = value.location
                if value.translation.width + value.translation.height == 0 {
                    //TODO: use selected color and linewidth
                    lines.append(Line(points: [newPoint], color: selectedColor, lineWidth: selectedLineWidth))
                } else {
                    let index = lines.count - 1
                    lines[index].points.append(newPoint)
                }
                
            }).onEnded({ value in
                if let last = lines.last?.points, last.isEmpty {
                    lines.removeLast()
                }
            })
            
            )
            
            
            Button(action: {
                isShowDrawView = false
            }) {
                Text("Done").frame(width: 315)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(12)
            }
        }
    }
}

struct DrawingView_Previews: PreviewProvider {
    static var previews: some View {
        DrawingView(isShowDrawView: .constant(false))
    }
}

