//
//  AlignmentIndicatorViews.swift
//  urban-arts-ios
//
//  Created by Gabriel Braga on 04/07/17.
//  Copyright © 2017 Tecvidya. All rights reserved.
//

import UIKit

public class AlignmentIndicatorViews {
    
    static let shared : AlignmentIndicatorViews = {
        let instance = AlignmentIndicatorViews()
        return instance
    }()
    
    private var lineColor = ColorsPallet.color_rosa
    
    private var layersLines: [CALayer]?
    
    private var otherViews: [UIView]!
    private var currentView: UIView!
    private var parentView: UIView!
    
    func identificaViews(currentView: UIView, parentView: UIView, otherViews: [UIView]){
        
        self.currentView = currentView
        self.parentView = parentView
        self.otherViews = otherViews
        
        self.clearLayersLines()
        
        //parent view center
        self.alignment_center_view()
        
        if self.otherViews.count > 1{
            
            //alignment horizontal
            self.alignment_top_top()
            self.alignment_top_bot()
            self.alignment_bot_bot()
            self.alignment_bot_top()
            
            //alignment vertical
            self.alignment_left_left()
            self.alignment_right_right()
            self.alignment_left_right()
            self.alignment_right_left()
            
            //alignment center subviews
            self.alignment_center_center_horizontal()
            self.alignment_top_center_horizontal()
            self.alignment_bot_center_horizontal()
            
            self.alignment_center_center_vertical()
            self.alignment_right_center_vertical()
            self.alignment_left_center_vertical()
            
        }
        
    }
    
    // CENTER
    private func alignment_center_center_vertical(){
        
        let viewOrigemFrame = currentView.frame
        
        var viewsAcima: [UIView] = []
        var viewsAbaixo: [UIView] = []
        
        let listOrderY = self.otherViews.sorted { $0.frame.origin.y == $1.frame.origin.y }
        
        for dragView in listOrderY{
            
            if currentView != dragView{
                
                let pointXOrigem: CGFloat = viewOrigemFrame.origin.x + (viewOrigemFrame.width / 2)
                
                let pointXDrag: CGFloat = dragView.frame.origin.x + (dragView.frame.width / 2)
                
                if pointXOrigem.distance(to: pointXDrag) <= 1 && pointXOrigem.distance(to: pointXDrag) >= -1{
                    
                    if dragView.frame.origin.y < viewOrigemFrame.origin.y{
                        
                        viewsAcima.append(dragView)
                        
                    }else if dragView.frame.origin.y > viewOrigemFrame.origin.y{
                        
                        viewsAbaixo.append(dragView)
                        
                    }
                    
                }
                
            }
            
        }//fim for
        
        var primeiraView = currentView! // temporario
        var ultimaView = currentView! // temporario
        
        if viewsAcima.count > 0{
            
            primeiraView = viewsAcima.first!
            ultimaView = currentView
            
            self.drawLine(color: lineColor, xInicio: primeiraView.frame.origin.x + (primeiraView.frame.width / 2), yInicio: primeiraView.frame.origin.y, xFim: ultimaView.frame.origin.x + (ultimaView.frame.width / 2), yFim: ultimaView.frame.origin.y + ultimaView.frame.height)
            
        }else if viewsAbaixo.count > 0{
            
            primeiraView = currentView
            ultimaView = viewsAbaixo.last!
            
            self.drawLine(color: lineColor, xInicio: primeiraView.frame.origin.x + (primeiraView.frame.width / 2), yInicio: primeiraView.frame.origin.y, xFim: ultimaView.frame.origin.x + (ultimaView.frame.width / 2), yFim: ultimaView.frame.origin.y + ultimaView.frame.height)
            
        }
        
    }
    
