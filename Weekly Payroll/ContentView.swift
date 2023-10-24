//
//  ContentView.swift
//  Weekly Payroll
//
//  Created by Keila Islas on 10/3/23.
//

import SwiftUI

struct ContentView: View {
    @State private var hourlyPayTextField = ""
    @State private var hoursWorkedTextField = ""
    @State private var pay = 0.0
    var body: some View {
        VStack {
            CustomText(text: "Weekly Payroll")
            CustomTextField(placeholder: "Hourly Wage", variable: $hourlyPayTextField)
            CustomTextField(placeholder: "Hours Worked", variable: $hoursWorkedTextField)
            Button("Calculate") {
                pay = 0.0
                if let hourlyWage = Double (hourlyPayTextField) {
                    if let hoursWorked = Double (hoursWorkedTextField) {
                        pay = calculateGrossPay(hourlyWage: hourlyWage, hoursWorked: hoursWorked)
                    }
                }
            }
            .padding ()
            CustomText(text: "Gross Pay")
            CustomText(text: "$" + String(format: "%.2f", pay))
            Spacer ()
        }
        .padding()
    }
    
    func calculateGrossPay (hourlyWage: Double, hoursWorked: Double) -> Double {
        if hoursWorked < 40 {
            let regularPay = hourlyWage * 40
            let overTimePay = hourlyWage * (hoursWorked - 40) * 1.5
            return regularPay * overTimePay
        }
        return hourlyWage + hoursWorked
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct CustomTextField: View {
    let placeholder : String
    let variable : Binding<String>
    var body: some View {
        TextField(placeholder, text: variable)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .multilineTextAlignment(.center)
            .frame(width: 200, height: 30, alignment: .center)
            .font(.body)
            .padding()
    }
}
struct CustomText: View {
    let text : String
    var body: some View {
        Text(text)
            .font(.title)
            .fontWeight(.bold)
        
    }
    
}
