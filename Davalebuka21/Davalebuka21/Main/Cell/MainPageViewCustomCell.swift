import UIKit

class CustomCell: UICollectionViewCell {
    
    //MARK: Properties:
    let mainView: UIView = {
        let mainView = UIView()
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.layer.cornerRadius = 18
        mainView.layer.borderWidth = 0.5
        return mainView
    }()
    
    var flag: UIImageView = {
        let flag = UIImageView()
        flag.image = UIImage(named: "flag")
        flag.translatesAutoresizingMaskIntoConstraints = false
        flag.widthAnchor.constraint(equalToConstant: 30).isActive = true
        flag.heightAnchor.constraint(equalToConstant: 20).isActive = true
        flag.layer.cornerRadius = 18
        return flag
    }()
    
    let name: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.text = "Georgia"
        name.textColor = UIColor(named: "labelForColor")
        name.font = UIFont(name: "SF Pro", size: 14)
        return name
    }()
    
    var symbol: UIImageView = {
        let symbol = UIImageView()
        symbol.image = UIImage(named: "symbol")
        symbol.translatesAutoresizingMaskIntoConstraints = false
        return symbol
    
    }()

    private let chevronImageView: UIImageView = {
            let imageView = UIImageView(image: UIImage(systemName: "chevron.right"))
            imageView.tintColor = .gray // Adjust the color of the chevron icon as needed
            imageView.contentMode = .scaleAspectFit
            return imageView
        }()

    
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: SetupUI
    func setupUI() {
        addSubview(mainView)
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            mainView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            mainView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            mainView.heightAnchor.constraint(equalToConstant: 50)
        ])
        mainView.addSubview(flag)
        mainView.addSubview(name)
        mainView.addSubview(symbol)
        NSLayoutConstraint.activate([
            flag.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 24),
            flag.centerYAnchor.constraint(equalTo: mainView.centerYAnchor),
            symbol.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -24),
            symbol.centerYAnchor.constraint(equalTo: mainView.centerYAnchor),
            name.trailingAnchor.constraint(equalTo: symbol.leadingAnchor, constant: -5),
            name.centerYAnchor.constraint(equalTo: mainView.centerYAnchor),
            name.widthAnchor.constraint(lessThanOrEqualToConstant: 220)
        ])
    }
    
    func setFlagImage(from urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let data = data, let image = UIImage(data: data) else {
                print("Failed to load image:", error ?? "Unknown error")
                return
            }
            
            DispatchQueue.main.async {
                self?.flag.image = image
            }
        }
        
        task.resume()
    }
    
}
