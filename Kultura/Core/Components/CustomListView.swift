//
//  CustomListView.swift
//  Kultura
//
//  Created by Tural Babayev on 23.12.2024.
//

import SwiftUI

struct CustomListView: View {
    @State private var items: [ListItem]

    init(items: [ListItem]) {
        self._items = State(initialValue: items)
    }

    var body: some View {
        VStack(spacing: 0) {
            ForEach(items.indices, id: \.self) { index in
                if let destination = items[index].destination {
                    NavigationLink(destination: destination) {
                        listRow(for: items[index])
                    }
                    .buttonStyle(PlainButtonStyle())
                } else {
                    listRow(for: items[index])
                }
            }
        }
        //.background(Color.gray.opacity(0.1))
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
        )
        .padding(.horizontal)
    }

    private func listRow(for item: ListItem) -> some View {
        HStack {
            Text(item.title)
                .font(Font.system(size: 16, weight: .regular))
            
            Spacer()
            
            if let trailingView = item.trailingView {
                trailingView
            } else if let index = items.firstIndex(where: { $0.id == item.id }) {
                if let _ = items[index].isToggled {
                    Toggle("", isOn: $items[index].isToggled.toNonOptional())
                        .toggleStyle(SwitchToggleStyle(tint: .green))
                }
            }
        }
        .padding()
        //.background(Color.gray.opacity(0.1))
    }
}




#Preview {
    CustomListView(items: [
        ListItem(
            title: "Reservasyonlarim",
            destination: AnyView(Text("Home")),
            trailingView: AnyView(Image(systemName: "chevron.right").foregroundColor(.gray)), // Simge
            isToggled: nil // Toggle yok
        ),
        ListItem(
            title: "Bildirimler",
            destination: AnyView(Text("Notifications")),
            trailingView: nil, // trailingView yok, Toggle gösterilecek
            isToggled: true // Toggle başlangıçta açık
        ),
        ListItem(
            title: "Ayarlar",
            destination: AnyView(Text("Settings")),
            trailingView: AnyView(Text("Açık").foregroundColor(.green)), // Metin
            isToggled: nil // Toggle yok
        )
    ])
}

extension Binding where Value == Bool? {
    func toNonOptional(defaultValue: Bool = false) -> Binding<Bool> {
        Binding<Bool>(
            get: { self.wrappedValue ?? defaultValue },
            set: { self.wrappedValue = $0 }
        )
    }
}


