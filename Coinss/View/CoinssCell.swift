//
//  CoinssCell.swift
//  Coinss
//
//  Created by Nisa Nur Baştimur on 26.04.2024.
//

import UIKit

class CoinssCell: UITableViewCell {
    
    @IBOutlet weak var detailButtonn: UIButton!
    @IBOutlet weak var coinssLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        detailButtonn.layer.cornerRadius = 15
        
       
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func detailButton(_ sender: Any) {
        if let url = URL(string: "https://www.coingecko.com/tr"){
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
}
