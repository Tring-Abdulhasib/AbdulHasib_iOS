//
//  CartPageTableVC.swift
//  AbdulHasib_iOS
//
//  Created by Abdul Hasib on 16/09/25.
//

import UIKit

class CartPageTableVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    struct Product {
        let imageName: String
        let title: String
        let price: Double
        let stock: Int
        let offer: String?
    }
    @IBOutlet weak var table: UITableView!
    let data = [
        Product(imageName: "watch1", title: "Classic Leather Watch", price: 199.99, stock: 12, offer: "10% Off"),
        Product(imageName: "watch2", title: "Sport Digital Watch", price: 149.50, stock: 5, offer: nil),
        Product(imageName: "sunglass2", title: "Round Vintage Sunglasses", price: 74.99, stock: 8, offer: "15% Off"),
        Product(imageName: "headphone1", title: "Wireless Over-Ear Headphones", price: 249.00, stock: 15, offer: nil),
        Product(imageName: "sunglass1", title: "Aviator Sunglasses", price: 89.99, stock: 20, offer: "Buy 1 Get 1 Free"),
        Product(imageName: "bag1", title: "Leather Messenger Bag", price: 329.00, stock: 6, offer: "Free Shipping"),
    ]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let product = data[indexPath.row]
        let cell = table.dequeueReusableCell(withIdentifier: "productCardCell", for: indexPath) as! ProductCardCell
        
        cell.productImageView.image = UIImage(named: product.imageName)
        cell.label.text = product.title
        cell.priceLabel.text = String(format: "$%.2f", product.price)
        cell.stockLabel.text = product.stock > 0 ? "In Stock: \(product.stock)" : "Out of Stock"
        cell.offerLabel.text = product.offer
       
        return cell
    }
    
   

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
        table.delegate = self   
        table.rowHeight = 250
        // Do any additional setup after loading the view.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
