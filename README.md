# bi-ios-2019

## 1. Úvod
branch: není

- úvod do mobilního vývoje
- úvod do platformy iOS
- ukázka prostředí Xcode

## 2. Swift
branch: 01-swift

- Základní datové typy
- Optionals
- Kolekce
- Struktury, třídy, výčtový typ
- Reference
- Funkce, closures
- Extension, protokoly, delegáty
- Modifikátory přístupu
- Známé operátory a metody

## 3. Views
branch: 03-views

- [gitignore.io](https://www.gitignore.io) - užitečný nástroj pro generování .gitignore souborů
- App -> UIWindow -> rootViewController -> view -> subviews
- Views v Interface builderu (IB) - custom subclass, propojení do kódu (outlets, actions)
- Views v kódu - CGRect, addSubview(), removeFromSuperView()
- Frame vs. bounds [Frame vs Bounds in iOS - Suragch - Medium](https://medium.com/@suragch/frame-vs-bounds-in-ios-107990ad53ee)
- [Pixels vs. points](https://www.paintcodeapp.com/news/ultimate-guide-to-iphone-resolutions)

## 4. Autolayout
branch: 04-autolayout

- Autolayout v interface builderu
- UIStackView (allignment, distribution) 
- `intrinsicContentSize`, `contentHugging` a `contentCompressionResistance`
- Autolayout v kódu (NSLayoutConstraint a `translatesAutoresizingMaskIntoConstraints`)
- `additionalSafeAreaInsets`
- Úprava constraints v runtime (update constant)
- Jednoduché animování autolayoutu
- [https://www.wtfautolayout.com](https://www.wtfautolayout.com) – vizualizace logu rozbitých constraints

## 5. Actions, Recognizers, Closures and Viewmodel separation
branch: 05-recognizers

- Handling IBActions and setting UIControl actions with code and IB
- Handling Tap,Pan,PicnhGestures
- Manipulationg UIControls and getting values out of it
- Showing and fixing common memory leaks with closures
- Delegating responsibility with closures

## 6. Architecture
branch: 06-architecture

- Showing differences between mvvm and mvc
- Code testability and data mocking
- Dependency injection, view model separation 
- different views for viewmodel
- different viewmodels for view

## 7. View controllers
branch: 07-controllers

- `UIViewController`
    - introduction, WTF View Controller
    - lifecycle methods
    - memory warnings
    - containment
        - child view controllers
        - UIContainerView
    - presentation
        - segues
        - present modal view controller
- `TabBarController`
    - usage
    - storyboard setup
    - programmatic setup
    - configuration
    - UITabBarItem
    - delegate methods
- `UINavigationController`
    - usage
    - storyboard setup
    - programmatic setup
    - configuration
    - UINavigationItem
    - delegate methods
    - viewControllers stack
    - set/push/pop methods
- `UIPageViewController, UIAlertController`

## 8. ScrollViews
branch: 08-scrollviews

- `UIScrollView`
    - základní scrollovací komponenta
    -  jednoduché na použití vhodné pro menší datové sety
- `UITableView`
    - jednosloupcový seznam položek
    - vhodné i pro velké data sety
    - umí reusovat jednotlivé buňky
    - built-in swipe to delete a reorder řádků
    - využívá data source a delegate pattern pro získání dat a informování o akcích uživatele
- `UICollectionView`
    - layout buněk závisí na layout objectu, který je předán v initu
    - základní `UICollectionViewFlowLayout` - n sloupcový seznam
    - využívá stejný data source a delegate pattern jako `UITableView` + navíc jeho layout může mít vlastní delegate protocol (např. `UICollectionViewFlowLayout` má `UICollectionViewDelegateFlowLayout`)
- `DiffableDataSource`
    - od iOS 13 nový přístup k plnění `UITableView` a `UICollectionView` daty
    - pracuje na bázi snapshotů - chci naplnit view daty ➡️ vytvořím snapshot ➡️ data source snapshot aplikuje
    - je nutné, aby modelové objekty implementovaly `Hashable` ➡️ data source využívá hashovanou hodnotu pro výpočet změn, které je třeba aplikovat při změně snapshotu

## 9. MapKit & Location
branch: `09-maps`

- frameworky MapKit a CoreLocation
- `MKMapView`
- `CLLocationManager`
  - získání povolení od uživatele (`NSLocationWhenInUseUsageDescription` v Info.plist)
  - start/stop získávání pozice
  - `CLLocationManagerDelegate`
- protokol `MKAnnotation`
- správa pinů na mapě, custom piny
- callouts
- geocoding/reverse geocoding - překlad GPS lokace na adresu a zpět

## 10. Networking

`TODO`

## 11. CoreData

`TODO`

## 12. SwiftUI
branch: `12-swift-ui`

- ukázka nového přístupu k UI od iOS 13
- obsahuje 2 example projekty 
    1. **SwiftUIExampleLesson** tak jak byl  prezentován na cviku
    2. **SwiftUIExample** obsahuje nějaké drobnosti pro inspiraci navíc