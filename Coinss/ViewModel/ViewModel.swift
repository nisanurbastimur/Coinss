//
//  ViewModel.swift
//  Coinss
//
//  Created by Nisa Nur Baştimur on 23.04.2024.
//

import Foundation
import RxSwift
import RxCocoa


class CryptoViewModel {
    let cryptos : PublishSubject<[Crypto]> = PublishSubject()
    let error : PublishSubject<String> = PublishSubject()
    let loading : PublishSubject<Bool> = PublishSubject()
    
    func requestData() {
        
        self.loading.onNext(true)
        
        Webservice().installData(url: URL(string:"https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!) { cryptoResult in
            self.loading.onNext(false)
            switch cryptoResult {
            case.success(let cryptos):
                self.cryptos.onNext(cryptos)
            case.failure(let error):
                switch error {
                case.parsingError:
                    self.error.onNext("parsing  error")
                case.InstallError:
                    self.error.onNext("install error")
                }
                
            }
        }
        
        
    }
    
}
