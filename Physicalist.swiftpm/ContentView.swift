import SwiftUI
import SpriteKit

struct ContentView: View {
    
    let scene = SKScene(fileNamed: "FirstScreen")
    
    var body: some View {
        
        VStack{
            if let scene {
                SpriteView(scene: scene)
            }
        }.ignoresSafeArea()
    }
}
