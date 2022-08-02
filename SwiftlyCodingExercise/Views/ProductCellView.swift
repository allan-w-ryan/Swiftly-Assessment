//
//  ProductCellView.swift
//  SwiftlyCodingExercise
//
//  Created by Allan Ryan on 7/30/22.
//

import SwiftUI

struct ProductCellView: View {
    var canvasUnit: Int
    var product: Product
    let backgroundColor = Color.white
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                AsyncImage(
                    url: URL(string: product.imageUrl),
                    content: { image in
                        image.resizable()
                             .aspectRatio(contentMode: .fit)
                             .frame(maxWidth: 72, maxHeight: 72)
                    },
                    placeholder: {
                        Image(uiImage: placeholderImage(size: CGSize(width: 72, height: 72)))
                    }
                ).padding([.leading], 10)
                VStack {
                    Text(localizedPrice(price:product.originalPrice)).foregroundColor(Color.gray).strikethrough()
                    Text(localizedPrice(price:product.price)).foregroundColor(Color.mint).bold()
                }
            }
            Text(product.displayName)
        }.cornerRadius(10)
            .background(Color.white)
    }
    
    func localizedPrice(price: NSNumber) -> String {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale.current
        guard let priceString = currencyFormatter.string(from: price) else {
            return "ERROR"
        }
        return priceString
    }
    
    func placeholderImage(size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            UIColor.gray.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }
    }
}

struct ProductCellView_Previews: PreviewProvider {
    static let canvasUnit = 16
    static let testProduct = Product(
        imageUrl: "https://raw.githubusercontent.com/Swiftly-Systems/code-exercise-ios/master/images/L.png",
        width: 16,
        height: 8,
        displayName: "Noodle Dish with Roasted Black Bean Sauce",
        originalPrice: 2.00,
        price: 1.00)
    
    static var previews: some View {
        
        ProductCellView(canvasUnit: ProductCellView_Previews.canvasUnit,
                        product: ProductCellView_Previews.testProduct)
    }
}
