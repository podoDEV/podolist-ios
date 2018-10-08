//
//  Colors.swift
//  Podolist
//
//  Copyright © 2018년 podo. All rights reserved.
//

import UIKit

private struct PodolistColors {

    static let appColor1 = UIColor(hex: 0x9E30FE)
    static let appColor2 = UIColor(hex: 0xC32BFF) // 그라데이션 fill
    static let appColor3 = UIColor(hex: 0xD6ACFB) // 달력 날짜 선택
    static let appColor4 = UIColor(hex: 0xDEB9FF) // 투두리스트 완료

    static let gradationStart = UIColor(hex: 0xC32BFF)
    static let gradationEnd = UIColor(hex: 0x9013FE)

    static let priorityColor1 = UIColor(hex: 0xD0021B) // 매우 중요
    static let priorityColor2 = UIColor(hex: 0xF5A623) // 중요
    static let priorityColor3 = UIColor(hex: 0x7ED321) // 보통
    static let priorityColor4 = UIColor(hex: 0x50E3C2) // 여유

    static let backgroundColor1 = UIColor(hex: 0xEBEBEB)
    static let backgroundColor2 = UIColor(hex: 0xD1D1D1) // 중요도 선택 x

    static let gray3 = UIColor(hex: 0x333333)
    static let gray8 = UIColor(hex: 0x888888)
    static let grayA = UIColor(hex: 0xAAAAAA)
    static let grayC = UIColor(hex: 0xCCCCCC)
    static let grayE = UIColor(hex: 0xEEEEEE)
    static let grayF4 = UIColor(hex: 0xF4F4F4)
    static let modalBackground = UIColor(white: 0x000000, alpha: 0.7)
}

extension UIColor {

    static var appColor1: UIColor { return PodolistColors.appColor1 }
    static var appColor2: UIColor { return PodolistColors.appColor2 }
    static var appColor3: UIColor { return PodolistColors.appColor3 }
    static var appColor4: UIColor { return PodolistColors.appColor4 }

    static var gradationStart: UIColor { return PodolistColors.gradationStart }
    static var gradationEnd: UIColor { return PodolistColors.gradationEnd }

    static var priorityColor1: UIColor { return PodolistColors.priorityColor1 }
    static var priorityColor2: UIColor { return PodolistColors.priorityColor2 }
    static var priorityColor3: UIColor { return PodolistColors.priorityColor3 }
    static var priorityColor4: UIColor { return PodolistColors.priorityColor4 }

    static var backgroundColor1: UIColor { return PodolistColors.backgroundColor1 }
    static var backgroundColor2: UIColor { return PodolistColors.backgroundColor2 }

    static var gray3: UIColor { return PodolistColors.gray3 }
    static var gray8: UIColor { return PodolistColors.gray8 }
    static var grayA: UIColor { return PodolistColors.grayA }
    static var grayC: UIColor { return PodolistColors.grayC }
    static var grayE: UIColor { return PodolistColors.grayE }
    static var grayF4: UIColor { return PodolistColors.grayF4 }
    static var modalBackground: UIColor { return PodolistColors.modalBackground }
}
