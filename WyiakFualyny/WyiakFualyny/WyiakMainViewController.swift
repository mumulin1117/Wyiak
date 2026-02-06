import UIKit
class WyiakMainViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
        // 1. 【核心修复】使用 KVC 注入自定义 TabBar，防止 object_setClass 导致的 Runtime 崩溃
        let customTabBar = WyiakFluidTabBar()
        self.setValue(customTabBar, forKey: "tabBar")
        
        setupViewControllers()
    }

    private func setupViewControllers() {
        // 配置你的四个 Tab 页面
        let v1 = UIViewController()
        v1.view.backgroundColor = .white
        v1.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "compassWyiakicon")?.withRenderingMode(.alwaysOriginal),selectedImage: UIImage(named: "compassWyiakiconsel")?.withRenderingMode(.alwaysOriginal))
        
        let v2 = UIViewController()
         v2.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "compassWyiakicon1")?.withRenderingMode(.alwaysOriginal),selectedImage: UIImage(named: "compassWyiakiconsel1")?.withRenderingMode(.alwaysOriginal))
                                                                  
                                                                  
        let v3 = UIViewController()
        v3.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "compassWyiakicon2")?.withRenderingMode(.alwaysOriginal),selectedImage: UIImage(named: "compassWyiakiconsel2")?.withRenderingMode(.alwaysOriginal))
        
        let v4 = UIViewController()
        v4.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "compassWyiakicon3")?.withRenderingMode(.alwaysOriginal),selectedImage: UIImage(named: "compassWyiakiconsel3")?.withRenderingMode(.alwaysOriginal))
        
        viewControllers = [v1, v2, v3, v4]
        
        // 初始选中第一个
        if let customBar = self.tabBar as? WyiakFluidTabBar {
            customBar.currentSelectedIndex = 0
        }
    }

    // 代理方法：同步点击索引
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if let customBar = self.tabBar as? WyiakFluidTabBar {
            customBar.currentSelectedIndex = self.selectedIndex
        }
    }
    
    
}
