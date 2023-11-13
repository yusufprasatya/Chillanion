//
//  Highlight.swift
//  SleepWell
//
//  Created by Billbert Pohandy on 12/11/23.
//

import SwiftUI

struct Highlight: Identifiable, Equatable {
    var id: UUID = .init()
    var anchor: Anchor<CGRect>
    var title: String
    var cornerRadius: CGFloat
    var style: RoundedCornerStyle = .continuous
    var scale: CGFloat = 1
}

