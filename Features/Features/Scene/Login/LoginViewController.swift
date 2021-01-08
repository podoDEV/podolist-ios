
import UIKit
import AuthenticationServices
import Core
import Scope
import SnapKit

protocol LoginViewProtocol: AnyObject {
  func completeLogin()
}

public class LoginViewController: BaseViewController {

  // MARK: - Constants
  
  private struct Metric {
    static let logo1Width = 86.f
    static let logo1Height = 94.f
    static let logo2Width = 120.f
    static let logo2Height = 31.f
    static let stackLeadingTrailing = 60.f
    static let stackBottom = 60.f
    static let stackSpacing = 16.f
    static let buttonHeight = 44.f
  }

  // MARK: - Subviews

//  private var logoView: UIImageView!
//  private var logoView2: UIImageView!
  private var logoLabel: UILabel!
  private var providerStackView: UIStackView!
  private var appleLoginButton: ASAuthorizationAppleIDButton!
  private var kakaoLoginButton: LoginButton!
  private var anonymousLoginButton: UIButton!

  // MARK: - Properties

  var presenter: LoginPresenter

  init(presenter: LoginPresenter) {
    self.presenter = presenter
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  public override func viewDidLoad() {
    super.viewDidLoad()
    analytics.log(.login_view)
  }

  public override func setupSubviews() {
//    logoView = UIImageView().also {
//      $0.image = "ic_logo".uiImage
//      view.addSubview($0)
//    }
//    logoView2 = UIImageView().also {
//      $0.image = "ic_logo2".uiImage
//      view.addSubview($0)
//    }
    logoLabel = UILabel().also {
      $0.text = "podolist"
      $0.font = .preferredFont(type: .notoSansMedium, size: 32)
      $0.textColor = .loginLogo
      $0.textAlignment = .center
      view.addSubview($0)
    }
    providerStackView = UIStackView().also {
      $0.axis = .vertical
      $0.alignment = .fill
      $0.distribution = .fill
      $0.spacing = Metric.stackSpacing
      view.addSubview($0)
    }
    appleLoginButton = ASAuthorizationAppleIDButton(authorizationButtonType: .signIn, authorizationButtonStyle: .black).also {
      $0.addTarget(self, action: #selector(didTapAppleLogin), for: .touchUpInside)
      providerStackView.addArrangedSubview($0)
    }
    kakaoLoginButton = LoginButton().also {
      $0.layer.cornerRadius = 6
      $0.clipsToBounds = true
      $0.addTarget(self, action: #selector(didTapLogin(_:)), for: .touchUpInside)
      $0.configure(
        image: "ic_kakaoLogin".uiImage,
        title: "login.kakao".localized,
        color: .kakaoLoginBackground
      )
      providerStackView.addArrangedSubview($0)
    }
    anonymousLoginButton = UIButton().also {
      $0.backgroundColor = .clear
      $0.titleLabel?.font = .preferredFont(type: .notoSansRegular, size: 14)
      $0.setTitle("login.anonymous".localized, for: .normal)
      $0.setTitleColor(.black, for: .normal)
      $0.addTarget(self, action: #selector(didTapLogin(_:)), for: .touchUpInside)
      providerStackView.addArrangedSubview($0)
    }
  }

  public override func setupConstraints() {
//    logoView.snp.makeConstraints {
//      $0.width.equalTo(Metric.logo1Width)
//      $0.height.equalTo(Metric.logo1Height)
//      $0.centerX.equalToSuperview()
//      $0.centerY.equalToSuperview().offset(-100)
//    }
//    logoView2.snp.makeConstraints {
//      $0.width.equalTo(Metric.logo2Width)
//      $0.height.equalTo(Metric.logo2Height)
//      $0.top.equalTo(logoView.snp.bottom).offset(24)
//      $0.centerX.equalToSuperview()
//    }
    logoLabel.snp.makeConstraints {
      $0.centerX.equalToSuperview()
      $0.centerY.equalToSuperview().offset(-40)
    }
    providerStackView.snp.makeConstraints {
      $0.leading.equalToSuperview().offset(Metric.stackLeadingTrailing)
      $0.trailing.equalToSuperview().offset(-Metric.stackLeadingTrailing)
      $0.bottom.equalToSuperview().offset(-Metric.stackBottom)
    }
    appleLoginButton.snp.makeConstraints {
      $0.height.equalTo(Metric.buttonHeight)
    }
    kakaoLoginButton.snp.makeConstraints {
      $0.height.equalTo(Metric.buttonHeight)
    }
    anonymousLoginButton.snp.makeConstraints {
      $0.height.equalTo(Metric.buttonHeight)
    }
  }
  
  @objc func didTapAppleLogin() {
    let appleIDProvider = ASAuthorizationAppleIDProvider()
    let request = appleIDProvider.createRequest()
    request.requestedScopes = [.email]
    
    let authorizationController = ASAuthorizationController(authorizationRequests: [request])
    authorizationController.delegate = self
    authorizationController.presentationContextProvider = self
    authorizationController.performRequests()
  }

  @objc func didTapLogin(_ sender: Any) {
    guard let button = sender as? UIButton else { return }
    switch button {
    case kakaoLoginButton:
      presenter.didTapKakaoLogin()
    case anonymousLoginButton:
      presenter.didTapAnonymousLogin()
    default:
      break
    }
  }
}

extension LoginViewController: ASAuthorizationControllerPresentationContextProviding, ASAuthorizationControllerDelegate {
  public func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
    view.window!
  }
  
  public func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
    switch authorization.credential {
    case let appleIDCredential as ASAuthorizationAppleIDCredential:
      let userIdentifier = appleIDCredential.user
//      let fullName = appleIDCredential.fullName
      presenter.didTapAppleLogin(id: userIdentifier)
    default:
      break
    }
  }
  
  public func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
    log.warning(error)
  }
}

extension LoginViewController: LoginViewProtocol {
  func completeLogin() {
    FeaturesModuleFactory.config?.window.rootViewController = UINavigationController(rootViewController: FeaturesModuleFactory.todoVC)
  }
}
