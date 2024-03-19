import '/core/constants/constants.dart';

final List<Map<String, dynamic>> products = [
  {
    'id': '0',
    'company': 'Nike',
    'companyLogoUrl': Constants.brand6,
    'data': [
      {
        'id': 001,
        'title': 'Air Jordan 1 Retro High OG "Chicago"',
        'model': 'Air Jordan 1',
        'color': 'Red, White, Black',
        'price': 44.5,
        'imageUrl': Constants.nike1, // Update with actual image URL
        'sizes': [9, 10, 11, 12],
        'isFavourite': true,
        'isNewarrival': false,
        'description':
            'The iconic Air Jordan 1 returns in the original "Chicago" colorway. Featuring a premium leather upper and classic design lines, this shoe is a must-have for any Jordan fan.'
      },
      {
        'id': 002,
        'title': 'Nike Blazer Mid 77 Vintage "White"',
        'model': 'Blazer Mid 77',
        'color': 'White',
        'price': 44.5,
        'imageUrl': Constants.nike2, // Update with actual image URL
        'sizes': [9, 10, 11, 12],
        'isFavourite': true,
        'isNewarrival': true,
        'description':
            'A timeless classic, the Nike Blazer Mid 77 Vintage features a clean white leather upper and a vulcanized sole for a comfortable and stylish look.'
      },
      {
        'id': 003,
        'title': 'Nike Air Max 90 "Neon"',
        'model': 'Air Max 90',
        'color': 'Black, Neon Green, Neon Pink',
        'price': 44.5,
        'imageUrl': Constants.nike3, // Update with actual image URL
        'sizes': [9, 10, 11, 12],
        'isFavourite': false,
        'isNewarrival': false,
        'description':
            'The Nike Air Max 90 features a visible Max Air unit in the heel for cushioning and a bold colorway for a standout look.'
      },
      {
        'id': 004,
        'title': 'Nike Zoom Pegasus 39 "Black"',
        'model': 'Zoom Pegasus 39',
        'color': 'Black',
        'price': 44.5,
        'imageUrl': Constants.nike4, // Update with actual image URL
        'sizes': [9, 10, 11, 12],
        'isFavourite': false,
        'isNewarrival': true,
        'description':
            'The Nike Zoom Pegasus 39 is a lightweight running shoe designed for comfort and performance. It features a breathable upper and a responsive Zoom Air unit in the forefoot.'
      },
      {
        'id': 005,
        'title': 'Nike Air Force 1 Low "White"',
        'model': 'Air Force 1 Low',
        'color': 'White',
        'price': 44.5,
        'imageUrl': Constants.nike5, // Update with actual image URL
        'sizes': [9, 10, 11, 12],
        'isFavourite': false,
        'isNewarrival': false,
        'description':
            'A cultural icon, the Nike Air Force 1 Low features a clean white leather upper and a classic cupsole construction for a timeless look.'
      },
      {
        'id': 006,
        'title': 'Nike Cortez "Vintage"',
        'model': 'Cortez',
        'color': 'White, Gum',
        'price': 44.5,
        'imageUrl': Constants.nike6, // Update with actual image URL
        'sizes': [9, 10, 11, 12],
        'isFavourite': true,
        'isNewarrival': true,
        'description':
            'A throwback to the track, the Nike Cortez features a nylon upper and a waffle outsole for a comfortable and vintage-inspired look.'
      },
      {
        'id': 007,
        'title': 'Nike Free RN 5.0 "Grey"',
        'model': 'Free RN 5.0',
        'color': 'Grey',
        'price': 44.5,
        'imageUrl': Constants.nike7, // Update with actual image URL
        'sizes': [9, 10, 11, 12],
        'isFavourite': false,
        'isNewarrival': false,
        'description':
            'The Nike Free RN 5.0 is a minimalist running shoe designed for a natural feel. It features a flexible upper and a comfortable foam sole.'
      }
    ],
  },
  {
    'id': '1',
    'company': 'Jordan',
    'companyLogoUrl': Constants.brand5,
    'data': [
      {
        'id': 008,
        'title':
            'Air Jordan 1 High OG "Chicago"', // Assuming this is the Jordan 1
        'model': 'Air Jordan 1',
        'color': 'Red, White, Black',
        'price': 44.5,
        'imageUrl': Constants.jordan1, // Update with actual image URL
        'sizes': [9, 10, 11, 12],
        'isFavourite': true,
        'isNewarrival': true,
        'description':
            'The iconic Air Jordan 1 returns in the original "Chicago" colorway. Featuring a premium leather upper and classic design lines, this shoe is a must-have for any Jordan fan.'
      },
      {
        'id': 009,
        'title':
            'Air Jordan (Specify Model)', // Modify title with specific model name
        'model':
            'Jordan', // Update with specific model name (e.g., Air Jordan 3, Air Jordan 4)
        'color': 'Placeholder', // Update with actual color
        'price': 44.5,
        'imageUrl': Constants.jordan2, // Update with actual image URL
        'sizes': [9, 10, 11, 12],
        'isFavourite': false,
        'isNewarrival': false,
        'description':
            'A stylish and iconic shoe from the Jordan brand. Update description with specific details about the model.'
      },
      // Repeat for remaining Jordan shoes
      {
        'id': 010,
        'title':
            'Air Jordan (Specify Model)', // Modify title with specific model name
        'model': 'Jordan', // Update with specific model name
        'color': 'Placeholder', // Update with actual color
        'price': 44.5,
        'imageUrl': Constants.jordan3, // Update with actual image URL
        'sizes': [9, 10, 11, 12],
        'isFavourite': false,
        'isNewarrival': true,
        'description':
            'A stylish and iconic shoe from the Jordan brand. Update description with specific details about the model.'
      },
      {
        'id': 011,
        'title':
            'Air Jordan (Specify Model)', // Modify title with specific model name
        'model': 'Jordan', // Update with specific model name
        'color': 'Placeholder', // Update with actual color
        'price': 44.5,
        'imageUrl': Constants.jordan4, // Update with actual image URL
        'sizes': [9, 10, 11, 12],
        'isFavourite': false,
        'isNewarrival': false,
        'description':
            'A stylish and iconic shoe from the Jordan brand. Update description with specific details about the model.'
      },
      {
        'id': 012,
        'title':
            'Air Jordan (Specify Model)', // Modify title with specific model name
        'model': 'Jordan', // Update with specific model name
        'color': 'Placeholder', // Update with actual color
        'price': 44.5,
        'imageUrl': Constants.jordan5, // Update with actual image URL
        'sizes': [9, 10, 11, 12],
        'isFavourite': true,
        'isNewarrival': true,
        'description':
            'A stylish and iconic shoe from the Jordan brand. Update description with specific details about the model.'
      },
    ],
  },
  {
    'id': '2',
    'company': 'Puma',
    'companyLogoUrl': Constants.brand1,
    'data': [
      {
        'id': 013,
        'title': 'Puma RS-X "White/Pink"',
        'model': 'Puma RS-X',
        'color': 'White/Pink',
        'description':
            'Fresh white and pink colorway. A chunky and stylish sneaker from Puma.',
        'price': 120.00,
        'imageUrl': Constants.puma1, // Update with actual image URL
        'sizes': [9, 10, 11, 12],
        'isFavourite': false,
        'isNewarrival': true,
      },
      {
        'id': 014,
        'title': 'Puma Cali Classic "Black"',
        'model': 'Puma Cali Classic',
        'color': 'Black',
        'description':
            'A timeless and versatile sneaker from Puma. The Cali Classic features a clean leather upper and a comfortable rubber sole.',
        'price': 44.5,
        'imageUrl': Constants.puma2, // Update with actual image URL
        'sizes': [9, 10, 11, 12],
        'isFavourite': true,
        'isNewarrival': false,
      },
      {
        'id': 015,
        'title': 'Puma Suede Classic "Navy"',
        'model': 'Puma Suede Classic',
        'color': 'Navy',
        'description':
            'A legendary sneaker with a rich history. The Puma Suede Classic features a soft suede upper and a slim silhouette.',
        'price': 44.5,
        'imageUrl': Constants.puma3, // Update with actual image URL
        'sizes': [9, 10, 11, 12],
        'isFavourite': false,
        'isNewarrival': true,
      },
      {
        'id': 016,
        'title': 'Puma Velocity Nitro "Grey"',
        'model': 'Puma Velocity Nitro',
        'color': 'Grey',
        'description':
            'A lightweight and responsive running shoe from Puma. The Velocity Nitro features a breathable upper and a nitrogen-infused foam midsole for a comfortable and energetic ride.',
        'price': 44.5,
        'imageUrl': Constants.puma4, // Update with actual image URL
        'sizes': [9, 10, 11, 12],
        'isFavourite': false,
        'isNewarrival': false,
      },
      {
        'id': 017,
        'title': 'Puma Disc Blaze "Multicolor"',
        'model': 'Puma Disc Blaze',
        'color': 'Multicolor',
        'description':
            'A bold and eye-catching lifestyle shoe from Puma. The Disc Blaze features a unique disc closure system and a vibrant color scheme.',
        'price': 44.5,
        'imageUrl': Constants.puma5, // Update with actual image URL
        'sizes': [9, 10, 11, 12],
        'isFavourite': true,
        'isNewarrival': true,
      },
      {
        'id': 018,
        'title': 'Puma Tsugi Shinsei "White/Black"',
        'model': 'Puma Tsugi Shinsei',
        'color': 'White/Black',
        'description':
            'A minimalist and comfortable running shoe from Puma. The Tsugi Shinsei features a breathable knit upper and a responsive foam midsole.',
        'price': 44.5,
        'imageUrl': Constants.puma6, // Update with actual image URL
        'sizes': [9, 10, 11, 12],
        'isFavourite': false,
        'isNewarrival': false,
      },
      {
        'id': 019,
        'title': 'Puma Cell Endura "Black/Red"',
        'model': 'Puma Cell Endura',
        'color': 'Black/Red',
        'description':
            'A comfortable and stylish training shoe from Puma. The Cell Endura features a breathable upper and a supportive Cell technology midsole.',
        'price': 44.5,
        'imageUrl': Constants.puma7, // Update with actual image URL
        'sizes': [9, 10, 11, 12],
        'isFavourite': false,
        'isNewarrival': true,
      },
    ],
  },
  {
    'id': '3',
    'company': 'Adidas',
    'companyLogoUrl': Constants.brand3,
    'data': [],
  },
  {
    'id': '4',
    'company': 'Converse',
    'companyLogoUrl': Constants.brand4,
    'data': [],
  }
];
