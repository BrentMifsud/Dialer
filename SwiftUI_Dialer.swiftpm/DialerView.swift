//
//  DialerView.swift
//  SwiftUI_Dialer
//
//  Created by Brent Mifsud on 2022-04-08.
//

import SwiftUI

enum DialerButtons: String, Identifiable, CaseIterable {
    var id: String { rawValue }
    
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case pound = "#"
    case zero = "0"
    case asterisk = "*"

    static var allCases: [DialerButtons] = [
        .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .pound, .zero, .asterisk
    ]
}


struct DialerView: View {
    @Binding var dialedNumbers: String
    private let data = DialerButtons.allCases
    private let columns = [
        GridItem(.flexible(minimum: 60, maximum: .infinity)),
        GridItem(.flexible(minimum: 60, maximum: .infinity)),
        GridItem(.flexible(minimum: 60, maximum: .infinity))
    ]
    
    var body: some View {
        VStack {
            LazyVGrid(columns: columns, alignment: .center, spacing: 40) {
                ForEach(data) { dialerButton in
                    Button {
                        dialedNumbers.append(dialerButton.rawValue)
                    } label: {
                        Circle()
                            .fill(Color.white)
                            .frame(width: 60, height: 60)
                            .overlay(
                                Text(dialerButton.rawValue)
                                    .font(.largeTitle)
                                    .foregroundColor(.black),
                                alignment: .center
                            )
                    }
                }
            }
            
            HStack(spacing: 32) {
                Button {
                    dialedNumbers = ""
                } label: {
                    Text("Clear")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                }
                
                Button {
                    let newNumber = String(dialedNumbers.dropLast())
                    dialedNumbers = newNumber
                } label: {
                    Image(systemName: "delete.left")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                }
            }
        }
    }
}

struct DialerView_Previews: PreviewProvider {
    static var previews: some View {
        DialerView(dialedNumbers: .constant(""))
            .padding(16)
            .background(Color.black)
            .previewLayout(.sizeThatFits)
    }
}
