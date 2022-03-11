import SwiftUI

@main
struct AppDelegateUI: App {

    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            EmptyView()
                .onAppear {
                    setupWindow()
                }
        }
    }
    
    private func setupWindow() {
        let window = UIApplication.shared.window
        let mainViewController = BaseViewController(rootView: FirstScreen())
        mainViewController.title = "First Screen"
        let mainNavigationController = UINavigationController()
        mainNavigationController.viewControllers = [mainViewController]
        window?.rootViewController = mainNavigationController
        window?.makeKeyAndVisible()
    }
}

// MARK: AppDelegate
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        AppComponent.setup()
        return true
    }
    
}

/*
 
 `  `  -  .  _
        '  _                  `            .
         .     -  .  .  .  . - '             .
                                              `.
            ` .  .         .  .  .  .           .
                                                  `
                  . - .                   '         `.           .nMf
                 .      `               '  iXMMMMMM            .MMMM
            ..       ..
         .        :MM XM
             "MMM> <MMMMMi  !MMMMMMMM',MMMMMMMMMMMMMX  `   .MMf xM'
              `?MM.`MMMMMMMX.MMMMMMMhHMMMMMMMMMMMMMMM<MM  :MMP .MM
                `Mh ?MMMMMMMMMMMMMMMMMP""""?MMMMMMMMMMMf 4MMM  MM>
                  Mh ?MMMP`""MMMMMMMMM'.d$$Nu.`?MMMMMMM  MMMf dMM>
                   "k MMP e$b.'?MMMMf u$$$$$$$b `MMMMMMMM`MM  `MM>
                    ?  M d$$$$b.`MMM '$$$$$$$$$b 'MMMMMMM 'M <  ML
                     \ 4 3$$$$$$b`MX $F""$$$$$$$  MMMMMMMM  \dk 4M
                    . . L'$$F   $ `X $    $$$$$E 4MMMMMMMMM. "f MMk
               .x*""` .dM. ?$ouu$ 'M "$ed$$$$$$ '" .:dMMMMMM. ?MMMMr
              MM>4  xMMMhx. `?$$$ 4MM ?$$$$$P  xMMMMMMMMMMMMM  MMMMP
              ?MM> MMMMMMMMMMMn  dMMMMx`?$".dMMMMMMMMMMMM???M>
                   'MP""""""""` HMMMMMMM~.dMMMMMMMMP"" .r xMM
                   """?MMMMMMMMMMMf 4MMM  MM>      d$ JMf MMM .
                  MM 'M :M '  MMMMMMMMMMMMnnndM"  d$F MM  4M  M:
                .MMMM  .MM  L 4MMMMMMMMP"MMP" .z$ $$k MM> 'M 4MM:
               .MMMMP .MMM  $r'MMMMMMP  ` .zd$$$$ $$k MMX  ? 4MMM:
              MMMMMf XMMMf 4$$ 'MMMM  $$$ 3$$$$$$k""  4MM.   'MMMMh
            .MMMMP  dMMMM   ^" o "" u$$$$ 4??""        MMMr  `MMMMMM:
           dMMMMf :MMMMM"                         ...; 'MMM:  `MMMMMML
         xMMMMP" :MMMMMf               ..;;;  .i!!!!!!!  MMMM   "MMMMMM:
       xMMMMMf  :MMMP""             <!!!!!` !!!!!!!'`  r MMMMh   `MMMMMMh
     :MMMMMP   xMMM".u.          :!!!!!!!!i!!''` .u  $$F MMMMMh    ?MMMMMMx
   .dMMMMM"   XMMP  $$$$h .     '''''''```  .ue$$$$R $F.MMMMMMMM    ?MMMMMMM
  MMMMMMM     MMM. '?$$$'J$$$$$$bbr.d$$$$$$;4$$$$$$$  :MMMMMMMMM     MMMMMMM
  MMMMMP     MMMMMMM:  " $$$$$$$$$'8$$$$$$$k`$$$P" .nMMMMMMMMMMM     MMMMMMM
  MMMMM      MMMMMMMMMMn:. `"???$$ $$$$$????'" .xdMMMMMMMMMMMMM"     MMMMMMM
  MMMM'     `MMMMMMMMMMMMMMMMnn...........ndMMMMMMMMMMMMMMMMMM       MMMMMMM
  MMMM      `MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM"       XMMMMMMM
  MMMM       MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM"        nMMMMMMMM
  MMMMk      `MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMP"          MMMMMMMMMM
  MMMMMM.      "MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMP"            uMMMMMMMMMMM
  MMMMMMMM.      `""MMMMMMMMMMMMMMMMMMMMMMMMMP""             .dMMMMMMMMMMMMM
  MMMMMMMMMh:         `""""???MMMMMMMPP"""                .nMMMMMMMMMMMMMMMM
  MMMMMMMMMMMMx.                                      .xMMMMMMMMMMMMMMMMMMMM
  MMMMMMMMMMMMMMMr                                :dMMMMMMMMMMMMMMMMMMMMMMMM
  MMMMMMMMMMMP"`                         ..:nnMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
  MMMMMMM""                  ...xnnnnHMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
  MMMM"         ....ndMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
  MMM     xnMMMM""`"""MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
  MMM   'MMMMMM     n  'MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
  MMM.   "?MMMMMh:.xM>  :MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
  MMMMMn    '""???""   :MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
  MMMMMMMMhnx.......nHMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
 */
