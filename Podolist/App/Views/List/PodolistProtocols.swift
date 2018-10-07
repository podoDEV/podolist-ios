//
//  PodolistProtocols.swift
//  Podolist
//
//  Copyright © 2018년 podo. All rights reserved.
//

import RxSwift
import SwiftyJSON

protocol PodolistViewProtocol: class {
    var presenter: PodolistPresenterProtocol? { get set }

    // Presenter -> View 
    func showPodolist(with podolist: [ViewModelPodo])
    func updateUI(mode: Mode, keyboardHeight: CGFloat?)
}

extension PodolistViewProtocol where Self: UIViewController {
    func showLoading() {

    }

    func hideLoading() {

    }
}

protocol PodolistPresenterProtocol: class {
    var view: PodolistViewProtocol? { get set }
    var interactor: PodolistInteractorProtocol? { get set }
    var wireFrame: PodolistWireFrameProtocol? { get set }

    // View -> Presenter
    func refresh()
    func viewWillAppear()
    func viewWillDisappear()
    func showSetting()
    func writeWillFinish()
    func modeWillChanged()

    func didTappedDetail()
}

protocol PodolistInteractorProtocol: class {
    var dataSource: PodoDataSource? { get set }

    // Presenter -> Interactor
    func fetchPodolist() -> Observable<[ViewModelPodo]>?
}

protocol PodolistWireFrameProtocol: class {
    static func createPodolistModule() -> UIViewController

    // Presenter -> WireFrame
//    func presentPodoDetailScreen(from view: PodolistViewProtocol, forWish wish: ViewModel)
    func goToSettingScreen(from view: PodolistViewProtocol)
}