    private func alignment_right_center_vertical(){
        
        let viewOrigemFrame = currentView.frame
        
        var viewsAcima: [UIView] = []
        var viewsAbaixo: [UIView] = []
        
        let listOrderY = self.otherViews.sorted { $0.frame.origin.y == $1.frame.origin.y }
        
        for dragView in listOrderY{
            
            if currentView != dragView{
                
                let pointXOrigem: CGFloat = viewOrigemFrame.origin.x + viewOrigemFrame.width
                
                let pointXDrag: CGFloat = dragView.frame.origin.x + (dragView.frame.width / 2)
                
                if pointXOrigem.distance(to: pointXDrag) <= 1 && pointXOrigem.distance(to: pointXDrag) >= -1{
                    
                    if dragView.frame.origin.y < viewOrigemFrame.origin.y{
                        
                        viewsAcima.append(dragView)
                        
                    }else if dragView.frame.origin.y > viewOrigemFrame.origin.y{
                        
                        viewsAbaixo.append(dragView)
                        
                    }
                    
                }
                
            }
            
        }//fim for
        
        var primeiraView = currentView! // temporario
        var ultimaView = currentView! // temporario
        
        if viewsAcima.count > 0{
            
            primeiraView = viewsAcima.first!
            ultimaView = currentView
            
            self.drawLine(color: lineColor, xInicio: primeiraView.frame.origin.x + (primeiraView.frame.width / 2), yInicio: primeiraView.frame.origin.y, xFim: ultimaView.frame.origin.x + ultimaView.frame.width, yFim: ultimaView.frame.origin.y + ultimaView.frame.height)
            
        }else if viewsAbaixo.count > 0{
            
            primeiraView = currentView
            ultimaView = viewsAbaixo.last!
            
            self.drawLine(color: lineColor, xInicio: primeiraView.frame.origin.x + primeiraView.frame.width, yInicio: primeiraView.frame.origin.y, xFim: ultimaView.frame.origin.x + (ultimaView.frame.width / 2), yFim: ultimaView.frame.origin.y + ultimaView.frame.height)
            
        }
        
    }
    
    private func alignment_left_center_vertical(){
        
        let viewOrigemFrame = currentView.frame
        
        var viewsAcima: [UIView] = []
        var viewsAbaixo: [UIView] = []
        
        let listOrderY = self.otherViews.sorted { $0.frame.origin.y == $1.frame.origin.y }
        
        for dragView in listOrderY{
            
            if currentView != dragView{
                
                let pointXOrigem: CGFloat = viewOrigemFrame.origin.x
                
                let pointXDrag: CGFloat = dragView.frame.origin.x + (dragView.frame.width / 2)
                
                if pointXOrigem.distance(to: pointXDrag) <= 1 && pointXOrigem.distance(to: pointXDrag) >= -1{
                    
                    if dragView.frame.origin.y < viewOrigemFrame.origin.y{
                        
                        viewsAcima.append(dragView)
                        
                    }else if dragView.frame.origin.y > viewOrigemFrame.origin.y{
                        
                        viewsAbaixo.append(dragView)
                        
                    }
                    
                }
                
            }
            
        }//fim for
        
        var primeiraView = currentView! // temporario
        var ultimaView = currentView! // temporario
        
        if viewsAcima.count > 0{
            
            primeiraView = viewsAcima.first!
            ultimaView = currentView
            
            self.drawLine(color: lineColor, xInicio: primeiraView.frame.origin.x + (primeiraView.frame.width / 2), yInicio: primeiraView.frame.origin.y, xFim: ultimaView.frame.origin.x, yFim: ultimaView.frame.origin.y + ultimaView.frame.height)
            
        }else if viewsAbaixo.count > 0{
            
            primeiraView = currentView
            ultimaView = viewsAbaixo.last!
            
            self.drawLine(color: lineColor, xInicio: primeiraView.frame.origin.x, yInicio: primeiraView.frame.origin.y, xFim: ultimaView.frame.origin.x + (ultimaView.frame.width / 2), yFim: ultimaView.frame.origin.y + ultimaView.frame.height)
            
        }
        
    }
    
