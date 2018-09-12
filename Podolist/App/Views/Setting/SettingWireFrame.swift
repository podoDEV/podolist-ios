//
//  SettingWireFrame.swift
//  Podolist
//
//  Copyright © 2018년 podo. All rights reserved.
//

import UIKit

class SettingWireFrame: SettingWireFrameProtocol {

    static var settingStoryboard: UIStoryboard {
        return UIStoryboard(name: "Setting", bundle: Bundle.main)
    }

    static func createSettingModule() -> UIViewController {
        let settingEntry = settingStoryboard.instantiateViewController(withIdentifier: "SettingViewController")
        if let view = settingEntry as? SettingView {
            let presenter: SettingPresenterProtocol = SettingPresenter()
            let interactor: SettingInteractorProtocol = SettingInteractor()
//            let dataSource: PodoDataSource = PodoRepository()
//            let localDataSource: PodoLocalDataSource = PodoLocalRepository()
//            let remoteDataSource: PodoRemoteDataSource = PodoRemoteRepository()
            let wireFrame: SettingWireFrameProtocol = SettingWireFrame()

            view.presenter = presenter
            presenter.view = view
            presenter.interactor = interactor
            presenter.wireFrame = wireFrame
//            interactor.dataSource = dataSource
//            dataSource.localDataSource = localDataSource
//            dataSource.remoteDataSource = remoteDataSource

            return settingEntry
        }
        return UIViewController()
    }
}