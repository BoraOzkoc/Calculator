import SwiftUI

enum ButtonType: String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case add = "+"
    case subtract = "-"
    case divide = "/"
    case multiply = "x"
    case equal = "="
    case clear = "AC"
    case decimal = ","
    case percent = "%"
    case negative = "-/+"
}

struct OperationButton: View {
    @Binding var firstValue: String
    @Binding var secondValue: String
    @Binding var shownValue: String
    @Binding var currentOperation: Operation
    var buttonType: ButtonType
    var backgroundColor: Color = .orange
    var textColor: Color = .white
    var buttonWidth: CGFloat = 80
    
    var body: some View {
        Button(action: {
            operationAction()
        }, label: {
            Text(buttonType.rawValue)
                .frame(width: buttonWidth, height: 80)
                .background(backgroundColor)
                .foregroundColor(textColor)
                .cornerRadius(40)
                .bold()
                .font(.system(size: 35))
        })
    }
    
    func operationAction() {
        switch buttonType {
        case .add, .subtract, .divide, .multiply, .equal:
            if buttonType == .add {
                currentOperation = .add
            } else if buttonType == .subtract {
                currentOperation = .subtract
            } else if buttonType == .divide {
                currentOperation = .divide
            } else if buttonType == .multiply {
                currentOperation = .multiply
            } else if buttonType == .equal {
                PerformOperation()
            }
            
        case .clear:
            firstValue = "0"
            secondValue = "0"
            currentOperation = .none
            setShownValueToFirstValue()
            
        case .decimal:
            if currentOperation == .none {
                if !firstValue.contains(".") {
                    firstValue += "."
                }
                setShownValueToFirstValue()
            } else {
                if !secondValue.contains(".") {
                    secondValue += "."
                }
                setShownValueToSecondValue()
            }
            
        case .percent:
            if currentOperation == .none{
                if(firstValue != "0"){
                    
                    firstValue = formatValue((Double(firstValue) ?? 0) / 100)
                    setShownValueToFirstValue()}
            } else {
                if(secondValue != "0"){
                    secondValue = formatValue((Double(secondValue) ?? 0) / 100)
                    setShownValueToSecondValue()}
            }
            
        case .negative:
            if currentOperation == .none  || currentOperation == .equal{
                if(firstValue == "0") { return }

                let result = (Double(firstValue) ?? 0) * -1
                firstValue = formatValue(result)
                
                setShownValueToFirstValue()
            } else {
                if(secondValue == "0") { return }

                secondValue = formatValue((Double(secondValue) ?? 0) * -1)
                setShownValueToSecondValue()
            }
            
        default:
            if currentOperation == .none || currentOperation == .equal{
                firstValue == "0" ? (firstValue = buttonType.rawValue) : (firstValue += buttonType.rawValue)
                setShownValueToFirstValue()
            } else {
                secondValue == "0" ? (secondValue = buttonType.rawValue) : (secondValue += buttonType.rawValue)
                setShownValueToSecondValue()
            }
        }
    }
    
    func PerformOperation() {
        let result: Double
        if currentOperation == .add {
            result = (Double(firstValue) ?? 0) + (Double(secondValue) ?? 0)
        } else if currentOperation == .subtract {
            result = (Double(firstValue) ?? 0) - (Double(secondValue) ?? 0)
        } else if currentOperation == .divide {
            result = (Double(firstValue) ?? 0) / (Double(secondValue) ?? 0)
        } else if currentOperation == .multiply {
            result = (Double(firstValue) ?? 0) * (Double(secondValue) ?? 0)
        } else {
            return
        }
        
        firstValue = formatValue(result)
        setShownValueToFirstValue()
        secondValue = "0"
        firstValue = "0"
        currentOperation = .equal
    }
    
    func setShownValueToFirstValue() {
        shownValue = firstValue
    }
    
    func setShownValueToSecondValue() {
        shownValue = secondValue
    }
    
    func formatValue(_ value: Double) -> String {
        // Format to 10 decimal places
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 10
        formatter.decimalSeparator = "."
        
        return formatter.string(from: NSNumber(value: value)) ?? String(value)
    }
    
}
