//
//  ContentView.swift
//  Exercise5_Yii_Enlai
//
//  Created by Enlai Yii on 10/8/24.
//

import SwiftUI

struct CustomColor {
    static let LightBlue = Color("LightBlue")
}

struct ContentView: View {
    @State private var searchText = ""
    @State private var transactions: [Transactions] = []

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
            .background(Color(red: 242/255, green: 242/255, blue: 247/255))
            .onAppear {
                Task {
                    await loadData()
                }
            }
        }
    }

    // Search Bar as a separate view
    private var searchBar: some View {
        TextField(
            "\(Image(systemName: "magnifyingglass")) Search",
            text: $searchText
        )
        .padding(10)
        .background(Color(.systemGray6))
        .cornerRadius(8)
        .padding(.horizontal)
    }

    // Transaction List as a separate view
    private var transactionList: some View {
        List {
            ForEach(filteredTransactions, id: \.date) { transaction in
                Section(header: Text(transaction.date).font(.headline)) {
                    ForEach(transaction.entries, id: \.title) { entry in
                        NavigationLink(destination: TransactionDetailView(entry: entry)) {
                            transactionRow(for: entry)
                        }
                    }
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
    }

    // A helper function for each row
    private func transactionRow(for entry: Entry) -> some View {
        HStack {
            AsyncImage(url: URL(string: entry.logo)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 40, height: 40)
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
        guard let url = URL(string: "https://m.cpl.uh.edu/courses/ubicomp/fall2022/webservice/transactions/transactions.json") else {
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
}

#Preview {
    ContentView()
}