    private func alignment_center_center_horizontal(){
        
        let viewOrigemFrame = currentView.frame
        
        var viewsEsquerda: [UIView] = []
        var viewsDireita: [UIView] = []
        
        let listOrderX = self.otherViews.sorted { $0.frame.origin.x == $1.frame.origin.x }
        
        for dragView in listOrderX{
            
            if currentView != dragView{
                
                let pointYOrigem: CGFloat = viewOrigemFrame.origin.y + (viewOrigemFrame.height / 2)
                
                let pointYInferior: CGFloat = dragView.frame.origin.y + (dragView.frame.height / 2)
                
                if pointYOrigem.distance(to: pointYInferior) <= 1 && pointYOrigem.distance(to: pointYInferior) >= -1{
                    
                    if dragView.frame.origin.x < viewOrigemFrame.origin.x{
                        
                        viewsEsquerda.append(dragView)
                        
                    }else if dragView.frame.origin.x > viewOrigemFrame.origin.x{
                        
                        viewsDireita.append(dragView)
                        
                    }
                    
                }
                
            }
            
        }//fim for
        
        var primeiraView = currentView! // temporario
        var ultimaView = currentView! // temporario
        
        if viewsEsquerda.count > 0{
            
            primeiraView = viewsEsquerda.first!
            ultimaView = currentView
            
            self.drawLine(color: lineColor, xInicio: primeiraView.frame.origin.x, yInicio: primeiraView.frame.origin.y + (primeiraView.frame.height / 2), xFim: ultimaView.frame.origin.x + ultimaView.frame.width, yFim: ultimaView.frame.origin.y + (ultimaView.frame.height / 2))
            
        }else if viewsDireita.count > 0{
            
            primeiraView = currentView
            ultimaView = viewsDireita.last!
            
            self.drawLine(color: lineColor, xInicio: primeiraView.frame.origin.x, yInicio: primeiraView.frame.origin.y + (primeiraView.frame.height / 2), xFim: ultimaView.frame.origin.x + ultimaView.frame.width, yFim: ultimaView.frame.origin.y + (ultimaView.frame.height / 2))
            
        }
        
    }
    
    private func alignment_top_center_horizontal(){
        
        let viewOrigemFrame = currentView.frame
        
        var viewsEsquerda: [UIView] = []
        var viewsDireita: [UIView] = []
        
        let listOrderX = self.otherViews.sorted { $0.frame.origin.x == $1.frame.origin.x }
        
        for dragView in listOrderX{
            
            if currentView != dragView{
                
                let pointYOrigem: CGFloat = viewOrigemFrame.origin.y
                
                let pointYInferior: CGFloat = dragView.frame.origin.y + (dragView.frame.height / 2)
                
                if pointYOrigem.distance(to: pointYInferior) <= 1 && pointYOrigem.distance(to: pointYInferior) >= -1{
                    
                    if dragView.frame.origin.x < viewOrigemFrame.origin.x{
                        
                        viewsEsquerda.append(dragView)
                        
                    }else if dragView.frame.origin.x > viewOrigemFrame.origin.x{
                        
                        viewsDireita.append(dragView)
                        
                    }
                    
                }
                
            }
            
        }//fim for
        
        var primeiraView = currentView! // temporario
        var ultimaView = currentView! // temporario
        
        if viewsEsquerda.count > 0{
            
            primeiraView = viewsEsquerda.first!
            ultimaView = currentView
            
            self.drawLine(color: lineColor, xInicio: primeiraView.frame.origin.x, yInicio: primeiraView.frame.origin.y + (primeiraView.frame.height / 2), xFim: ultimaView.frame.origin.x + ultimaView.frame.width, yFim: ultimaView.frame.origin.y)
            
        }else if viewsDireita.count > 0{
            
            primeiraView = currentView
            ultimaView = viewsDireita.last!
            
            self.drawLine(color: lineColor, xInicio: primeiraView.frame.origin.x, yInicio: primeiraView.frame.origin.y, xFim: ultimaView.frame.origin.x + ultimaView.frame.width, yFim: ultimaView.frame.origin.y + (ultimaView.frame.height / 2))
            
        }
        
    }
    
    private func alignment_bot_center_horizontal(){
        
        let viewOrigemFrame = currentView.frame
        
        var viewsEsquerda: [UIView] = []
        var viewsDireita: [UIView] = []
        
        let listOrderX = self.otherViews.sorted { $0.frame.origin.x == $1.frame.origin.x }
        
        for dragView in listOrderX{
            
            if currentView != dragView{
                
                let pointYOrigem: CGFloat = viewOrigemFrame.origin.y + viewOrigemFrame.height
                
                let pointYInferior: CGFloat = dragView.frame.origin.y + (dragView.frame.height / 2)
                
                if pointYOrigem.distance(to: pointYInferior) <= 1 && pointYOrigem.distance(to: pointYInferior) >= -1{
                    
                    if dragView.frame.origin.x < viewOrigemFrame.origin.x{
                        
                        viewsEsquerda.append(dragView)
                        
                    }else if dragView.frame.origin.x > viewOrigemFrame.origin.x{
                        
                        viewsDireita.append(dragView)
                        
                    }
                    
                }
                
            }
            
        }//fim for
        
        var primeiraView = currentView! // temporario
        var ultimaView = currentView! // temporario
        
        if viewsEsquerda.count > 0{
            
            primeiraView = viewsEsquerda.first!
            ultimaView = currentView
            
            self.drawLine(color: lineColor, xInicio: primeiraView.frame.origin.x, yInicio: primeiraView.frame.origin.y + (primeiraView.frame.height / 2), xFim: ultimaView.frame.origin.x + ultimaView.frame.width, yFim: ultimaView.frame.origin.y + ultimaView.frame.height)
            
        }else if viewsDireita.count > 0{
            
            primeiraView = currentView
            ultimaView = viewsDireita.last!
            
            self.drawLine(color: lineColor, xInicio: primeiraView.frame.origin.x, yInicio: primeiraView.frame.origin.y + primeiraView.frame.height, xFim: ultimaView.frame.origin.x + ultimaView.frame.width, yFim: ultimaView.frame.origin.y + (ultimaView.frame.height / 2))
            
        }
        
    }
    
