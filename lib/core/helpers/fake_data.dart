import 'dart:math';

import 'package:faker_dart/faker_dart.dart';
import 'package:petcure_delivery_app/core/models/cart_item.dart';
import 'package:petcure_delivery_app/core/models/order.dart';
import 'package:petcure_delivery_app/core/models/product.dart';

class FakeData {
  static final Faker _faker = Faker.instance;

  static List<Product> generateFakeProducts({int count = 20}) {
    final Random random = Random();
    final List<Product> products = [];

    // Map of pet categories and subcategories as provided
    final Map<String, List<String>> petCategories = {
      'Animal': ['Dog', 'Cat', 'Rabbit', 'Cow', 'Goat', 'Others'],
      'Bird': ['Parrot', 'Chicken', 'Duck', 'Quail', 'Lovebird', 'Others'],
      'Reptile': ['Snake', 'Lizard', 'Turtle', 'Tortoise', 'Iguana', 'Others'],
      'Amphibian': ['Frog', 'Toad', 'Salamander', 'Others'],
    };

    // Product categories for each subcategory
    final Map<String, List<String>> productCategories = {
      // Animal products
      'Dog': [
        'Food',
        'Toy',
        'Collar',
        'Leash',
        'Bed',
        'Shampoo',
        'Treat',
        'Bowl',
        'Harness',
      ],
      'Cat': [
        'Food',
        'Toy',
        'Scratching Post',
        'Litter',
        'Bed',
        'Treat',
        'Carrier',
        'Tree',
      ],
      'Rabbit': [
        'Food',
        'Hutch',
        'Toy',
        'Bedding',
        'Treat',
        'Water Bottle',
        'Hay Feeder',
      ],
      'Cow': ['Feed', 'Mineral Block', 'Brush', 'Milking Equipment', 'Halter'],
      'Goat': ['Feed', 'Mineral Block', 'Brush', 'Milking Equipment', 'Halter'],
      // Bird products
      'Parrot': ['Food', 'Cage', 'Perch', 'Toy', 'Treat', 'Mineral Block'],
      'Chicken': ['Feed', 'Coop', 'Nesting Box', 'Poultry Grit', 'Feeder'],
      'Duck': ['Feed', 'Pond', 'Nesting Box', 'Poultry Grit', 'Feeder'],
      'Quail': ['Feed', 'Cage', 'Nesting Box', 'Poultry Grit', 'Feeder'],
      'Lovebird': ['Food', 'Cage', 'Perch', 'Toy', 'Treat', 'Mineral Block'],
      // Reptile products
      'Snake': [
        'Food',
        'Terrarium',
        'Heating Lamp',
        'Hideout',
        'Substrate',
        'Water Bowl',
      ],
      'Lizard': [
        'Food',
        'Terrarium',
        'Heating Lamp',
        'UVB Light',
        'Hideout',
        'Substrate',
      ],
      'Turtle': ['Food', 'Tank', 'Basking Platform', 'Water Filter', 'Heater'],
      'Tortoise': ['Food', 'Enclosure', 'Heating Lamp', 'Hideout', 'Substrate'],
      'Iguana': [
        'Food',
        'Terrarium',
        'Heating Lamp',
        'Climbing Branch',
        'UVB Light',
      ],
      // Amphibian products
      'Frog': [
        'Food',
        'Terrarium',
        'Water Conditioner',
        'Hideout',
        'Substrate',
        'Mister',
      ],
      'Toad': [
        'Food',
        'Terrarium',
        'Water Conditioner',
        'Hideout',
        'Substrate',
        'Mister',
      ],
      'Salamander': [
        'Food',
        'Terrarium',
        'Water Conditioner',
        'Hideout',
        'Substrate',
        'Mister',
      ],
      // Default for "Others" in each category
      'Others': ['Food', 'Habitat', 'Toy', 'Care Kit', 'Grooming Supplies'],
    };

    // Product adjectives for more interesting names
    final List<String> adjectives = [
      'Premium',
      'Deluxe',
      'Eco-Friendly',
      'Organic',
      'Natural',
      'Super',
      'Ultra',
      'Advanced',
      'Professional',
      'Luxury',
    ];

    // Quantity units
    final List<String> quantityUnits = [
      'kg',
      'g',
      'lb',
      'pack',
      'piece',
      'bottle',
      'bag',
    ];

    // Generate random products
    for (int i = 0; i < count; i++) {
      // Select random category and subcategory
      final List<String> categories = petCategories.keys.toList();
      final String petCategory = categories[random.nextInt(categories.length)];
      final List<String> subCategories = petCategories[petCategory]!;
      final String petSubCategory =
          subCategories[random.nextInt(subCategories.length)];

      // Get product category based on subcategory
      final String productCategory = productCategories[petSubCategory] != null
          ? productCategories[petSubCategory]![random.nextInt(
              productCategories[petSubCategory]!.length,
            )]
          : productCategories['Others']![random.nextInt(
              productCategories['Others']!.length,
            )];

      // Generate product name
      final String adjective = adjectives[random.nextInt(adjectives.length)];
      final String productName = '$adjective $petSubCategory $productCategory';

      // Generate product description
      final String productDescription =
          'High-quality $productCategory specially designed for $petSubCategory. '
          'Made with premium materials to ensure your pet\'s health and happiness.';

      // Generate price (between 5 and 200)
      final double price = 5.0 + random.nextDouble() * 195.0;

      // Generate quantity (between 1 and 20 with random unit)
      final int quantityValue = 1 + random.nextInt(20);
      final String quantityUnit =
          quantityUnits[random.nextInt(quantityUnits.length)];
      final String quantity = '$quantityValue $quantityUnit';

      // Generate image URLs (using placeholder service)
      final List<String> imageURLs = [
        'https://picsum.photos/300/300?random=$i&pet=${petSubCategory.toLowerCase()}',
        'https://picsum.photos/300/300?random=${i + 1000}&pet=${petSubCategory.toLowerCase()}',
      ];

      // Generate days to deliver (between 1 and 14 days)
      final int daysToDeliver = 1 + random.nextInt(14);

      products.add(
        Product(
          productID: 'prod_${i + 1}',
          productName: productName,
          productDescription: productDescription,
          petCategory: petCategory,
          petSubCategory: petSubCategory,
          productCategory: productCategory,
          price: double.parse(price.toStringAsFixed(2)),
          quantity: quantity,
          imageURLs: imageURLs,
          daysToDeliver: daysToDeliver,
        ),
      );
    }

    return products;
  }

