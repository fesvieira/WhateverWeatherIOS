//
//  FormsTextField.swift
//  WhateverWeatherIOS
//
//  Created by Felipe Vieira on 27/09/23.
//

import SwiftUI

struct FormsTextField: View {
    @Binding private var text: String
    private var placeholder: String
    @Binding private var error: String
    @Binding private var isSecure: Bool
    private let leftView: AnyView?
    private let rightView: AnyView?
    private let horizontalViewsSpacing: CGFloat
    
    init(
        text: Binding<String> = .constant(""),
        placeholder: String = "",
        error: Binding<String> = .constant(""),
        isSecure: Binding<Bool> = .constant(false),
        horizontalViewsSpacing: CGFloat = 4,
        leftView: AnyView? = nil,
        rightView: AnyView? = nil
    ) {
        self._text = text
        self.placeholder = placeholder
        self._isSecure = isSecure
        self._error = error
        self.leftView = leftView
        self.rightView = rightView
        self.horizontalViewsSpacing = horizontalViewsSpacing
    }
    
    var body: some View {
        VStack(spacing: 4) {
            HStack(spacing: horizontalViewsSpacing) {
                if let leftView { leftView }
                
                ZStack {
                    if text.isEmpty {
                        Text(placeholder)
                            .font(.headline)
                            .foregroundColor(.white.opacity(0.6))
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    if (isSecure) {
                        SecureField(text: $text){}
                            .font(.headline)
                            .foregroundColor(.white)
                    } else {
                        TextField(text: $text){}
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                }
                
                if let rightView { rightView }
            }
            .padding(16)
            .background(.AppDarkBlue)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .frame(maxWidth: .infinity)
            
            if !error.isEmpty {
                Text(error)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.red)
                    .frame(maxWidth: .infinity, maxHeight: 16, alignment: .leading)
                    .padding(.leading, 16)
            } else {
                Spacer().frame(height: 20)
            }
        }
        
    }
}

struct FormsTextField_Previews: PreviewProvider {
    private struct Preview: View {
        @State var textt: String = "test"
        var leftView: some View {
            Text("test")
        }
        
        var rightView: some View {
            Text("test")
        }
        var body: some View {
            VStack{
                FormsTextField(text: $textt, placeholder: "Placeholder", leftView: AnyView(leftView), rightView: AnyView(rightView))
                FormsTextField(placeholder: "Placeholder")
                FormsTextField(error: .constant("Error"))
            }
            .padding(.horizontal, 16)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
    static var previews: some View {
        Preview()
    }
}
