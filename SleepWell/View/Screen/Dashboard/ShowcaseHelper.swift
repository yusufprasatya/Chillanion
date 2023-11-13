//
//  ShowcaseHelper.swift
//  SleepWell
//
//  Created by Billbert Pohandy on 12/11/23.
//

import SwiftUI

extension View {
    @ViewBuilder
    func showCase(order: Int, title: String, cornerRadius: CGFloat, style: RoundedCornerStyle = .continuous, scale: CGFloat = 1) -> some View {
        self
            .anchorPreference(key: HighlightAnchorKey.self, value: .bounds) { anchor in
                let highlight = Highlight(anchor: anchor, title: title, cornerRadius: cornerRadius, style: style, scale: scale)
                return [order: highlight]
            }
    }
}

struct ShowcaseRoot: ViewModifier {
    var showHighlights: Bool
    var onFinished: () -> ()
    
    @State private var highlightOrder: [Int] = []
    @State private var currentHighlight: Int = 0
    
    func body(content: Content) -> some View {
        content
            .onPreferenceChange(HighlightAnchorKey.self) { value in
                highlightOrder = Array(value.keys)
            }
            .overlayPreferenceValue(HighlightAnchorKey.self) { preferences in
                if highlightOrder.indices.contains(currentHighlight) {
                    if let highlight = preferences [highlightOrder[currentHighlight]] {
                        HighlightView(highlight)
                    }
                }
            }
    }
        @ViewBuilder
func HighlightView(_ highlight: Highlight) -> some View {
            // Geometry Reader for Extracting Highlight Frame Rects
            GeometryReader { proxy in
                let highlightRect = proxy[highlight.anchor]
                Rectangle()
                    .frame(width: highlightRect.width, height: highlightRect.height)
                    .clipShape(RoundedRectangle(cornerRadius: highlight.cornerRadius, style: highlight.style))
                    .offset(x: highlightRect.minX, y: highlightRect.minY)
            }
        }
    }

    
    fileprivate struct HighlightAnchorKey: PreferenceKey {
        static var defaultValue: [Int: Highlight] = [:]
        static func reduce(value: inout [Int : Highlight], nextValue: () -> [Int :
                                                                                Highlight]) {
            value.merge (nextValue()) { $1 }
            
            struct ShowcaseHelper: View {
                var body: some View {
                    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                }
            }
        }
    }
    #Preview {
        DashboardView()
    }
