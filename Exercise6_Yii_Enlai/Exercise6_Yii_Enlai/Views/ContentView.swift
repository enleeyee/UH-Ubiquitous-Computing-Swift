//
//  ContentView.swift
//  Exercise6_Yii_Enlai
//
//  Created by Enlai Yii on 10/11/24.
//

import SwiftUI

struct CustomColor {
    static let LightBlue = Color("LightBlue")
}

struct ContentView: View {
    @State private var searchText = ""
    @State private var transactions: [Transactions] = []
    
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?

    var filteredTransactions: [Transactions] {
        if searchText.isEmpty {
            return transactions
        } else {
            return transactions.map { transaction in
                let filteredEntries = transaction.entries.filter {
                    $0.title.lowercased().contains(searchText.lowercased())
                }
                return Transactions(date: transaction.date, entries: filteredEntries)
            }
            .filter { !$0.entries.isEmpty } // Only return transactions with non-empty filtered entries
        }
    }

    var body: some View {
        NavigationView {
            VStack {
                searchBar
                transactionList
            }
            .navigationTitle("Transactions")
            .background(backgroundColor)
            .onAppear {
                Task {
                    await loadData()
                }
            }
        }
    }

    // Computed property to handle dynamic background color
    private var backgroundColor: Color {
        if verticalSizeClass == .regular {
            // Portrait mode
            return Color(red: 242/255, green: 242/255, blue: 247/255)
        } else {
            // Landscape mode
            return Color(red: 250/255, green: 250/255, blue: 253/255) // Example color for landscape
        }
    }

    // Search Bar as a separate view
    private var searchBar: some View {
        TextField(
            "\(Image(systemName: "magnifyingglass")) Search",
            text: $searchText
        )
        .padding(10)
        .background(Color(.systemGray5))
        .cornerRadius(8)
        .padding(.horizontal)
    }

    // Transaction List as a separate view
    private var transactionList: some View {
        List {
            ForEach(filteredTransactions, id: \.date) { transaction in
                Section(header: Text(transaction.date).font(.headline)) {
                    ForEach(transaction.entries, id: \.title) { entry in
                        HStack {
                            NavigationLink(destination: TransactionDetailView(date: transaction.date, entry: entry)) {
                                transactionRow(for: entry)
                            }
                        }
                    }
                    .onDelete { indexSet in
                        deleteTransaction(at: indexSet, in: transaction)
                    }
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
    }

    // Function to delete a transaction
    private func deleteTransaction(at offsets: IndexSet, in transaction: Transactions) {
        guard let index = transactions.firstIndex(where: { $0.date == transaction.date }) else { return }
        for offset in offsets {
            transactions[index].entries.remove(at: offset)
        }
        // If all entries for a given date are deleted, remove the entire section
        if transactions[index].entries.isEmpty {
            transactions.remove(at: index)
        }
    }

    // A helper function for each row
    private func transactionRow(for entry: Entry) -> some View {
        HStack {
            AsyncImage(url: URL(string: entry.logo)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: 40, height: 40)
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                case .failure:
                    Image(systemName: "xmark.circle")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.red)
                @unknown default:
                    EmptyView()
                }
            }
            .padding(.trailing, 10)

            VStack(alignment: .leading) {
                Text(entry.title)
                    .bold()
                    .font(.system(size: 15))
                    .foregroundStyle(Color(.black))
            }

            Spacer()

            Text(entry.amount)
                .font(.headline)
                .foregroundStyle(Color.blue)
        }
        .padding(.vertical, 5)
        .frame(maxWidth: .infinity, maxHeight: 50)
    }
    // Load the JSON data from the API
    func loadData() async {
        guard let url = URL(string: "https://m.cpl.uh.edu/courses/ubicomp/fall2022/webservice/transactions/transactions_map.json") else {
            print("Invalid URL")
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let jsonDecoder = JSONDecoder()
            let res = try jsonDecoder.decode(TransactionData.self, from: data)
            await MainActor.run {
                transactions = res.transactions
            }
        } catch {
            print("Error trying to decode JSON object: \(error.localizedDescription)")
        }
    }
    
    func deleteTransaction(at offsets: IndexSet) {
        transactions.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