    // VERTICAIS
    private func alignment_left_left(){
        
        let viewOrigemFrame = currentView.frame
        
        var viewsAcima: [UIView] = []
        var viewsAbaixo: [UIView] = []
        
        let listOrderY = self.otherViews.sorted { $0.frame.origin.y == $1.frame.origin.y }
        
        for dragView in listOrderY{
            
            if currentView != dragView{
                
                if viewOrigemFrame.origin.x.distance(to: dragView.frame.origin.x) <= 1 && viewOrigemFrame.origin.x.distance(to: dragView.frame.origin.x) >= -1{
                    
                    if dragView.frame.origin.y < viewOrigemFrame.origin.y{
                        
                        viewsAcima.append(dragView)
                        
                    }else if dragView.frame.origin.y > viewOrigemFrame.origin.y{
                        
                        viewsAbaixo.append(dragView)
                        
                    }
                    
                }
                
            }
            
        }//fim for
        
        var primeiraView = currentView! // temporario
        var ultimaView = currentView! // temporario
        
        if viewsAcima.count > 0{
            
            primeiraView = viewsAcima.first!
            ultimaView = currentView
            
        }else if viewsAbaixo.count > 0{
            
            primeiraView = currentView
            ultimaView = viewsAbaixo.last!
            
        }
        
        if primeiraView == ultimaView{
            return
        }
        
        self.drawLine(color: lineColor, xInicio: primeiraView.frame.origin.x, yInicio: primeiraView.frame.origin.y, xFim: ultimaView.frame.origin.x, yFim: ultimaView.frame.origin.y + ultimaView.frame.height)
        
    }
    
    private func alignment_right_right(){
        
        let viewOrigemFrame = currentView.frame
        
        var viewsEsquerda: [UIView] = []
        var viewsDireita: [UIView] = []
        
        let listOrderY = self.otherViews.sorted { $0.frame.origin.y == $1.frame.origin.y }
        
        for dragView in listOrderY{
            
            if currentView != dragView{
                
                let pointXOrigem: CGFloat = viewOrigemFrame.origin.x + viewOrigemFrame.width
                
                let pointXDireita: CGFloat = dragView.frame.origin.x + dragView.frame.width
                
                if pointXOrigem.distance(to: pointXDireita) <= 1 && pointXOrigem.distance(to: pointXDireita) >= -1{
                    
                    if dragView.frame.origin.y < viewOrigemFrame.origin.y{
                        
                        viewsEsquerda.append(dragView)
                        
                    }else if dragView.frame.origin.y > viewOrigemFrame.origin.y{
                        
                        viewsDireita.append(dragView)
                        
                    }
                    
                }
                
            }
            
        }//fim for
        
        var primeiraView = currentView! // temporario
        var ultimaView = currentView! // temporario
        
        if viewsEsquerda.count > 0{
            
            primeiraView = viewsEsquerda.first!
            ultimaView = currentView
            
        }else if viewsDireita.count > 0{
            
            primeiraView = currentView
            ultimaView = viewsDireita.last!
            
        }
        
        if primeiraView == ultimaView{
            return
        }
        
        self.drawLine(color: lineColor, xInicio: primeiraView.frame.origin.x + primeiraView.frame.width, yInicio: primeiraView.frame.origin.y, xFim: ultimaView.frame.origin.x + ultimaView.frame.width, yFim: ultimaView.frame.origin.y + ultimaView.frame.height)
        
    }
    
