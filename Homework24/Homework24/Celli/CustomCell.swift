//
//  CustomCell.swift
//  Homework24
//
//  Created by Nini Bardavelidze on 11.05.24.
//

import UIKit

final class CustomCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static var identifier = "CustomCell"
    var imageView = UIImageView()
    var isFullScreen: Bool = false
    
    // MARK: - Setup
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemBackground
        imageView = configureImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureImageView() -> UIImageView {
        let imageView = UIImageView()
        contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        imageView.clipsToBounds = true
        return imageView
    }
    
    func configure(image: String) {
        guard let imageUrl = URL(string: image) else { return }
        
        imageView.setImage(with: imageUrl)
        imageView.contentMode = isFullScreen ? .scaleAspectFit : .scaleAspectFill
    }
    
}
