//
//  LanguageListCell.swift
//  GitTime
//
//  Created by Kanz on 31/05/2019.
//  Copyright © 2019 KanzDevelop. All rights reserved.
//

import UIKit

import ReactorKit
import RxCocoa
import RxSwift

final class LanguageListCell: BaseTableViewCell, View, CellType {

    typealias Reactor = LanguageListCellReactor
        
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var languageButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        colorView.layer.cornerRadius = 5.0
        colorView.layer.masksToBounds = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    fileprivate func updateUI(_ state: Reactor.State) {
        
        let languageName = state.language.name
        languageLabel.text = languageName
        languageLabel.font = state.language.type == .all ?
            .boldSystemFont(ofSize: 15.0) : .systemFont(ofSize: 14.0)
        
        let colorName = state.language.color
        if !colorName.isEmpty {
            let color = UIColor(hexString: colorName)
            colorView.backgroundColor = color
        } else {
            colorView.backgroundColor = .clear
        }
        
        favoriteButton.isHidden = state.language.type == .all
    }
    
    func bind(reactor: Reactor) {
        reactor.state
            .subscribe(onNext: { [weak self] state in
                guard let self = self else { return }
                self.updateUI(state)
            }).disposed(by: self.disposeBag)
        
        reactor.state.map { $0.isFavorite }
            .bind(to: favoriteButton.rx.isSelected)
            .disposed(by: self.disposeBag)
    }
}

// MARK: - Reactive Extension
extension Reactive where Base: LanguageListCell {
    var favoriteTapped: Observable<Language> {
        return base.favoriteButton.rx.tap
            .map { self.base.reactor?.currentState.language }
            .filterNil()
    }
    
    var languageTapped: ControlEvent<Void> {
        return base.languageButton.rx.tap
    }
}