    private func alignment_left_right(){
        
        let viewOrigemFrame = currentView.frame
        
        var viewsAcima: [UIView] = []
        var viewsAbaixo: [UIView] = []
        
        let listOrderY = self.otherViews.sorted { $0.frame.origin.y == $1.frame.origin.y }
        
        for dragView in listOrderY{
            
            if currentView != dragView{
                
                let pointXOrigem: CGFloat = viewOrigemFrame.origin.x
                
                let pointXDrag: CGFloat = dragView.frame.origin.x + dragView.frame.width
                
                if pointXOrigem.distance(to: pointXDrag) <= 1 && pointXOrigem.distance(to: pointXDrag) >= -1{
                    
                    if dragView.frame.origin.y < viewOrigemFrame.origin.y{
                        
                        viewsAcima.append(dragView)
                        
                    }else if dragView.frame.origin.y > viewOrigemFrame.origin.y{
                        
                        viewsAbaixo.append(dragView)
                        
                    }
                    
                }
                
            }
            
        }//fim for
        
        var primeiraView = currentView! // temporario
        var ultimaView = currentView! // temporario
        
        if viewsAcima.count > 0{
            
            primeiraView = viewsAcima.first!
            ultimaView = currentView
            
            self.drawLine(color: lineColor, xInicio: primeiraView.frame.origin.x + primeiraView.frame.width, yInicio: primeiraView.frame.origin.y, xFim: ultimaView.frame.origin.x, yFim: ultimaView.frame.origin.y + ultimaView.frame.height)
            
        }else if viewsAbaixo.count > 0{
            
            primeiraView = currentView
            ultimaView = viewsAbaixo.last!
            
            self.drawLine(color: lineColor, xInicio: primeiraView.frame.origin.x, yInicio: primeiraView.frame.origin.y, xFim: ultimaView.frame.origin.x + ultimaView.frame.width, yFim: ultimaView.frame.origin.y + ultimaView.frame.height)
            
        }
        
    }
    
    private func alignment_right_left(){
        
        let viewOrigemFrame = currentView.frame
        
        var viewsAcima: [UIView] = []
        var viewsAbaixo: [UIView] = []
        
        let listOrderY = self.otherViews.sorted { $0.frame.origin.y == $1.frame.origin.y }
        
        for dragView in listOrderY{
            
            if currentView != dragView{
                
                let pointXOrigem: CGFloat = viewOrigemFrame.origin.x + viewOrigemFrame.width
                
                let pointXDrag: CGFloat = dragView.frame.origin.x
                
                if pointXOrigem.distance(to: pointXDrag) <= 1 && pointXOrigem.distance(to: pointXDrag) >= -1{
                    
                    if dragView.frame.origin.y < viewOrigemFrame.origin.y{
                        
                        viewsAcima.append(dragView)
                        
                    }else if dragView.frame.origin.y > viewOrigemFrame.origin.y{
                        
                        viewsAbaixo.append(dragView)
                        
                    }
                    
                }
                
            }
            
        }//fim for
        
        var primeiraView = currentView! // temporario
        var ultimaView = currentView! // temporario
        
        if viewsAcima.count > 0{
            
            primeiraView = viewsAcima.first!
            ultimaView = currentView
            
            self.drawLine(color: lineColor, xInicio: primeiraView.frame.origin.x, yInicio: primeiraView.frame.origin.y, xFim: ultimaView.frame.origin.x + ultimaView.frame.width, yFim: ultimaView.frame.origin.y + ultimaView.frame.height)
            
        }else if viewsAbaixo.count > 0{
            
            primeiraView = currentView
            ultimaView = viewsAbaixo.last!
            
            self.drawLine(color: lineColor, xInicio: primeiraView.frame.origin.x + primeiraView.frame.width, yInicio: primeiraView.frame.origin.y, xFim: ultimaView.frame.origin.x, yFim: ultimaView.frame.origin.y + ultimaView.frame.height)
            
        }
        
    }
    
    // HORIZONTAIS
    