  static List<CartItem> generateFakeCartItems({int count = 5}) {
    final Random random = Random();
    final List<Product> products = generateFakeProducts(count: count * 2);
    final List<CartItem> cartItems = [];
    final DateTime now = DateTime.now();

    for (int i = 0; i < count; i++) {
      // Get a random product
      final Product product = products[random.nextInt(products.length)];

      // Generate random quantity between 1 and 5
      final int quantity = 1 + random.nextInt(5);

      // Calculate delivery date based on product's daysToDeliver
      final DateTime deliveryDate = now.add(
        Duration(days: product.daysToDeliver),
      );

      cartItems.add(
        CartItem(
          product: product,
          quantity: quantity,
          productPrice: product.price * quantity,
          deliveryDate: deliveryDate,
        ),
      );
    }

    return cartItems;
  }

  static List<Order> generateFakeOrders({int count = 5}) {
    final Random random = Random();
    final List<Order> orders = [];

    final List<OrderDeliveryStatus> statuses = OrderDeliveryStatus.values;

    for (int i = 0; i < count; i++) {
      // Generate random cart items for the order
      final int itemCount = 1 + random.nextInt(5);
      final List<CartItem> orderedItems = generateFakeCartItems(
        count: itemCount,
      );

      // Calculate total rate
      final double totalRate = orderedItems.fold(0.0, (sum, item) {
        return sum + (item.productPrice * item.quantity);
      });

      // Calculate estimated delivery date (latest delivery date among items)
      final DateTime estimatedDeliveryDate = orderedItems
          .map((item) => item.deliveryDate)
          .reduce((a, b) => a.isAfter(b) ? a : b);

      // Select random status
      final OrderDeliveryStatus status =
          statuses[random.nextInt(statuses.length)];

      // Generate random user data using Faker
      final String randomUserName = _faker.name.fullName();
      final String userId =
          'user_${randomUserName.replaceAll(' ', '_').toLowerCase()}_${random.nextInt(1000)}';

      // Generate a formatted address string
      final address = _faker.address;
      final String addressString =
          '${address.streetAddress()}, ${address.city()}, ${address.state()} ${address.zipCode()}';
      final Location location = Location(
        latitude: address.latitude(),
        longitude: address.longitude(),
      );
      // Generate a proper Indian phone number format
      final String phoneNumber = _generateIndianPhoneNumber();

      orders.add(
        Order(
          orderId: 'ORD-${DateTime.now().millisecondsSinceEpoch}-${i + 1}',
          userId: userId,
          userName: randomUserName,
          address: addressString,
          phoneNumber: phoneNumber,
          location: location,
          orderDate: DateTime.now(),
          productsOrdered: orderedItems,
          totalRate: totalRate,
          orderDeliveryStatus: status,
          estimatedDeliveryDate: estimatedDeliveryDate,
        ),
      );
    }

    // Sort orders by date (most recent first)
    orders.sort((a, b) => b.orderDate.compareTo(a.orderDate));

    return orders;
  }

  static String _generateIndianPhoneNumber() {
    final Random random = Random();
    // Indian phone numbers start with 6,7,8,9 and are 10 digits total
    final List<String> prefixes = ['6', '7', '8', '9'];
    final String prefix = prefixes[random.nextInt(prefixes.length)];

    // Generate remaining 9 digits
    String remainingDigits = '';
    for (int i = 0; i < 9; i++) {
      remainingDigits += random.nextInt(10).toString();
    }

    return '+91 $prefix$remainingDigits';
  }
}
