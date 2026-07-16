import 'package:crew_nest/utils/app_colors.dart';
import 'package:crew_nest/utils/app_texts.dart';
import 'package:crew_nest/views/widgets/custom_app_bar.dart';
import 'package:crew_nest/views/widgets/custom_button.dart';
import 'package:crew_nest/views/widgets/custom_calender.dart';
import 'package:crew_nest/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserFilter extends StatefulWidget {
  const UserFilter({super.key});

  @override
  State<UserFilter> createState() => _UserFilterState();
}

class _UserFilterState extends State<UserFilter> {
  double _airportDistanceRatio = 0.60;
  int _selectedPropertyType = 0;

  final _priceMinController = TextEditingController();
  final _priceMaxController = TextEditingController();
  final _bedMinController = TextEditingController();
  final _guestMaxController = TextEditingController();

  @override
  void dispose() {
    _priceMinController.dispose();
    _priceMaxController.dispose();
    _bedMinController.dispose();
    _guestMaxController.dispose();
    super.dispose();
  }

  void _onApplyFilter() {
    // Collect filter values for downstream use
    debugPrint('Filter applied — '
        'priceMin: ${_priceMinController.text}, '
        'priceMax: ${_priceMaxController.text}, '
        'bed: ${_bedMinController.text}, '
        'guest: ${_guestMaxController.text}, '
        'distance: ${(_airportDistanceRatio * 100).toInt()}m, '
        'type: ${_selectedPropertyType == 0 ? "Short Term" : "Apartment"}');
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Filter"),
      body: SingleChildScrollView(
        padding: .symmetric(horizontal: 20),
        child: SafeArea(
          child: Column(
            spacing: 8,
            crossAxisAlignment: .start,
            children: [
              Text("Property Type", style: AppTexts.tmdr),
              _buildPropertyTypeToggle(),
              const SizedBox(),
              Row(
                crossAxisAlignment: .end,
                spacing: 16,
                children: [
                  Expanded(
                    child: CustomTextField(
                      title: "Price Range",
                      hintText: "Minimum",
                      controller: _priceMinController,
                      textInputType: TextInputType.number,
                    ),
                  ),
                  Expanded(
                    child: CustomTextField(
                      hintText: "Maximum",
                      controller: _priceMaxController,
                      textInputType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              const SizedBox(),
              Row(
                crossAxisAlignment: .end,
                spacing: 16,
                children: [
                  Expanded(
                    child: CustomTextField(
                      title: "Bed",
                      hintText: "Minimum",
                      controller: _bedMinController,
                      textInputType: TextInputType.number,
                    ),
                  ),
                  Expanded(
                    child: CustomTextField(
                      title: "Guest",
                      hintText: "Maximum",
                      controller: _guestMaxController,
                      textInputType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              const SizedBox(),
              _buildDistanceSlider(),
              const SizedBox(),
              Text("Availability", style: AppTexts.tmdr),
              CustomCalendar(),
              const SizedBox(height: 50),
              CustomButton(onTap: _onApplyFilter, text: "Apply Filter"),
              const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  // ── Extracted builders ─────────────────────────────────────────────────

  Widget _buildPropertyTypeToggle() {
    return Container(
      padding: .all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: .circular(99),
      ),
      child: Row(
        children: [
          _buildPropertyTypeTab(0, "Short Term"),
          _buildPropertyTypeTab(1, "Apartment"),
        ],
      ),
    );
  }

  Widget _buildPropertyTypeTab(int index, String label) {
    final isSelected = _selectedPropertyType == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedPropertyType = index;
          });
        },
        child: Container(
          padding: .symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.blue : Colors.transparent,
            borderRadius: .circular(99),
          ),
          child: Center(
            child: Text(
              label,
              style: AppTexts.tsmr.copyWith(
                color: isSelected ? Colors.white : AppColors.black.shade300,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDistanceSlider() {
    return Container(
      padding: .all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: .circular(20),
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text("Distance From Airport", style: AppTexts.tmdm),
          const SizedBox(height: 12),
          Row(
            spacing: 12,
            children: [
              Expanded(
                child: Slider(
                  value: _airportDistanceRatio,
                  activeColor: AppColors.blue,
                  padding: .zero,
                  onChanged: (val) {
                    setState(() {
                      _airportDistanceRatio = val;
                    });
                  },
                ),
              ),
              Text(
                "${(_airportDistanceRatio * 100).toInt()}m",
                style: AppTexts.txsm.copyWith(height: 1),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
