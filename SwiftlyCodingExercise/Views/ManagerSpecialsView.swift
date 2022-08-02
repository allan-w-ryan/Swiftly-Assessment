//
//  ManagerSpecialsView.swift
//  SwiftlyCodingExercise
//
//  Created by Allan Ryan on 7/30/22.
//

import SwiftUI

struct ManagerSpecialsView: View {
    
    @ObservedObject var viewModel: ManagerSpecialsViewModel
    
    let backgroundColor = Color.init(red: 242.0/255.0, green: 242.0/255.0, blue: 242.0/255.0)

    @State private var result: Result<Canvas, Error>?

    var body: some View {
        ScrollView {
            Text("Manager's Special").font(.headline).padding([.bottom], 10)
            switch viewModel.state {
            case .idle:
                Color.clear.onAppear(perform: viewModel.loadSpecials)
            case .loading:
                ProgressView()
            case .failed (let error):
                alert("Error", isPresented: $viewModel.presentAlert) {
                    Button("Okay") {}
                } message: {
                    Text(error.localizedDescription)
                }
            case .loaded(let canvas):
                ForEach(canvas.managerSpecials) { special  in
                    ProductCellView(canvasUnit: canvas.canvasUnit, product: special)
                }.frame(maxWidth: .infinity).padding()
            }
        }.background(backgroundColor)
    }
}

struct ManagersSpecialView_Previews: PreviewProvider {
    static var previews: some View {
        ManagerSpecialsView(viewModel: ManagerSpecialsViewModel())
    }
}
