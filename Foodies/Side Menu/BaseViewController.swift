//
//  BaseViewController.swift
//  Foodies
//
//  Created by Mehmet Kerim ÖZEK on 14.11.2022.
//

import UIKit
import SideTown

class BaseViewController: UIViewController {
    private var sideMenu: SideMenu!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // custom menu view inside side menu
        let menuView = UIView(frame: CGRect(x: 0,
                                              y: 0,
                                              width: 280,
                                              height: UIScreen.main.bounds.height))
        menuView.backgroundColor = .red
                        
        // side menu
        let config: MenuConfig = .init(vc: self, customView: menuView)
        sideMenu = SideMenu(config)
    }
    
    func openMenu() {
        sideMenu.openMenu()
    }
    
    func closeMenu() {
        sideMenu.closeMenu()
    }
    
    func toggleMenu() {
        sideMenu.toggleMenu()
    }
 }
