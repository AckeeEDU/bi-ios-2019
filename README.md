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

