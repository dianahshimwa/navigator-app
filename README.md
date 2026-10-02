# Product Navigation App

A Flutter app that shows a list of products. Tapping a product opens its details page, and the back button returns to the home page.

# Team Members

1. Dianah Shimwa Gasasira
2. Benjamin Kettey-Tagoe
3. Boaz Iza

## Features

- Product list with five products (Pixel, Laptop, Tablet, Pendrive, Floppy Drive)
- Each item shows a colored label box, name, description, price, and star rating
- Tap any product to open its details page
- Back navigation via the AppBar arrow or the device back button
- Interactive 3-star rating on both the list and details pages

## Screens

| Home (Product List) | Product Details |
|---|---|
| List of products in cards | Large color banner, name, description, price, rating |

## Project Structure

```
lib/
└── main.dart
    ├── MyApp               # App entry, theme, home route
    ├── Product             # Data model
    ├── products            # Product list (data)
    ├── ProductListPage     # Home page with ListView.builder
    ├── ProductBox          # List item card
    ├── ColorBox            # Reusable colored label box
    ├── ProductDetailsPage  # Details page
    └── RatingBox           # Stateful 3-star rating widget
```

## Getting Started

### Prerequisites
- Flutter SDK (3.x)
- An Android emulator, a physical device, or Chrome

### Run the app
```bash
git clone <repo-url>
cd product_navigation
flutter pub get
flutter run
```

To run in Chrome:
```bash
flutter run -d chrome
```

## How It Works

- **Navigation:** `Navigator.push` with `MaterialPageRoute` opens `ProductDetailsPage` and passes in the tapped product. The AppBar adds a back arrow automatically, which pops back to the home page.
- **List:** `ListView.builder` builds items on demand from the `products` list.
- **Reusability:** `ColorBox` is used both as the small box in the list and as the large banner on the details page.
- **State:** `RatingBox` is a `StatefulWidget`. Tapping a star calls `setState` to update the rating.

## Team Members & Contributions

| Member | Contribution |
|---|---|
| Benjamin | Imports, app setup, Product model and data, product list page, list items (ProductBox) |
| Dianah | ColorBox widget and Product Details page |
| Boaz | Star rating (RatingBox) |

## Demo Video
