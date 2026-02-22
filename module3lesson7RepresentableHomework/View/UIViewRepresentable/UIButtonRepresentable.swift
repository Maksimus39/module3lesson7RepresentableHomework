import SwiftUI

struct UIButtonRepresentable: UIViewRepresentable {
    let title: String
    let action: () -> Void
  
    final class Coordinator: NSObject {
        let action: () -> Void
        
        init(action: @escaping () -> Void) {
            self.action = action
        }
        
        @objc func buttonTapped() {
            action()
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(action: action)
    }
    
    func makeUIView(context: Context) -> UIButton {
        {
            $0.setTitle(title, for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.backgroundColor = .buttoncolor
            $0.layer.cornerRadius = 20
            
            $0.addTarget(
                context.coordinator,
                action: #selector(Coordinator.buttonTapped),
                for: .touchUpInside
            )
            
            return $0
        }(UIButton())
    }
    
    func updateUIView(_ uiView: UIButton, context: Context) {
        uiView.setTitle(title, for: .normal)
    }
}
