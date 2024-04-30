import UIKit


class LoginPageVC: UIViewController {
    
    // MARK: - Variables
    
    var viewModel = LoginPageViewModel()
    
    // MARK: - UI Components
    
    let imageButtonView: UIButton = {
        let button = UIButton()
        button.tintColor = .label
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 65
        button.layer.borderColor = UIColor.black.cgColor
        button.backgroundColor = UIColor(named: "customBackground")
        button.clipsToBounds = true
        button.isUserInteractionEnabled = true
        return button
    }()
    
    let personImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "person.crop.circle.fill.badge.plus")
        image.tintColor = .label
        return image
    }()
    
    let plusImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "person.crop.circle.fill")
        image.tintColor = .label
        return image
    }()
    
    let inputsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 35
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    var nameTextField: UITextField!
    var passwordTextField: UITextField!
    var password2TextField: UITextField!
    
    let registerButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.setTitle("დარეგისტრირება", for: .normal)
        button.titleLabel?.font = button.titleLabel?.font.withSize(14)
        button.layer.cornerRadius = 23
        return button
    }()
    
    let autoLoginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemPink
        button.setTitleColor(.white, for: .normal)
        button.setTitle("შესვლა", for: .normal)
        button.titleLabel?.font = button.titleLabel?.font.withSize(14)
        button.layer.cornerRadius = 24
        return button
    }()
    
    let helloLabel: UILabel = {
        let label = UILabel()
        label.text = "გამარჯობა"
        label.font = label.font.withSize(24)
        label.textAlignment = .center
        label.isHidden = true
        return label
    }()
    
    let navigateButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemRed
        button.setTitleColor(.white, for: .normal)
        button.setTitle("ნახე ქვეყნები", for: .normal)
        button.titleLabel?.font = button.titleLabel?.font.withSize(14)
        button.layer.cornerRadius = 24
        button.isHidden = true
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupData()
    }
    
    
    // MARK: - UI Setup
    
    func setupLayout() {
        view.backgroundColor = UIColor(named: "customBackground")
        
        view.addSubview(imageButtonView)
        imageButtonView.addSubview(personImageView)
        view.addSubview(inputsStackView)
        view.addSubview(registerButton)
        view.addSubview(autoLoginButton)
        view.addSubview(helloLabel)
        view.addSubview(navigateButton)
        
        imageButtonView.translatesAutoresizingMaskIntoConstraints = false
        personImageView.translatesAutoresizingMaskIntoConstraints = false
        inputsStackView.translatesAutoresizingMaskIntoConstraints = false
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        autoLoginButton.translatesAutoresizingMaskIntoConstraints = false
        helloLabel.translatesAutoresizingMaskIntoConstraints = false
        navigateButton.translatesAutoresizingMaskIntoConstraints = false
        
        let (nameView, textField) = UIView.createCustomInputView(titleLabel: "მომხმარებლის სახელი", inputPlaceholder: "შეიყვანეთ მომხმარებლის სახელი")
        nameTextField = textField
        inputsStackView.addArrangedSubview(nameView)
        
        let (passwordView, passwordField) = UIView.createCustomInputView(titleLabel: "პაროლი", inputPlaceholder: "შეიყვანეთ პაროლი", isPassword: true)
        passwordTextField = passwordField
        inputsStackView.addArrangedSubview(passwordView)
        
        let (password2View, password2Field) = UIView.createCustomInputView(titleLabel: "გაიმეორეთ პაროლი", inputPlaceholder:  "შეიყვანეთ პაროლი განმეორებით", isPassword: true)
        password2TextField = password2Field
        inputsStackView.addArrangedSubview(password2View)
        
        NSLayoutConstraint.activate([
            imageButtonView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageButtonView.heightAnchor.constraint(equalToConstant: 125),
            imageButtonView.widthAnchor.constraint(equalToConstant: 125),
            imageButtonView.topAnchor.constraint(equalTo: view.topAnchor, constant: 110),
            
            personImageView.centerXAnchor.constraint(equalTo: imageButtonView.centerXAnchor, constant: -3),
            personImageView.centerYAnchor.constraint(equalTo: imageButtonView.centerYAnchor),
            personImageView.heightAnchor.constraint(equalToConstant: 80),
            personImageView.widthAnchor.constraint(equalToConstant: 80),
            
            inputsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            inputsStackView.topAnchor.constraint(equalTo: imageButtonView.bottomAnchor, constant: 46),
            inputsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            inputsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            registerButton.topAnchor.constraint(equalTo: inputsStackView.bottomAnchor, constant: 50),
            registerButton.heightAnchor.constraint(equalToConstant: 46),
            
            autoLoginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            autoLoginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            autoLoginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            autoLoginButton.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 25),
            autoLoginButton.heightAnchor.constraint(equalToConstant: 46),
            
            helloLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            helloLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            helloLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            helloLabel.topAnchor.constraint(equalTo: imageButtonView.bottomAnchor, constant: 100),
            
            navigateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            navigateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            navigateButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            navigateButton.topAnchor.constraint(equalTo: helloLabel.bottomAnchor, constant: 25),
            navigateButton.heightAnchor.constraint(equalToConstant: 75),
            
        ])
    }
    
    func setupData() {
        updateBorderColor()
        
        imageButtonView.addAction(UIAction(handler: { _ in
            self.openGallery()
        }), for: .touchUpInside)
        
        registerButton.addAction(UIAction(handler: { _ in
            self.registerButtonClicker()
        }), for: .touchUpInside)
        
        autoLoginButton.addAction(UIAction(handler: { _ in
            self.autoLoginButtonClicked()
        }), for: .touchUpInside)
        
        navigateButton.addAction(UIAction(handler: { _ in
            self.navigateButtonClicked()
        }), for: .touchUpInside)
    }
    
    
    
    // MARK: - Helper Functions
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if self.traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
            updateBorderColor()
        }
    }
    
    func updateBorderColor() {
        if traitCollection.userInterfaceStyle == .dark {
            imageButtonView.layer.borderColor = UIColor.white.cgColor
        } else {
            imageButtonView.layer.borderColor = UIColor.black.cgColor
        }
    }
    
    func registerButtonClicker() {
        if viewModel.userHasLoggedIn {
            userLoggedOut()
        } else {
            handleLogin()
        }
    }
    
    func autoLoginButtonClicked() {
        if viewModel.userHasLoggedIn {
            viewModel.openGif()
        } else {
            do {
                let credentials = try viewModel.loadCredentials()
                userLoggedIn(username: credentials.username)
            } catch {
                print("Cant Login")
                
                displayAlert(message: "თქვენი მონაცემები არ არის შენახული", title: "არ გამოვა მასე")
            }
        }
    }
    
    
    func navigateButtonClicked() {
        let landingPageVC = LandingPageVC()
        navigationController?.pushViewController(landingPageVC, animated: true)
    }
    
    func handleLogin() {
        guard let username = nameTextField.text, !username.isEmpty,
              let password = passwordTextField.text, !password.isEmpty,
              let repeatedPassword = password2TextField.text, !repeatedPassword.isEmpty else {
            displayAlert(message: "შეავსეთ ყველა ველი", title: "სცადეთ თავიდან")
            return
        }
        
        guard password == repeatedPassword else {
            displayAlert(message: "პაროლები არ ემთხვევა", title: "სცადეთ თავიდან")
            return
        }
        
        do {
            try viewModel.saveCredentials(username: username, password: password)
            userLoggedIn(username: username)
            if viewModel.isFirstLogin() {
                displayAlert(message: "გვიხარია რომ შემოუერთდით ჩვენ გუნდს და გახდით ჩვენი აპლიკაციის მომხმარებელი", title: "მოგესალმებით")
            }
        } catch {
            displayAlert(message: "უკვე დარეგისტირებული ხართ", title: "სცადეთ თავიდან")
        }
    }
    
    
    func displayAlert(message: String, title: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ოკ", style: .default))
        self.present(alert, animated: true, completion: nil)
    }
    
    func userLoggedIn(username: String){
        viewModel.userHasLoggedIn = true
        inputsStackView.isHidden = true
        helloLabel.isHidden = false
        helloLabel.text = "გამარჯობა \(username)"
        autoLoginButton.setTitle("ვაი", for: .normal)
        registerButton.setTitle("ანგარიშიდან გამოსვლა", for: .normal)
        navigateButton.isHidden = false
        loadImage()
    }
    
    func userLoggedOut(){
        nameTextField.text = ""
        passwordTextField.text = ""
        password2TextField.text = ""
        viewModel.userHasLoggedIn = false
        inputsStackView.isHidden = false
        helloLabel.isHidden = true
        helloLabel.text = ""
        autoLoginButton.setTitle("შესვლა", for: .normal)
        registerButton.setTitle("რეგისტრაცია", for: .normal)
        imageButtonView.setImage(nil, for: .normal)
        personImageView.isHidden = false
        navigateButton.isHidden = true
    }
    
    func loadImage() {
        let fileURL = viewModel.getDocumentsDirectory().appendingPathComponent("user.png")
        if let imageData = try? Data(contentsOf: fileURL),
           let image = UIImage(data: imageData) {
            imageButtonView.setImage(image, for: .normal)
            personImageView.isHidden = true
        }
    }

}


// MARK: Gallery Extension

extension LoginPageVC:  UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    func openGallery(){
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.editedImage] as? UIImage {
            imageButtonView.setImage(image, for: .normal)
            personImageView.isHidden = true
            if viewModel.userHasLoggedIn || viewModel.isFirstLogin() {
                viewModel.saveImage(image: image)
            }
        } else if let image = info[.originalImage] as? UIImage {
            imageButtonView.setImage(image, for: .normal)
            personImageView.isHidden = true
            if viewModel.userHasLoggedIn || viewModel.isFirstLogin() {
                viewModel.saveImage(image: image)
            }
        }
        
        dismiss(animated: true)
    }
}

