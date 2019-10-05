import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    /*
     
     TODO:
        Динамический размер ячейки от контента
        refresherControl (Чисто для красоты)
        Action Sheets по тз
        Добавление поста
            Добавление фоток
                Фотки с камеры
                Фотки с галлереи
            Добавление текста
        (Опционально) Переделать панельку с фотками на главной странице
     
     */

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {

        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {

    }
}