    private func alignment_top_top(){
        
        let viewOrigemFrame = currentView.frame
        
        var viewsEsquerda: [UIView] = []
        var viewsDireita: [UIView] = []
        
        let listOrderX = self.otherViews.sorted { $0.frame.origin.x == $1.frame.origin.x }
        
        for dragView in listOrderX{
            
            if currentView != dragView{
                
                if viewOrigemFrame.origin.y.distance(to: dragView.frame.origin.y) <= 1 && viewOrigemFrame.origin.y.distance(to: dragView.frame.origin.y) >= -1{
                    
                    if dragView.frame.origin.x < viewOrigemFrame.origin.x{
                        
                        viewsEsquerda.append(dragView)
                        
                    }else if dragView.frame.origin.x > viewOrigemFrame.origin.x{
                        
                        viewsDireita.append(dragView)
                        
                    }
                    
                }
                
            }
            
        }//fim for
        
        var primeiraView = currentView! // temporario
        var ultimaView = currentView! // temporario
        
        if viewsEsquerda.count > 0{
            
            primeiraView = viewsEsquerda.first!
            ultimaView = currentView
            
        }else if viewsDireita.count > 0{
            
            primeiraView = currentView
            ultimaView = viewsDireita.last!
            
        }
        
        if primeiraView == ultimaView{
            return
        }
        
        self.drawLine(color: lineColor, xInicio: primeiraView.frame.origin.x, yInicio: primeiraView.frame.origin.y, xFim: ultimaView.frame.origin.x + ultimaView.frame.width, yFim: ultimaView.frame.origin.y)
        
    }
    
    private func alignment_top_bot(){
        
        let viewOrigemFrame = currentView.frame
        
        var viewsEsquerda: [UIView] = []
        var viewsDireita: [UIView] = []
        
        let listOrderX = self.otherViews.sorted { $0.frame.origin.x == $1.frame.origin.x }
        
        for dragView in listOrderX{
            
            if currentView != dragView{
                
                let pointYOrigem: CGFloat = viewOrigemFrame.origin.y
                
                let pointYInferior: CGFloat = dragView.frame.origin.y + dragView.frame.height
                
                if pointYOrigem.distance(to: pointYInferior) <= 1 && pointYOrigem.distance(to: pointYInferior) >= -1{
                    
                    if dragView.frame.origin.x < viewOrigemFrame.origin.x{
                        
                        viewsEsquerda.append(dragView)
                        
                    }else if dragView.frame.origin.x > viewOrigemFrame.origin.x{
                        
                        viewsDireita.append(dragView)
                        
                    }
                    
                }
                
            }
            
        }//fim for
        
        var primeiraView = currentView! // temporario
        var ultimaView = currentView! // temporario
        
        if viewsEsquerda.count > 0{
            
            primeiraView = viewsEsquerda.first!
            ultimaView = currentView
            
            self.drawLine(color: lineColor, xInicio: primeiraView.frame.origin.x, yInicio: primeiraView.frame.origin.y + primeiraView.frame.height, xFim: ultimaView.frame.origin.x + ultimaView.frame.width, yFim: ultimaView.frame.origin.y)
            
        }else if viewsDireita.count > 0{
            
            primeiraView = currentView
            ultimaView = viewsDireita.last!
            
            self.drawLine(color: lineColor, xInicio: primeiraView.frame.origin.x, yInicio: primeiraView.frame.origin.y, xFim: ultimaView.frame.origin.x + ultimaView.frame.width, yFim: ultimaView.frame.origin.y + ultimaView.frame.height)
            
        }
        
    }
    
    private func alignment_bot_bot(){
        
        let viewOrigemFrame = currentView.frame
        
        var viewsEsquerda: [UIView] = []
        var viewsDireita: [UIView] = []
        
        let listOrderX = self.otherViews.sorted { $0.frame.origin.x == $1.frame.origin.x }
        
        for dragView in listOrderX{
            
            if currentView != dragView{
                
                let pointYOrigem: CGFloat = viewOrigemFrame.origin.y + viewOrigemFrame.height
                
                let pointYInferior: CGFloat = dragView.frame.origin.y + dragView.frame.height
                
                if pointYOrigem.distance(to: pointYInferior) <= 1 && pointYOrigem.distance(to: pointYInferior) >= -1{
                    
                    if dragView.frame.origin.x < viewOrigemFrame.origin.x{
                        
                        viewsEsquerda.append(dragView)
                        
                    }else if dragView.frame.origin.x > viewOrigemFrame.origin.x{
                        
                        viewsDireita.append(dragView)
                        
                    }
                    
                }
                
            }
            
        }//fim for
        
        var primeiraView = currentView! // temporario
        var ultimaView = currentView! // temporario
        
        if viewsEsquerda.count > 0{
            
            primeiraView = viewsEsquerda.first!
            ultimaView = currentView
            
            self.drawLine(color: lineColor, xInicio: primeiraView.frame.origin.x, yInicio: primeiraView.frame.origin.y + primeiraView.frame.height, xFim: ultimaView.frame.origin.x + ultimaView.frame.width, yFim: ultimaView.frame.origin.y + ultimaView.frame.height)
            
        }else if viewsDireita.count > 0{
            
            primeiraView = currentView
            ultimaView = viewsDireita.last!
            
            self.drawLine(color: lineColor, xInicio: primeiraView.frame.origin.x, yInicio: primeiraView.frame.origin.y + primeiraView.frame.height, xFim: ultimaView.frame.origin.x + ultimaView.frame.width, yFim: ultimaView.frame.origin.y + ultimaView.frame.height)
            
        }
        
    }
    
