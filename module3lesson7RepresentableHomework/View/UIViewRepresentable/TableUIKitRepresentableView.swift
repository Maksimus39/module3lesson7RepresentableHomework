import SwiftUI

struct TableUIKitRepresentableView: UIViewRepresentable {
    let identifierCell: String = "representableTableViewCell"
    @Environment(CoreDataAppViewModel.self) var viewModel
    
    class Coordinator: NSObject, UITableViewDataSource {
        var parent: TableUIKitRepresentableView
        
        init(_ parent: TableUIKitRepresentableView) {
            self.parent = parent
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            parent.viewModel.news.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: parent.identifierCell, for: indexPath)
            
            let newsItem = parent.viewModel.news[indexPath.row]
            
            var config = cell.defaultContentConfiguration()
            config.text = newsItem.text
            config.textProperties.font = .systemFont(ofSize: 13)
            config.textProperties.numberOfLines = 0
            
            if let image = UIImage(named: newsItem.image) {
                config.image = image
                config.imageProperties.maximumSize = CGSize(width: 78, height: 79)
                config.imageProperties.cornerRadius = 11
            }
            
            cell.contentConfiguration = config
            cell.accessoryType = .disclosureIndicator  // <- оставил для возможной навигации
            
            return cell
        }
        
        func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            parent.viewModel.title
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UITableView {
        {
            $0.dataSource = context.coordinator
            $0.register(UITableViewCell.self, forCellReuseIdentifier: identifierCell)
            $0.backgroundColor = .systemBackground
            return $0
        } (UITableView(frame: .zero, style: .plain))
    }
        
        func updateUIView(_ uiView: UITableView, context: Context) {
            uiView.reloadData()
        }
    }

#Preview {
    TableUIKitRepresentableView()
        .environment(CoreDataAppViewModel())
}
