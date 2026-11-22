import 'package:flutter/material.dart';
import 'package:roomio_app_client/roomio_app_client.dart';
import '../../client.dart';
import '../../theme/roomio_theme.dart';
import '../../widgets/roomio_button.dart';

class ProfileSetupScreen extends StatefulWidget {
  final VoidCallback onCompleted;
  final bool isEditing;

  const ProfileSetupScreen({
    super.key,
    required this.onCompleted,
    this.isEditing = false,
  });

  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  int _currentStep = 0;
  bool _isLoading = false;
  bool _isFetchingExisting = true;

  // Step 1: Personal Profile
  final _nameController = TextEditingController();
  final _ageController = TextEditingController(text: '24');
  final _occupationController = TextEditingController();
  final _bioController = TextEditingController();
  String _selectedCity = 'London';
  String _selectedGender = 'female';
  bool _isLookingForFlatmates = true;
  bool _isLookingForRoom = true;

  // Step 2: Lifestyle Preferences
  double _minBudget = 1100;
  double _maxBudget = 1700;
  String _sleepSchedule = 'early_bird';
  String _cleanliness = 'meticulous';
  String _foodHabit = 'vegetarian';
  String _socialHabit = 'moderate';
  String _smokingHabit = 'non_smoker';
  String _petHabit = 'no_pets';

  // Hard Filters
  bool _hardFilterNoSmoking = true;
  bool _hardFilterPetFriendly = false;
  bool _hardFilterSameGender = false;

  final List<String> _cities = [
    'London',
    'Bristol',
    'Manchester',
    'Birmingham',
  ];

  @override
  void initState() {
    super.initState();
    _loadExistingProfile();
  }

  Future<void> _loadExistingProfile() async {
    try {
      final userProfile = await client.profile.getMyUserProfile();
      final lifestyle = await client.profile.getMyLifestyleProfile();

      if (!mounted) return;

      if (userProfile != null) {
        _nameController.text = userProfile.displayName;
        _ageController.text = userProfile.age.toString();
        _occupationController.text = userProfile.occupation ?? '';
        _bioController.text = userProfile.bio ?? '';
        if (_cities.contains(userProfile.city)) {
          _selectedCity = userProfile.city;
        }
        _selectedGender = userProfile.gender;
        _isLookingForFlatmates = userProfile.isLookingForFlatmates;
        _isLookingForRoom = userProfile.isLookingForRoom;
      }

      if (lifestyle != null) {
        _minBudget = lifestyle.minBudget.toDouble().clamp(300, 4000);
        _maxBudget = lifestyle.maxBudget.toDouble().clamp(300, 5000);
        _sleepSchedule = lifestyle.sleepSchedule;
        _cleanliness = lifestyle.cleanliness;
        _foodHabit = lifestyle.foodHabit;
        _socialHabit = lifestyle.socialHabit;
        _smokingHabit = lifestyle.smokingHabit;
        _petHabit = lifestyle.petHabit;
        _hardFilterNoSmoking = lifestyle.hardFilterNoSmoking;
        _hardFilterPetFriendly = lifestyle.hardFilterPetFriendly;
        _hardFilterSameGender = lifestyle.hardFilterSameGender;
      }
    } catch (_) {
      // Ignore initial fetch errors
    } finally {
      if (mounted) {
        setState(() => _isFetchingExisting = false);
      }
    }
  }

