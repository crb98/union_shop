# Union Shop - Marking Criteria Table

## Functionality Requirements Sorted by Difficulty

| Feature | Description | Marks (%) | Reference |
|---------|-------------|-----------|-----------|
| **BASIC FUNCTIONALITY (30% total)** |
| Static Homepage | Homepage layout with hero section and static content | 5% | [Homepage](https://shop.upsu.net/) |
| Navigation | Top navigation bar with menu items and routing | 5% | [Homepage](https://shop.upsu.net/) |
| About Us Page | Static content page with company information | 3% | [About Us](https://shop.upsu.net/pages/about-us) |
| Footer Content | Footer with social links, opening hours, and information | 4% | [Homepage](https://shop.upsu.net/) |
| Collections Overview | Grid display of all collections (hardcoded data acceptable) | 4% | [Collections](https://shop.upsu.net/collections/) |
| Collection Overview | Grid display of all items within each collection (hardcoded data acceptable) | 4% | [Collection Example](https://shop.upsu.net/collections/clothing-2) |
| Product Display | Product page showing image, name, and price (hardcoded data acceptable) | 5% | [Product Exmple](https://shop.upsu.net/collections/clothing-2/products/classic-hoodie) |
| **INTERMEDIATE FUNCTIONALITY (45% total)** |
| Dynamic Collections | Collections overview populated from data models or services | 5% | [Collections](https://shop.upsu.net/collections/) |
| Dynamic Product Listings | Product listings within collections populated from data models or services | 8% | [Collection Example](https://shop.upsu.net/collections/autumn-favourites) |
| Individual Product Pages | Product detail pages with images, descriptions, and information | 10% | [Product Example](https://shop.upsu.net/collections/autumn-favourites/products/classic-sweatshirt-1) |
| Shopping Cart UI | Add items to cart, view cart contents, cart interface | 8% | [Cart](https://shop.upsu.net/cart) |
| Authentication UI | Login/signup forms and authentication interface (UI only) | 4% | [Sign In](https://shopify.com/authentication/22645997643/login) |
| Sale Collection | Sale items with discount display and promotional messaging | 4% | [Sale Items](https://shop.upsu.net/collections/sale-items) |
| Print Shack Forms UI | Dynamic form interface with changing input fields (UI only) | 3% | [Personalisation](https://shop.upsu.net/products/personalise-text) |
| Image Gallery & Zoom | Product image thumbnails with hover zoom functionality | 3% | [Product Example](https://shop.upsu.net/collections/autumn-favourites/products/classic-sweatshirt-1) |
| **ADVANCED FUNCTIONALITY (25% total)** |
| Authentication System | Full user authentication, session management, account dashboard | 8% | [Account](https://shopify.com/22645997643/account/orders) |
| Data Management | Product filtering, sorting, variants, dynamic data handling | 7% | [Autumn Favourites](https://shop.upsu.net/collections/autumn-favourites) |
| Cart Management | Full cart functionality - quantity editing, removal, calculations, persistence | 6% | [Cart](https://shop.upsu.net/cart) |
| Search System | Complete search functionality with multiple access points and results | 4% | [Search](https://shop.upsu.net/search) |

## Additional Considerations

### Bonus Features (Not required but can earn extra credit)
- Pagination on collection pages
- Social sharing buttons
- Email newsletter signup
- Size guide functionality
- Order notes in cart
- Mobile hamburger menu
- Cart badge with item count

### Technical Implementation Notes
- Focus on functionality over visual design
- External integrations (Shopify auth, payment systems) not required
- **Basic Level**: Hardcoded data* acceptable for collections and products
- **Intermediate Level**: UI implementation focus, data can be simulated
- **Advanced Level**: Full functionality with proper data management and state handling

### Terminology
**Hardcoded data*** = Data that is written directly into your Flutter code (e.g., creating List<Product> with fixed values in your Dart files) rather than loading from external sources like APIs, databases, or JSON files.

### Mark Distribution Summary
- **Basic (30%)**: Essential pages, navigation, static content (hardcoded data* acceptable)
- **Intermediate (45%)**: Core e-commerce UI and dynamic content from data models/services
- **Advanced (25%)**: Complete systems with full functionality and data management

**Total: 100%**