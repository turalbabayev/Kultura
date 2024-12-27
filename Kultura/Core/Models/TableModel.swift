//
//  TableModel.swift
//  Kultura
//
//  Created by Tural Babayev on 27.12.2024.
//

import SwiftUI

struct TableModel: Identifiable {
    let id: Int
    let type: TableType
    let x: CGFloat
    let y: CGFloat
    let isOccupied: Bool
}
