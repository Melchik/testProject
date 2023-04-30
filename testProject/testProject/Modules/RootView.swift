//
//  RootView.swift
//  testProject
//
//  Created by Илья Поздняков on 30.04.2023.
//

import SnapKit
import SwifterSwift
import Then
import UIKit

final class RootView: UIView {
    // MARK: Props

    struct Props: Equatable {
    }

    // MARK: - Private Props

    private var props: Props?

    // MARK: - Views

    private lazy var firstButton = UIButton(type: .system).then {
        $0.titleForNormal = "Кнопка 1"
    }

    private lazy var secondButton = UIButton(type: .system).then {
        $0.titleForNormal = "Кнопка 2"
    }

    private lazy var vStackButtons = UIStackView(
        arrangedSubviews: [
            firstButton,
            secondButton
        ],
        axis: .vertical,
        spacing: 0.0
    )

    // MARK: - LifeCycle

    init() {
        super.init(frame: .zero)

        setup()
        setupViews()
        setupConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Internal Methods

extension RootView {
    func render(_ props: Props) {
        guard self.props != props else { return }
        self.props = props
    }
}

// MARK: - Private Methods

private extension RootView {
    /// Настройка View
    func setup() {
        backgroundColor = .systemBackground
    }

    /// Добавление Views
    func setupViews() {
        addSubviews([
            vStackButtons
        ])
    }

    /// Установка констреинтов
    func setupConstraints() {
        vStackButtons.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}

// MARK: - Constants

private extension RootView {
    enum Constants {
    }
}

