class School {
  final String name;
  final String address;
  final String imageUrl;
  final String contactPerson;
  final String neededItems;
  final String mission;

  School({
    required this.name,
    required this.address,
    required this.imageUrl,
    required this.contactPerson,
    required this.neededItems,
    required this.mission,
  });
}

// Dummy data for schools
final List<School> sampleSchools = [
  School(
      name: "Davao City National High School",
      address: "F. Torres St, Poblacion District, Davao City",
      imageUrl: "https://images.unsplash.com/photo-1580582932707-520aed937b7b?q=80&w=1932&auto=format&fit=crop",
      contactPerson: "Mr. Juan Dela Cruz",
      neededItems: "Old desktop PCs, monitors, keyboards, and mice for student computer labs.",
      mission: "To provide quality education and enhance digital literacy among our students. Your donations can help us equip our labs for the next generation of learners."
  ),
  School(
      name: "Ateneo de Davao University",
      address: "E. Jacinto St, Poblacion District, Davao City",
      imageUrl: "https://images.unsplash.com/photo-1562774053-701939374585?q=80&w=1786&auto=format&fit=crop",
      contactPerson: "Ms. Maria Santos",
      neededItems: "Working laptops and tablets for our scholarship program.",
      mission: "Supporting underprivileged students by providing them with the necessary tools for online learning and research. Your contribution makes a direct impact."
  ),
];