    private func alignment_bot_top(){
        
        let viewOrigemFrame = currentView.frame
        
        var viewsEsquerda: [UIView] = []
        var viewsDireita: [UIView] = []
        
        let listOrderX = self.otherViews.sorted { $0.frame.origin.x == $1.frame.origin.x }
        
        for dragView in listOrderX{
            
            if currentView != dragView{
                
                let pointYOrigem: CGFloat = viewOrigemFrame.origin.y + viewOrigemFrame.height
                
                let pointYInferior: CGFloat = dragView.frame.origin.y
                
                if pointYOrigem.distance(to: pointYInferior) <= 1 && pointYOrigem.distance(to: pointYInferior) >= -1{
                    
                    if dragView.frame.origin.x < viewOrigemFrame.origin.x{
                        
                        viewsEsquerda.append(dragView)
                        
                    }else if dragView.frame.origin.x > viewOrigemFrame.origin.x{
                        
                        viewsDireita.append(dragView)
                        
                    }
                    
                }
                
            }
            
        }//fim for
        
        var primeiraView = currentView! // temporario
        var ultimaView = currentView! // temporario
        
        if viewsEsquerda.count > 0{
            
            primeiraView = viewsEsquerda.first!
            ultimaView = currentView
            
            self.drawLine(color: lineColor, xInicio: primeiraView.frame.origin.x, yInicio: primeiraView.frame.origin.y, xFim: ultimaView.frame.origin.x + ultimaView.frame.width, yFim: ultimaView.frame.origin.y + ultimaView.frame.height)
            
        }else if viewsDireita.count > 0{
            
            primeiraView = currentView
            ultimaView = viewsDireita.last!
            
            self.drawLine(color: lineColor, xInicio: primeiraView.frame.origin.x, yInicio: primeiraView.frame.origin.y + primeiraView.frame.height, xFim: ultimaView.frame.origin.x + ultimaView.frame.width, yFim: ultimaView.frame.origin.y)
            
        }
        
    }
    
    // VIEW_PAI
    
    private func alignment_center_view(){
        
        let pointX: CGFloat = currentView.frame.origin.x + (currentView.frame.width / 2)
        
        let pointY: CGFloat = currentView.frame.origin.y + (currentView.frame.height / 2)
        
        if pointX.distance(to: parentView.center.x) <= 1 && pointX.distance(to: parentView.center.x) >= -1{
            
            self.drawLine(color: lineColor, xInicio: parentView.center.x, yInicio: 0, xFim: parentView.center.x, yFim: parentView.frame.height)
            
        }
        
        if pointY.distance(to: parentView.center.y) <= 1 && pointY.distance(to: parentView.center.y) >= -1{
            
            self.drawLine(color: lineColor, xInicio: 0, yInicio: parentView.center.y, xFim: parentView.frame.width, yFim: parentView.center.y)
            
        }
        
    }
    
    //OUTROS
    
    private func drawLine(color: UIColor, xInicio: CGFloat, yInicio: CGFloat, xFim: CGFloat, yFim: CGFloat){
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: xInicio, y: yInicio))
        path.addLine(to: CGPoint(x: xFim, y: yFim))
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = color.cgColor
        shapeLayer.lineWidth = 0.6
        shapeLayer.fillColor = UIColor.clear.cgColor
        
        layersLines?.append(shapeLayer)
        
        self.parentView.layer.addSublayer(shapeLayer)
        
    }
    
    func clearLayersLines(){
        
        if layersLines != nil && layersLines!.count > 0{
            for layer in layersLines!{
                layer.removeFromSuperlayer()
            }
        }
        
        self.layersLines = []
        
    }
    
}
