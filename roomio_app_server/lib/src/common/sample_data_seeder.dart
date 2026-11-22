import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class SampleDataSeeder {
  static Future<void> seedIfEmpty(Session session) async {
    await seedPropertiesIfEmpty(session);
    await seedFlatmatesIfEmpty(session);
  }

  static Future<void> seedPropertiesIfEmpty(Session session) async {
    final count = await PropertyListing.db.count(session);
    if (count > 0) return;

    final properties = [
      PropertyListing(
        ownerUserId: 'host_london_1',
        title: 'Modern 2-Bed Flat with Balcony in Camden',
        description:
            'Stunning modern flat minutes from Camden Lock. Features floor-to-ceiling windows, private south-facing balcony, hardwood flooring, and a fully equipped chef kitchen.',
        propertyType: 'apartment',
        roomType: 'private_room',
        listingPurpose: 'rent',
        monthlyRent: 1450,
        securityDeposit: 1450,
        propertySizeSqFt: 680,
        furnishingStatus: 'furnished',
        publisherRole: 'owner',
        verificationStatus: 'verified',
        city: 'London',
        neighborhood: 'Camden',
        approximateAddress: 'Camden High St, London NW1',
        totalBedrooms: 2,
        totalBathrooms: 2,
        availableFrom: DateTime.now().add(const Duration(days: 7)),
        imageUrls: [
          'https://images.unsplash.com/photo-1522708323590-d24dbb6b0267?auto=format&fit=crop&w=800&q=80',
          'https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?auto=format&fit=crop&w=800&q=80',
        ],
        amenities: [
          'High-speed WiFi',
          'Dishwasher',
          'Private Balcony',
          'Washing Machine',
          'Furnished',
        ],
        houseRules: [
          'No smoking indoors',
          'Quiet hours after 11 PM',
        ],
        isActive: true,
        createdAt: DateTime.now().subtract(const Duration(days: 2)),
      ),
      PropertyListing(
        ownerUserId: 'host_london_2',
        title: 'Bright Industrial Loft in Shoreditch',
        description:
            'Authentic warehouse conversion with exposed brickwork, soaring 3.5m ceilings, and shared rooftop terrace with panoramic city views. 5 min walk to Shoreditch High St.',
        propertyType: 'apartment',
        roomType: 'entire_place',
        listingPurpose: 'rent',
        monthlyRent: 1650,
        securityDeposit: 1650,
        propertySizeSqFt: 750,
        furnishingStatus: 'furnished',
        publisherRole: 'authorized_agent',
        agencyName: 'East London Realty',
        verificationStatus: 'verified',
        city: 'London',
        neighborhood: 'Shoreditch',
        approximateAddress: 'Redchurch St, London E2',
        totalBedrooms: 2,
        totalBathrooms: 1,
        availableFrom: DateTime.now().add(const Duration(days: 14)),
        imageUrls: [
          'https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?auto=format&fit=crop&w=800&q=80',
        ],
        amenities: [
          'Rooftop Terrace',
          'Exposed Brick',
          'Concierge',
          'Underfloor Heating',
        ],
        houseRules: [
          'No smoking',
          'Respectful neighbors',
        ],
        isActive: true,
        createdAt: DateTime.now().subtract(const Duration(days: 3)),
      ),
      PropertyListing(
        ownerUserId: 'host_london_sale_1',
        title: 'Luxury 2-Bed Riverside Penthouse in Battersea Reach',
        description:
            'Exceptional modern penthouse apartment with direct panoramic river views. Open-plan designer kitchen, private wrap-around terrace, concierge service, and resident health club.',
        propertyType: 'penthouse',
        listingPurpose: 'sale',
        purchasePrice: 685000,
        propertySizeSqFt: 920,
        tenure: 'share_of_freehold',
        publisherRole: 'authorized_agent',
        agencyName: 'Knight & Sterling Estate Agents',
        verificationStatus: 'verified',
        city: 'London',
        neighborhood: 'Battersea',
        approximateAddress: 'Battersea Reach, London SW18',
        totalBedrooms: 2,
        totalBathrooms: 2,
        imageUrls: [
          'https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?auto=format&fit=crop&w=800&q=80',
        ],
        amenities: [
          'Direct River View',
          'Wrap-around Terrace',
          'Resident Gym',
          '24/7 Concierge',
          'Underground Parking',
        ],
        isActive: true,
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
      PropertyListing(
        ownerUserId: 'host_bristol_sale_1',
        title: 'Charming 3-Bed Georgian Townhouse in Clifton Village',
        description:
            'Immaculate Grade-II listed Georgian family home arranged over three storeys. Features restored sash windows, flagstone flooring, working fireplaces, and a landscaped walled garden.',
        propertyType: 'house',
        listingPurpose: 'sale',
        purchasePrice: 575000,
        propertySizeSqFt: 1450,
        tenure: 'freehold',
        publisherRole: 'owner',
        verificationStatus: 'verified',
        city: 'Bristol',
        neighborhood: 'Clifton',
        approximateAddress: 'The Mall, Clifton, Bristol BS8',
        totalBedrooms: 3,
        totalBathrooms: 2,
        imageUrls: [
          'https://images.unsplash.com/photo-1493809842364-78817add7ffb?auto=format&fit=crop&w=800&q=80',
        ],
        amenities: [
          'Walled Garden',
          'Working Fireplace',
          'Period Cornicing',
          'Wine Cellar',
        ],
        isActive: true,
        createdAt: DateTime.now().subtract(const Duration(days: 3)),
      ),
      PropertyListing(
        ownerUserId: 'host_london_3',
        title: 'Riverside 3-Bed Apartment in Battersea Reach',
        description:
            'Luxury riverside development overlooking the Thames. Includes resident gym, 24/7 concierge, landscaped private gardens, and secure underground cycle storage.',
        propertyType: 'apartment',
        roomType: 'private_room',
        monthlyRent: 1750,
        securityDeposit: 1750,
        city: 'London',
        neighborhood: 'Battersea',
        approximateAddress: 'Battersea Park Rd, London SW11',
        totalBedrooms: 3,
        totalBathrooms: 2,
        availableFrom: DateTime.now().add(const Duration(days: 3)),
        imageUrls: [
          'https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?auto=format&fit=crop&w=800&q=80',
        ],
        amenities: [
          'Resident Gym',
          '24/7 Concierge',
          'Thames River View',
          'Private Garden',
          'Lift',
        ],
        houseRules: [
          'No smoking indoors',
          'No loud parties',
        ],
        isActive: true,
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
      PropertyListing(
        ownerUserId: 'host_bristol_1',
        title: 'Charming Victorian Terrace in Clifton Village',
        description:
            'Beautiful period townhouse in the heart of Clifton Village. High ceilings with ornate cornicing, large south-facing garden, and modern eat-in kitchen.',
        propertyType: 'house',
        roomType: 'private_room',
        monthlyRent: 950,
        securityDeposit: 950,
        city: 'Bristol',
        neighborhood: 'Clifton',
        approximateAddress: 'Princess Victoria St, Bristol BS8',
        totalBedrooms: 3,
        totalBathrooms: 2,
        availableFrom: DateTime.now().add(const Duration(days: 10)),
        imageUrls: [
          'https://images.unsplash.com/photo-1493809842364-78817add7ffb?auto=format&fit=crop&w=800&q=80',
        ],
        amenities: [
          'Private Garden',
          'Period Features',
          'Dishwasher',
          'Bike Storage',
        ],
        houseRules: [
          'Quiet hours after 10 PM',
          'Keep shared kitchen clean',
        ],
        isActive: true,
        createdAt: DateTime.now().subtract(const Duration(days: 4)),
      ),
      PropertyListing(
        ownerUserId: 'host_london_4',
        title: 'Contemporary Studio Flat in Islington',
        description:
            'Sleek, fully furnished studio with smart storage solutions, high-speed fiber internet, and immediate access to Upper Street cafes and Angel tube station.',
        propertyType: 'studio',
        roomType: 'entire_place',
        monthlyRent: 1200,
        securityDeposit: 1200,
        city: 'London',
        neighborhood: 'Islington',
        approximateAddress: 'Upper St, London N1',
        totalBedrooms: 1,
        totalBathrooms: 1,
        availableFrom: DateTime.now(),
        imageUrls: [
          'https://images.unsplash.com/photo-1536376072261-38c75010e6c9?auto=format&fit=crop&w=800&q=80',
        ],
        amenities: [
          'Fiber Broadband',
          'Smart TV',
          'Modern Shower Room',
          'Furnished',
        ],
        houseRules: [
          'No smoking indoors',
        ],
        isActive: true,
        createdAt: DateTime.now().subtract(const Duration(days: 5)),
      ),
    ];

    for (final p in properties) {
      await PropertyListing.db.insertRow(session, p);
    }
  }

  static Future<void> seedFlatmatesIfEmpty(Session session) async {
    final count = await LifestyleProfile.db.count(session);
    if (count >= 4) return;

    final flatmateSeeds = [
      (
        UserProfile(
          userId: 'seed_sarah_jenkins',
          displayName: 'Sarah Jenkins',
          bio:
              'Software engineer in Camden. Tidy, love weekend baking, specialty coffee, and quiet weeknights.',
          age: 26,
          gender: 'female',
          occupation: 'Software Engineer',
          city: 'London',
          avatarUrl:
              'https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&w=400&q=80',
          isLookingForFlatmates: true,
          isLookingForRoom: true,
          createdAt: DateTime.now().subtract(const Duration(days: 5)),
        ),
        LifestyleProfile(
          userId: 'seed_sarah_jenkins',
          name: 'Sarah Jenkins',
          minBudget: 1300,
          maxBudget: 1800,
          preferredCity: 'London',
          sleepSchedule: 'early_bird',
          cleanliness: 'meticulous',
          foodHabit: 'vegetarian',
          socialHabit: 'moderate',
          smokingHabit: 'non_smoker',
          petHabit: 'no_pets',
          hardFilterNoSmoking: true,
          hardFilterPetFriendly: false,
          hardFilterSameGender: false,
        ),
      ),
      (
        UserProfile(
          userId: 'seed_marcus_vance',
          displayName: 'Marcus Vance',
          bio:
              'Product designer at a fintech startup. Love photography, cooking pasta for roommates, and art exhibitions.',
          age: 28,
          gender: 'male',
          occupation: 'Product Designer',
          city: 'London',
          avatarUrl:
              'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&w=400&q=80',
          isLookingForFlatmates: true,
          isLookingForRoom: true,
          createdAt: DateTime.now().subtract(const Duration(days: 4)),
        ),
        LifestyleProfile(
          userId: 'seed_marcus_vance',
          name: 'Marcus Vance',
          minBudget: 1250,
          maxBudget: 1750,
          preferredCity: 'London',
          sleepSchedule: 'flexible',
          cleanliness: 'meticulous',
          foodHabit: 'vegetarian',
          socialHabit: 'social',
          smokingHabit: 'non_smoker',
          petHabit: 'cats',
          hardFilterNoSmoking: true,
          hardFilterPetFriendly: false,
          hardFilterSameGender: false,
        ),
      ),
      (
        UserProfile(
          userId: 'seed_elena_rostova',
          displayName: 'Elena Rostova',
          bio:
              'Data scientist and avid runner. Looking for calm, respectful flatmates who value clean shared spaces.',
          age: 25,
          gender: 'female',
          occupation: 'Data Scientist',
          city: 'London',
          avatarUrl:
              'https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&w=400&q=80',
          isLookingForFlatmates: true,
          isLookingForRoom: true,
          createdAt: DateTime.now().subtract(const Duration(days: 3)),
        ),
        LifestyleProfile(
          userId: 'seed_elena_rostova',
          name: 'Elena Rostova',
          minBudget: 1400,
          maxBudget: 1900,
          preferredCity: 'London',
          sleepSchedule: 'early_bird',
          cleanliness: 'meticulous',
          foodHabit: 'vegetarian',
          socialHabit: 'moderate',
          smokingHabit: 'non_smoker',
          petHabit: 'no_pets',
          hardFilterNoSmoking: true,
          hardFilterPetFriendly: false,
          hardFilterSameGender: false,
        ),
      ),
      (
        UserProfile(
          userId: 'seed_liam_oconnor',
          displayName: 'Liam O\'Connor',
          bio:
              'Architectural designer. Love plants, cycling, and acoustic guitar. Keep communal spaces clean and tidy.',
          age: 27,
          gender: 'male',
          occupation: 'Architectural Designer',
          city: 'London',
          avatarUrl:
              'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&w=400&q=80',
          isLookingForFlatmates: true,
          isLookingForRoom: true,
          createdAt: DateTime.now().subtract(const Duration(days: 2)),
        ),
        LifestyleProfile(
          userId: 'seed_liam_oconnor',
          name: 'Liam O\'Connor',
          minBudget: 1100,
          maxBudget: 1650,
          preferredCity: 'London',
          sleepSchedule: 'flexible',
          cleanliness: 'moderate',
          foodHabit: 'omnivore',
          socialHabit: 'social',
          smokingHabit: 'non_smoker',
          petHabit: 'dogs',
          hardFilterNoSmoking: false,
          hardFilterPetFriendly: false,
          hardFilterSameGender: false,
        ),
      ),
      (
        UserProfile(
          userId: 'seed_chloe_bennett',
          displayName: 'Chloe Bennett',
          bio:
              'Digital marketer in Clifton, Bristol. Weekend hiker, sourdough baker, and board game enthusiast.',
          age: 24,
          gender: 'female',
          occupation: 'Digital Marketer',
          city: 'Bristol',
          avatarUrl:
              'https://images.unsplash.com/photo-1517841905240-472988babdf9?auto=format&fit=crop&w=400&q=80',
          isLookingForFlatmates: true,
          isLookingForRoom: true,
          createdAt: DateTime.now().subtract(const Duration(days: 1)),
        ),
        LifestyleProfile(
          userId: 'seed_chloe_bennett',
          name: 'Chloe Bennett',
          minBudget: 800,
          maxBudget: 1250,
          preferredCity: 'Bristol',
          sleepSchedule: 'early_bird',
          cleanliness: 'moderate',
          foodHabit: 'vegetarian',
          socialHabit: 'social',
          smokingHabit: 'non_smoker',
          petHabit: 'no_pets',
          hardFilterNoSmoking: true,
          hardFilterPetFriendly: false,
          hardFilterSameGender: false,
        ),
      ),
    ];

    for (final (user, lifestyle) in flatmateSeeds) {
      final existingUser = await UserProfile.db.findFirstRow(
        session,
        where: (t) => t.userId.equals(user.userId),
      );
      if (existingUser == null) {
        await UserProfile.db.insertRow(session, user);
      }

      final existingLifestyle = await LifestyleProfile.db.findFirstRow(
        session,
        where: (t) => t.userId.equals(lifestyle.userId),
      );
      if (existingLifestyle == null) {
        await LifestyleProfile.db.insertRow(session, lifestyle);
      }
    }
  }
}