  Future<void> _saveAll() async {
    final name = _nameController.text.trim();
    final age = int.tryParse(_ageController.text.trim()) ?? 0;

    if (name.isEmpty) {
      _showError('Please enter your full name');
      return;
    }
    if (age < 18 || age > 100) {
      _showError('Age must be between 18 and 100');
      return;
    }

    setState(() => _isLoading = true);

    try {
      // 1. Save User Profile (Server authoritative userId attached automatically)
      final userProfile = UserProfile(
        userId: '',
        displayName: name,
        bio: _bioController.text.trim(),
        age: age,
        gender: _selectedGender,
        occupation: _occupationController.text.trim(),
        city: _selectedCity,
        isLookingForFlatmates: _isLookingForFlatmates,
        isLookingForRoom: _isLookingForRoom,
        createdAt: DateTime.now(),
      );
      await client.profile.saveUserProfile(userProfile);

      // 2. Save Lifestyle Profile
      final lifestyle = LifestyleProfile(
        userId: '',
        name: name,
        minBudget: _minBudget.round(),
        maxBudget: _maxBudget.round(),
        preferredCity: _selectedCity,
        sleepSchedule: _sleepSchedule,
        cleanliness: _cleanliness,
        foodHabit: _foodHabit,
        socialHabit: _socialHabit,
        smokingHabit: _smokingHabit,
        petHabit: _petHabit,
        hardFilterNoSmoking: _hardFilterNoSmoking,
        hardFilterPetFriendly: _hardFilterPetFriendly,
        hardFilterSameGender: _hardFilterSameGender,
      );
      await client.profile.saveLifestyleProfile(lifestyle);

      if (!mounted) return;
      widget.onCompleted();
    } catch (e) {
      if (!mounted) return;
      setState(() => _isLoading = false);
      _showError('Failed to save profile: $e');
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: RoomioColors.rose,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isFetchingExisting) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(color: RoomioColors.primary),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.isEditing
              ? 'Edit Profile & Preferences'
              : 'Set Up Your Profile',
          style: RoomioTypography.titleMedium.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          if (widget.isEditing)
            IconButton(
              icon: const Icon(Icons.close_rounded),
              onPressed: () => Navigator.pop(context),
            ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Step Progress Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              color: RoomioColors.primaryContainer.withValues(alpha: 0.4),
              child: Row(
                children: [
                  _buildStepIndicator(0, '1. Profile Info'),
                  const Expanded(
                    child: Divider(
                      color: RoomioColors.primary,
                      thickness: 2,
                      indent: 8,
                      endIndent: 8,
                    ),
                  ),
                  _buildStepIndicator(1, '2. Lifestyle & Budget'),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 540),
                    child: _currentStep == 0
                        ? _buildProfileStep()
                        : _buildLifestyleStep(),
                  ),
                ),
              ),
            ),

            // Bottom Navigation Actions
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, -3),
                  ),
                ],
              ),
              child: SafeArea(
                top: false,
                child: Row(
                  children: [
                    if (_currentStep == 1)
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => setState(() => _currentStep = 0),
                          child: const Text('Back'),
                        ),
                      ),
                    if (_currentStep == 1) const SizedBox(width: 12),
                    Expanded(
                      flex: 2,
                      child: RoomioButton(
                        text: _currentStep == 0
                            ? 'Continue to Preferences'
                            : (widget.isEditing
                                  ? 'Save Changes'
                                  : 'Complete & Match'),
                        icon: _currentStep == 0
                            ? Icons.arrow_forward_rounded
                            : Icons.check_circle_rounded,
                        isLoading: _isLoading,
                        onPressed: () {
                          if (_currentStep == 0) {
                            final name = _nameController.text.trim();
                            final age =
                                int.tryParse(_ageController.text.trim()) ?? 0;
                            if (name.isEmpty) {
                              _showError('Please enter your full name');
                              return;
                            }
                            if (age < 18 || age > 100) {
                              _showError('Age must be between 18 and 100');
                              return;
                            }
                            setState(() => _currentStep = 1);
                          } else {
                            _saveAll();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepIndicator(int stepIndex, String title) {
    final isSelected = _currentStep == stepIndex;
    final isDone = _currentStep > stepIndex;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            color: isSelected || isDone
                ? RoomioColors.primary
                : Colors.grey[300],
            shape: BoxShape.circle,
          ),
          child: Center(
            child: isDone
                ? const Icon(Icons.check, size: 16, color: Colors.white)
                : Text(
                    '${stepIndex + 1}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: TextStyle(
            fontSize: 13,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            color: isSelected
                ? RoomioColors.navy
                : RoomioColors.textSecondaryLight,
          ),
        ),
      ],
    );
  }

  Widget _buildProfileStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tell potential flatmates about yourself',
          style: RoomioTypography.titleLarge.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'This information will appear on your public profile card.',
          style: RoomioTypography.bodyMedium.copyWith(
            color: RoomioColors.textSecondaryLight,
          ),
        ),
        const SizedBox(height: 24),

        // Display Name
        TextField(
          controller: _nameController,
          decoration: const InputDecoration(
            labelText: 'Full Name / Display Name *',
            hintText: 'e.g. Alex Morgan',
            prefixIcon: Icon(Icons.person_outline_rounded),
          ),
        ),
        const SizedBox(height: 16),

        // Age & City Row
        Row(
          children: [
            Expanded(
              flex: 1,
              child: TextField(
                controller: _ageController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Age *',
                  hintText: '24',
                  prefixIcon: Icon(Icons.cake_outlined),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              flex: 2,
              child: DropdownButtonFormField<String>(
                value: _selectedCity,
                decoration: const InputDecoration(
                  labelText: 'Target City *',
                  prefixIcon: Icon(Icons.location_city_rounded),
                ),
                items: _cities
                    .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                    .toList(),
                onChanged: (val) {
                  if (val != null) setState(() => _selectedCity = val);
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Occupation
        TextField(
          controller: _occupationController,
          decoration: const InputDecoration(
            labelText: 'Occupation',
            hintText: 'e.g. UX Designer, Student, Accountant',
            prefixIcon: Icon(Icons.work_outline_rounded),
          ),
        ),
        const SizedBox(height: 16),

        // Bio
        TextField(
          controller: _bioController,
          maxLines: 3,
          decoration: const InputDecoration(
            labelText: 'Short Bio',
            hintText:
                'A sentence or two about your personality, daily routine, and hobbies.',
            prefixIcon: Icon(Icons.description_outlined),
          ),
        ),
        const SizedBox(height: 20),

        // Gender Options
        Text('Gender', style: RoomioTypography.labelBold),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: [
            _buildChoiceChip('Female', 'female', _selectedGender, (val) {
              setState(() => _selectedGender = val);
            }),
            _buildChoiceChip('Male', 'male', _selectedGender, (val) {
              setState(() => _selectedGender = val);
            }),
            _buildChoiceChip('Non-binary', 'non_binary', _selectedGender, (
              val,
            ) {
              setState(() => _selectedGender = val);
            }),
            _buildChoiceChip('Other', 'other', _selectedGender, (val) {
              setState(() => _selectedGender = val);
            }),
          ],
        ),
      ],
    );
  }

  Widget _buildLifestyleStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Lifestyle & Habits Questionnaire',
          style: RoomioTypography.titleLarge.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Roomio uses these answers to calculate your transparent compatibility scores with potential flatmates.',
          style: RoomioTypography.bodyMedium.copyWith(
            color: RoomioColors.textSecondaryLight,
          ),
        ),
        const SizedBox(height: 24),

        // Monthly Budget Range
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Monthly Rent Budget', style: RoomioTypography.labelBold),
            Text(
              '£${_minBudget.round()} - £${_maxBudget.round()}/mo',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: RoomioColors.primary,
                fontSize: 15,
              ),
            ),
          ],
        ),
        RangeSlider(
          values: RangeValues(_minBudget, _maxBudget),
          min: 400,
          max: 3000,
          divisions: 52,
          activeColor: RoomioColors.primary,
          onChanged: (values) {
            setState(() {
              _minBudget = values.start;
              _maxBudget = values.end;
            });
          },
        ),
        const SizedBox(height: 16),

        // Sleep Schedule
        Text('Sleep Schedule', style: RoomioTypography.labelBold),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: [
            _buildChoiceChip('Early Bird 🌅', 'early_bird', _sleepSchedule, (
              val,
            ) {
              setState(() => _sleepSchedule = val);
            }),
            _buildChoiceChip('Flexible ☕', 'flexible', _sleepSchedule, (val) {
              setState(() => _sleepSchedule = val);
            }),
            _buildChoiceChip('Night Owl 🌙', 'night_owl', _sleepSchedule, (
              val,
            ) {
              setState(() => _sleepSchedule = val);
            }),
          ],
        ),
        const SizedBox(height: 18),

        // Cleanliness
        Text('Cleanliness Preference', style: RoomioTypography.labelBold),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: [
            _buildChoiceChip('Meticulous ✨', 'meticulous', _cleanliness, (val) {
              setState(() => _cleanliness = val);
            }),
            _buildChoiceChip('Moderate 🧹', 'moderate', _cleanliness, (val) {
              setState(() => _cleanliness = val);
            }),
            _buildChoiceChip('Relaxed 🛋️', 'relaxed', _cleanliness, (val) {
              setState(() => _cleanliness = val);
            }),
          ],
        ),
        const SizedBox(height: 18),

        // Food & Cooking Habits
        Text('Kitchen & Food Habits', style: RoomioTypography.labelBold),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: [
            _buildChoiceChip('Vegetarian 🥑', 'vegetarian', _foodHabit, (val) {
              setState(() => _foodHabit = val);
            }),
            _buildChoiceChip('Vegan 🌱', 'vegan', _foodHabit, (val) {
              setState(() => _foodHabit = val);
            }),
            _buildChoiceChip('Omnivore 🍳', 'omnivore', _foodHabit, (val) {
              setState(() => _foodHabit = val);
            }),
            _buildChoiceChip('Kosher / Halal 🥗', 'kosher_halal', _foodHabit, (
              val,
            ) {
              setState(() => _foodHabit = val);
            }),
          ],
        ),
        const SizedBox(height: 18),

        // Social Lifestyle
        Text('Social Lifestyle at Home', style: RoomioTypography.labelBold),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: [
            _buildChoiceChip('Quiet & Private 🧘', 'quiet', _socialHabit, (
              val,
            ) {
              setState(() => _socialHabit = val);
            }),
            _buildChoiceChip(
              'Moderate / Friendly 💬',
              'moderate',
              _socialHabit,
              (val) {
                setState(() => _socialHabit = val);
              },
            ),
            _buildChoiceChip('Social & Welcoming 🥳', 'social', _socialHabit, (
              val,
            ) {
              setState(() => _socialHabit = val);
            }),
          ],
        ),
        const SizedBox(height: 18),

        // Smoking & Pets
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Smoking', style: RoomioTypography.labelBold),
                  const SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    value: _smokingHabit,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                    ),
                    items: const [
                      DropdownMenuItem(
                        value: 'non_smoker',
                        child: Text('Non-smoker'),
                      ),
                      DropdownMenuItem(
                        value: 'social_smoker',
                        child: Text('Social smoker'),
                      ),
                      DropdownMenuItem(
                        value: 'regular_smoker',
                        child: Text('Smoker'),
                      ),
                    ],
                    onChanged: (val) => setState(() => _smokingHabit = val!),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Pets', style: RoomioTypography.labelBold),
                  const SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    value: _petHabit,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                    ),
                    items: const [
                      DropdownMenuItem(
                        value: 'no_pets',
                        child: Text('No pets'),
                      ),
                      DropdownMenuItem(
                        value: 'cats',
                        child: Text('Cat friendly'),
                      ),
                      DropdownMenuItem(
                        value: 'dogs',
                        child: Text('Dog friendly'),
                      ),
                    ],
                    onChanged: (val) => setState(() => _petHabit = val!),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),

        // Non-Negotiable Hard Filters Section
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: RoomioColors.primaryContainer.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: RoomioColors.primary.withValues(alpha: 0.2),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.shield_rounded,
                    color: RoomioColors.primary,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Non-Negotiable Hard Filters',
                    style: RoomioTypography.titleMedium.copyWith(
                      color: RoomioColors.navy,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Text(
                'Candidates who do not meet these rules are filtered out immediately.',
                style: RoomioTypography.bodyMedium.copyWith(
                  fontSize: 12,
                  color: RoomioColors.textSecondaryLight,
                ),
              ),
              const SizedBox(height: 12),
              SwitchListTile(
                title: const Text(
                  'Must be Non-Smoker',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                subtitle: const Text(
                  'Exclude candidates who smoke',
                  style: TextStyle(fontSize: 12),
                ),
                activeColor: RoomioColors.primary,
                contentPadding: EdgeInsets.zero,
                value: _hardFilterNoSmoking,
                onChanged: (val) => setState(() => _hardFilterNoSmoking = val),
              ),
              SwitchListTile(
                title: const Text(
                  'Must be Pet-Friendly',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                subtitle: const Text(
                  'Exclude flatmates with no-pets restrictions',
                  style: TextStyle(fontSize: 12),
                ),
                activeColor: RoomioColors.primary,
                contentPadding: EdgeInsets.zero,
                value: _hardFilterPetFriendly,
                onChanged: (val) =>
                    setState(() => _hardFilterPetFriendly = val),
              ),
              SwitchListTile(
                title: const Text(
                  'Same-Gender Flatmate Only',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                subtitle: const Text(
                  'Exclude candidates of a different gender',
                  style: TextStyle(fontSize: 12),
                ),
                activeColor: RoomioColors.primary,
                contentPadding: EdgeInsets.zero,
                value: _hardFilterSameGender,
                onChanged: (val) => setState(() => _hardFilterSameGender = val),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildChoiceChip(
    String label,
    String value,
    String currentValue,
    Function(String) onSelected,
  ) {
    final isSelected = currentValue == value;
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      selectedColor: RoomioColors.primaryContainer,
      labelStyle: TextStyle(
        color: isSelected ? RoomioColors.primary : RoomioColors.navy,
        fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
        fontSize: 13,
      ),
      side: BorderSide(
        color: isSelected ? RoomioColors.primary : RoomioColors.borderLight,
      ),
      onSelected: (_) => onSelected(value),
    );
  }
}
