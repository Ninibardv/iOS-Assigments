//
//  ViewController.swift
//  newDavaleba
//
//  Created by Nini Bardavelidze on 08.04.24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        let imageView = UIImageView(image: UIImage(named: "Image.comp"))
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)

        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 180),
            imageView.heightAnchor.constraint(equalToConstant: 100)
        ])

        let label = UILabel()
        label.text = "მოგესალმებით!"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 24)

        let label2 = UILabel()
        label2.text = "ამ აპლიკაციის გამოყენების საუკეთესო გზა თქვენს ანგარიშზე შესვლაა, თუ არ გაქვთ ანგარიში გააკეთეთ, თუ არ გსურთ გაკეთება დასტოვეთ აქაურობა და წაშალეთ აპლიკაცია."
        label2.textAlignment = .left
        label2.numberOfLines = 0
        label2.lineBreakMode = .byWordWrapping
        label2.font = UIFont.systemFont(ofSize: 14)
        
        let stackView = UIStackView(arrangedSubviews: [label, label2])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 5

        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])

        let titleLabel = UILabel()
        titleLabel.text = "ავტორიზაცია"
        titleLabel.textColor = .black
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.textAlignment = .center


        let lineView = UIView()
        lineView.backgroundColor = .blue
        lineView.translatesAutoresizingMaskIntoConstraints = false
        let titleStackView = UIStackView(arrangedSubviews: [titleLabel, lineView])
        titleStackView.axis = .vertical
        titleStackView.alignment = .center
        titleStackView.spacing = 10
        let stackView2 = UIStackView()
        stackView2.axis = .vertical
        stackView2.spacing = 20


        let nameLabel = UILabel()
        nameLabel.text = "სრული სახელი:"
        nameLabel.textColor = .black
        let emailLabel = UILabel()
        emailLabel.text = "ელ.ფოსტა:"
        emailLabel.textColor = .black
        let passwordLabel = UILabel()
        passwordLabel.text = "პაროლი:"
        passwordLabel.textColor = .black

        
        let nameTextField = UITextField()
        nameTextField.text = "ძალიან მეძინება"
        nameTextField.textColor = .gray
        nameTextField.borderStyle = .roundedRect
        
        let emailTextField = UITextField()
        emailTextField.text = "ჩემიბრალიაგვიანდავიწყე@ვაი.მე"
        emailTextField.textColor = .gray
        emailTextField.borderStyle = .roundedRect
        
        let passwordTextField = UITextField()
        passwordTextField.text = "აღარ მინდა"
        passwordTextField.textColor = .gray
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.isSecureTextEntry = true

        stackView2.addArrangedSubview(nameLabel)
        stackView2.addArrangedSubview(nameTextField)
        stackView2.addArrangedSubview(emailLabel)
        stackView2.addArrangedSubview(emailTextField)
        stackView2.addArrangedSubview(passwordLabel)
        stackView2.addArrangedSubview(passwordTextField)

        NSLayoutConstraint.activate([
            lineView.widthAnchor.constraint(equalTo: titleLabel.widthAnchor),
            lineView.widthAnchor.constraint(equalToConstant: 400),
            lineView.heightAnchor.constraint(equalToConstant: 2)
        ])

        let mainStackView = UIStackView(arrangedSubviews: [titleStackView, stackView2])
        mainStackView.axis = .vertical
        mainStackView.alignment = .fill
        mainStackView.spacing = 20
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mainStackView)

        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 30),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        let loginButton = UIButton(type: .system)
        loginButton.setTitle("შესვლა", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.backgroundColor = .blue
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        loginButton.layer.cornerRadius = 12
        loginButton.translatesAutoresizingMaskIntoConstraints = false

        let buttonStackView = UIStackView(arrangedSubviews: [loginButton])
        buttonStackView.axis = .vertical
        buttonStackView.alignment = .center
        buttonStackView.spacing = 30

        mainStackView.addArrangedSubview(buttonStackView)

        NSLayoutConstraint.activate([
            buttonStackView.topAnchor.constraint(equalTo: stackView2.bottomAnchor, constant: 30),
            buttonStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            buttonStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            loginButton.widthAnchor.constraint(equalToConstant: 400),
            loginButton.heightAnchor.constraint(equalToConstant: 46)
        ])


    }
}
