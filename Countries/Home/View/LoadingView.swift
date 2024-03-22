//
//  LoadingView.swift
//  Countries
//
//  Created by Luis Morante on 29/02/24.
//

import UIKit

class LoadingView: UIView {
    
    private let activityIndicator: UIActivityIndicatorView = {
        
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
        
    }()

    override init(frame: CGRect) {
        
        super.init(frame: frame)
        setupViews()
        
    }

    required init?(coder: NSCoder) {
        
        super.init(coder: coder)
        setupViews()
        
    }

    private func setupViews() {
        backgroundColor = UIColor(white: 0, alpha: 0.5)
        addSubview(activityIndicator)

        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

    func startAnimating() {
        activityIndicator.startAnimating()
    }

    func stopAnimating() {
        activityIndicator.stopAnimating()
    }
}
