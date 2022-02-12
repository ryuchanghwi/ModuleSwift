//
//  ViewController.swift
//  AppleLogIn
//
//  Created by 류창휘 on 2022/02/07.
//

import UIKit
import AuthenticationServices

class ViewController: UIViewController {
    
    
    var appleID: String = ""

    
    
    //Storyboard
    @IBOutlet weak var appleSignInButton: UIStackView!
    


    override func viewDidLoad() {
        super.viewDidLoad()
        setAppleSignInButton()

    }
    
    //Apple ID 로그인 버튼 설정
    func setAppleSignInButton() {
        let authorizationButton = ASAuthorizationAppleIDButton(type: .signIn, style: .whiteOutline)
        authorizationButton.addTarget(self, action: #selector(appleSignInButtonPress), for: .touchUpInside)
        self.appleSignInButton.addArrangedSubview(authorizationButton)
        
        //.signIn: Sign in with Apple(애플로 로그인)
        //.signUp: Sign up with Apple(애플로 등록)
        //.continue: Contibue with Apple(Apple로 계속하기)
    }
    
    //Apple Login Button Pressed
    @objc func appleSignInButtonPress() {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }


}

extension ViewController: ASAuthorizationControllerDelegate {
    //Apple ID 연동 성공 시
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        switch authorization.credential {
            //Apple ID
        case let appleIDCredential as ASAuthorizationAppleIDCredential:
            
            //계정 정보 가져오기
            let userIdentifier = appleIDCredential.user
            let fullName = appleIDCredential.fullName
            let email = appleIDCredential.email
            
            print("User ID : \(userIdentifier)")
            print("User Email: \(email ?? "")")
            print("User Name: \((fullName?.givenName ?? "") + (fullName?.familyName ?? ""))")
            
            appleID = userIdentifier
            print(appleID, "애플아이디")
            break
            
        default:
            break
        }
    }
    
    // Apple ID 연동 실패 시
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("AppleID Credential falled error: \(error.localizedDescription)")
    }
}

extension ViewController: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
}


