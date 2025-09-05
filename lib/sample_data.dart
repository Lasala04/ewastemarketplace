import 'listing.dart';

// Top Selling
final List<Listing> topSellingItems = [
  Listing(id: "ts1", title: "Used Gaming Laptop", category: "PCs", imageUrl: "https://5.imimg.com/data5/KZ/QS/XR/SELLER-83296847/asus-rog-gl553vd-fy103t-500x500.jpeg", description: "High DPI gaming mouse. Still in good condition", seller: "GadgetGuru", price: 1500),
  Listing(id: "ts2", title: "Vintage Speakers", category: "Appliances", imageUrl: "https://i.pinimg.com/736x/97/71/f7/9771f757f6c36df96d54f0ea261adfe7.jpg", description: "Great sound quality. Works perfectly.", seller: "CircuitSurplus", price: 3000, isSold: true),
];

// Top Rated
final List<Listing> topRatedItems = [
  Listing(id: "tr1", title: "Used Mechanical Keyboard", category: "PCs", imageUrl: "https://res.cloudinary.com/jawa/image/upload/f_auto,ar_4:3,c_fill,w_1080,q_auto/production/listings/ghtxglp0rr2vfbft7xx1", description: "Clicky and satisfying.", seller: "TechReviver", price: 2200, rating: 5.0),
  Listing(id: "tr2", title: "Samsung S10", category: "Phones", imageUrl: "https://shopflix.co.tz/public/uploads/all/uJ559BRpETcuJXwGX6Q1QqfiNPDSn9azNjEmpKYg.jpg", description: "Slightly used, works perfectly.", seller: "GadgetGuru", price: 8000, rating: 4.9),
];

// Recently Added
final List<Listing> recentItems = [
  Listing(id: "r1", title: "GoPro Hero 8", category: "Appliances", imageUrl: "https://d1q8cepst0v8xp.cloudfront.net/original/3X/a/1/a19f56d35b370200de11909cd8c00b3244027085.jpeg", description: "For all your adventure needs.", seller: "TechReviver", price: 12000),
  Listing(id: "r2", title: "Power Bank", category: "Phones", imageUrl: "https://s3.eu-west-2.amazonaws.com/selloffng/uploads/images/202308/img_x300_64eb11564358b5-87477093-70803703.jpg", description: "20,000mAh capacity.", seller: "CircuitSurplus", price: 800),
];

// A combined list for other screens
List<Listing> sampleListings = [...topSellingItems, ...topRatedItems, ...recentItems];

// --- (The other files like login_screen.dart, signup_screen.dart, impact_screen.dart etc. are included in the above sections) ---