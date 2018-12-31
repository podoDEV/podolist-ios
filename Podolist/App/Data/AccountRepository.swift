//
//  AccountRepository.swift
//  Podolist
//
//  Copyright © 2018년 podo. All rights reserved.
//

import RxSwift

class AccountRepository: AccountDataSource {
    var localDataSource: AccountLocalDataSource?
    var remoteDataSource: AccountRemoteDataSource?

    func findAccount() -> Account? {
        return localDataSource?.selectAccount()
    }

    func addAccount(_ account: Account) -> Completable? {
        return localDataSource?.insertAccount(account)
    }
}
