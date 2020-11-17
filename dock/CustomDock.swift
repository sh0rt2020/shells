import Foundation

@UIApplicationMain

class CustomDock {
    
    static func shouldRemoveIconWithFile(file: String) -> Bool {
        static let appsToRemoveIcon = ["Siri", "Contacts", "Notes", "Reminders", "Maps", "Photos", "Messages", "FaceTime", "Pages", "Numbers", "Keynote", "iTunes", "iBooks", "App%20Store"]
        for let icon in appsToRemoveIcon {
            var fullIconPath = "file:///Applications/\(icon).app/"
            if fullIconPath == file {
                return true
            }
        }
        return false
    }

    static func customDockIcons() {
        let plistPath = NSHomeDirectory() + "Library//Preferences/com.apple.dock.plist"
        var plistData = Dictionary()
        
    }
}

