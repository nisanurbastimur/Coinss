//
//  MainViewcontroller.swift
//  Coinss
//
//  Created by Nisa Nur Baştimur on 22.04.2024.
//
import RxCocoa
import RxSwift
import UIKit
import Firebase


class MainViewcontroller: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let cryVm = CryptoViewModel()
    let disposeBag = DisposeBag()
    var cryList = [Crypto]()
    
   
    @IBOutlet weak var mainTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainTableView.dataSource = self
        mainTableView.delegate = self
        
        cryVm.requestData()
        setupBindings()
       
    }
    
    private func setupBindings(){
        
        
        cryVm
            .error
            .observe(on: MainScheduler.asyncInstance)
            .subscribe { errorString in
                print(errorString)
                
            }
            .disposed(by: disposeBag)
        
        cryVm
            .cryptos
            .observe(on: MainScheduler.asyncInstance)
            .subscribe { cryptos in
                self.cryList = cryptos
                self.mainTableView.reloadData()
                
            }
            .disposed(by: disposeBag)
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CoinssCell
        cell.coinssLabel.text = cryList[indexPath.row].currency
        cell.priceLabel.text = String(cryList[indexPath.row].price)
        return cell
        
        
//        let cell = UITableViewCell()
//        var content = cell.defaultContentConfiguration()
//        content.text = cryList[indexPath.row].currency
//        content.secondaryText = String(cryList[indexPath.row].price)
//        cell.contentConfiguration = content
//        return cell
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cryList.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let title = "Coinss"
        return title
    }
    


}
