import SwiftUI

@main
struct module3lesson7RepresentableHomeworkApp: App {
    @State  private var viewModel: CoreDataAppViewModel = CoreDataAppViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(viewModel)
        }
    }
}
