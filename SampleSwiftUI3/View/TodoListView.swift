//
//  todoListView.swift
//  SampleSwiftUI3
//
//  Created by yusaku maki on 2023/10/03.
//

import SwiftUI
import SwiftData

struct TodoListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var todoList: [TodoEntity]
    @State var statusList: [TodoStatus] = TodoStatus.allCases
    @State var text: String = ""

    var body: some View {
        VStack {
            VStack {
                TextField(
                    "TODO Title",
                    text: self.$text,
                    axis: .vertical
                )
                .padding()
                .frame(minHeight: 40)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1.0)
                )
                Button(action: addTodo) {
                    Text("Add")
                        .frame(height: 40)
                        .frame(maxWidth: .infinity)
                        .background(Color.mint)
                        .foregroundColor(.white)
                        .cornerRadius(8.0)
                }
            }
            .padding()
            List {
                ForEach(todoList) { entity in
                    HStack {
                        Text(entity.text)
                        Spacer()
                        ForEach(statusList) { status in
                            Button {
                                updateStatus(entity, status: status)
                            } label: {
                                Text(status.title)
                                    .font(.caption)
                                    .bold(entity.status == status)
                                    .foregroundColor(entity.status == status ? Color.mint : Color.primary)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                }
                .onDelete(perform: deleteTodo)
            }
        }
        .navigationTitle("TODO List")
    }

    private func addTodo() {
        withAnimation {
            let newValue = TodoEntity(text: text)
            modelContext.insert(newValue)
        }
    }

    private func updateStatus(_ entity: TodoEntity, status: TodoStatus) {
        withAnimation {
            if entity.status == status { return }
            entity.status = status
            do {
                try modelContext.save()
            } catch let error {
                print(error.localizedDescription.debugDescription)
            }
        }
    }

    private func deleteTodo(indexSet: IndexSet) {
        withAnimation {
            indexSet.forEach { index in
                let entity = todoList[index]
                modelContext.delete(entity)
            }
        }
    }
}

#Preview {
    TodoListView()
        .modelContainer(for: TodoEntity.self, inMemory: true)
        .environment(\.locale, .init(identifier: "ja"))
}
