//
//  ContentView.swift
//  Calculator
//
//  Created by Bora ÖZKOÇ on 4.08.2024.
//

import SwiftUI

enum Operation {
    case add, subtract, divide, multiply, equal, none
}

struct ContentView: View {
    @State var firstValue = "0"
    @State var secondValue = "0"
    @State var shownValue = "0"
    @State var currentOperation: Operation = .none
    
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea(.all)
            
            VStack{
                Spacer()
                VStack{
                    Text(shownValue)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.horizontal)
                        .foregroundStyle(.white)
                        .font(.system(size: 50))
                }
                VStack{
                    HStack{
                        OperationButton(firstValue: $firstValue, secondValue: $secondValue, shownValue: $shownValue, currentOperation: $currentOperation,buttonType: .clear,backgroundColor: .gray)
                        OperationButton(firstValue: $firstValue,secondValue: $secondValue, shownValue: $shownValue, currentOperation: $currentOperation, buttonType: .negative,backgroundColor: .gray)
                        OperationButton(firstValue: $firstValue,secondValue: $secondValue, shownValue: $shownValue, currentOperation: $currentOperation, buttonType: .percent,backgroundColor: .gray)
                        OperationButton(firstValue: $firstValue,secondValue: $secondValue, shownValue: $shownValue, currentOperation: $currentOperation, buttonType: .divide)
                    }
                    HStack{
                        OperationButton(firstValue: $firstValue,secondValue: $secondValue, shownValue: $shownValue, currentOperation: $currentOperation, buttonType: .seven,backgroundColor: Color(.darkGray))
                        OperationButton(firstValue: $firstValue,secondValue: $secondValue, shownValue: $shownValue, currentOperation: $currentOperation, buttonType: .eight,backgroundColor: Color(.darkGray))
                        OperationButton(firstValue: $firstValue,secondValue: $secondValue, shownValue: $shownValue, currentOperation: $currentOperation, buttonType: .nine,backgroundColor: Color(.darkGray))
                        OperationButton(firstValue: $firstValue,secondValue: $secondValue, shownValue: $shownValue, currentOperation: $currentOperation, buttonType: .multiply)
                    }
                    HStack{
                        OperationButton(firstValue: $firstValue,secondValue: $secondValue, shownValue: $shownValue, currentOperation: $currentOperation, buttonType: .four,backgroundColor: Color(.darkGray))
                        OperationButton(firstValue: $firstValue,secondValue: $secondValue, shownValue: $shownValue, currentOperation: $currentOperation, buttonType: .five,backgroundColor: Color(.darkGray))
                        OperationButton(firstValue: $firstValue,secondValue: $secondValue, shownValue: $shownValue, currentOperation: $currentOperation, buttonType: .six,backgroundColor: Color(.darkGray))
                        OperationButton(firstValue: $firstValue,secondValue: $secondValue, shownValue: $shownValue, currentOperation: $currentOperation, buttonType: .subtract)
                    }
                    HStack{
                        OperationButton(firstValue: $firstValue,secondValue: $secondValue, shownValue: $shownValue, currentOperation: $currentOperation, buttonType: .one,backgroundColor: Color(.darkGray))
                        OperationButton(firstValue: $firstValue,secondValue: $secondValue, shownValue: $shownValue, currentOperation: $currentOperation, buttonType: .two,backgroundColor: Color(.darkGray))
                        OperationButton(firstValue: $firstValue,secondValue: $secondValue, shownValue: $shownValue, currentOperation: $currentOperation, buttonType: .three,backgroundColor: Color(.darkGray))
                        OperationButton(firstValue: $firstValue,secondValue: $secondValue, shownValue: $shownValue, currentOperation: $currentOperation, buttonType: .add)
                    }
                    HStack{
                        OperationButton(firstValue: $firstValue,secondValue: $secondValue, shownValue: $shownValue, currentOperation: $currentOperation, buttonType: .zero,backgroundColor: Color(.darkGray), buttonWidth: 170)
                        OperationButton(firstValue: $firstValue,secondValue: $secondValue, shownValue: $shownValue, currentOperation: $currentOperation, buttonType: .decimal,backgroundColor: Color(.darkGray))
                        OperationButton(firstValue: $firstValue,secondValue: $secondValue, shownValue: $shownValue, currentOperation: $currentOperation, buttonType: .equal)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
