import UIKit
import EasyPeasy

protocol EnterToAppDelegate: AnyObject {
    
    func withoutRegButtonTappedDelegate()
    
}


final class LoginLabels: UIView {
    
    weak var delegate: EnterToAppDelegate?
    
   // private var withoutLogin: UI
    
    var enterButton: UIButton = {
        let button = UIButton()
        button.setTitle("ВОЙТИ", for: .normal)
        button.backgroundColor = UIColor(red: 255.0/255.0, green: 159.0/255.0, blue: 10.0/255.0, alpha: 1)
        return button
    }()
    

    
    private var registrationTitle: UIView = {
        let title = UILabel()
        title.text = "ВХОД"
        title.font = .systemFont(ofSize: 25, weight: .bold)
        title.textColor = .black
        return title
    }()
    
    private var loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Логин"
        return label
    }()
    
    private var passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Пароль"
        return label
    }()
    
    var userLoginTextField: UITextField = {
        let textField = UITextField(frame: CGRect())
        textField.placeholder = "вот сюда логин надо"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    var userPasswordTextField: UITextField = {
        let textField = UITextField(frame: CGRect())
        textField.placeholder = "вот сюда пароль надо"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private var circles = RegAndLogCircles(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let allSubviews = [
            circles,
            registrationTitle,
            userLoginTextField,
            loginLabel,
            passwordLabel,
            userPasswordTextField,
            enterButton,
        ]
        
        allSubviews.forEach {
            addSubview($0)
        }
        
        configureButton()
        
        layoutSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setupLayout()
    }
    
    private func configureButton() {
        enterButton.layer.cornerRadius = 20
    }
    
    
    func setupLayout() {
        
        registrationTitle.easy.layout(
            CenterX(),
            Top(height * 2/6)
        )
        
        loginLabel.easy.layout(
            Left(self.width * 1/8),
            Top(UIScreen.main.bounds.height * 1/9).to(registrationTitle)
        )
        
        userLoginTextField.easy.layout(
            Left(self.width * 1/8),
            Top(5).to(loginLabel),
            Width(self.width * 6/8),
            Height(40)
        )
        
        passwordLabel.easy.layout(
            Left(self.width * 1/8),
            Top(40).to(userLoginTextField)
        )
        
        userPasswordTextField.easy.layout(
            Left(self.width * 1/8),
            Top(5).to(passwordLabel),
            Width(self.width * 6/8),
            Height(40)
        )
        
        enterButton.easy.layout(
            Top(40).to(userPasswordTextField),
            CenterX(),
            Height(45),
            Width(200)
        )
        
        
    }
}
