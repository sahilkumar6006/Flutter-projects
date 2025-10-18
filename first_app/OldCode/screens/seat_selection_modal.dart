import 'package:flutter/material.dart';
import '../model/movie_model.dart';
import 'booking_confirmation_modal.dart';

class SeatSelectionModal extends StatefulWidget {
  final Movie movie;

  const SeatSelectionModal({super.key, required this.movie});

  @override
  State<SeatSelectionModal> createState() => _SeatSelectionModalState();
}

class _SeatSelectionModalState extends State<SeatSelectionModal> {
  String selectedShowTime = '';
  List<String> selectedSeats = [];
  List<List<SeatStatus>> seats = [];
  bool isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeSeats();
  }

  void _initializeSeats() {
    // Create a 8x12 seat layout
    seats = List.generate(8, (row) {
      return List.generate(12, (col) {
        // Some seats are already booked (randomly)
        bool isBooked = (row + col) % 7 == 0;
        return SeatStatus(
          row: row,
          col: col,
          isBooked: isBooked,
          isSelected: false,
        );
      });
    });
    setState(() {
      isInitialized = true;
    });
  }

  void _toggleSeat(int row, int col) {
    if (seats[row][col].isBooked) return;

    setState(() {
      seats[row][col].isSelected = !seats[row][col].isSelected;

      if (seats[row][col].isSelected) {
        selectedSeats.add('${String.fromCharCode(65 + row)}${col + 1}');
      } else {
        selectedSeats.remove('${String.fromCharCode(65 + row)}${col + 1}');
      }
    });
  }

  double get totalPrice => selectedSeats.length * widget.movie.price;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          // Handle bar
          Container(
            margin: const EdgeInsets.only(top: 10),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          // Header
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  widget.movie.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  'Select your seats',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
              ],
            ),
          ),

          // Show Time Selection
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Select Show Time',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: widget.movie.showTimes.map((time) {
                    final isSelected = selectedShowTime == time;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedShowTime = time;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.deepPurple : Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: isSelected
                                ? Colors.deepPurple
                                : Colors.grey[300]!,
                          ),
                        ),
                        child: Text(
                          time,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black87,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Screen
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              'SCREEN',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          const SizedBox(height: 20),

          // Seat Layout
          if (isInitialized)
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    // Seat Legend
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _LegendItem(
                          color: Colors.grey[300]!,
                          label: 'Available',
                        ),
                        _LegendItem(color: Colors.red[300]!, label: 'Booked'),
                        _LegendItem(
                          color: Colors.deepPurple,
                          label: 'Selected',
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Seats Grid
                    Expanded(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 12,
                              childAspectRatio: 1,
                              crossAxisSpacing: 4,
                              mainAxisSpacing: 4,
                            ),
                        itemCount: 8 * 12,
                        itemBuilder: (context, index) {
                          final row = index ~/ 12;
                          final col = index % 12;
                          final seat = seats[row][col];

                          return GestureDetector(
                            onTap: () => _toggleSeat(row, col),
                            child: Container(
                              decoration: BoxDecoration(
                                color: seat.isBooked
                                    ? Colors.red[300]
                                    : seat.isSelected
                                    ? Colors.deepPurple
                                    : Colors.grey[300],
                                borderRadius: BorderRadius.circular(4),
                                border: seat.isSelected
                                    ? Border.all(
                                        color: Colors.deepPurple,
                                        width: 2,
                                      )
                                    : null,
                              ),
                              child: Center(
                                child: Text(
                                  '${String.fromCharCode(65 + row)}${col + 1}',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: seat.isBooked
                                        ? Colors.white
                                        : seat.isSelected
                                        ? Colors.white
                                        : Colors.black87,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

          // Bottom Section
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Column(
              children: [
                // Selected Seats and Price
                if (selectedSeats.isNotEmpty) ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Selected: ${selectedSeats.join(", ")}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '\$${totalPrice.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],

                // Continue Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed:
                        selectedShowTime.isNotEmpty && selectedSeats.isNotEmpty
                        ? () => _proceedToBooking(context)
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      selectedShowTime.isEmpty
                          ? 'Select Show Time'
                          : selectedSeats.isEmpty
                          ? 'Select Seats'
                          : 'Continue to Payment',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _proceedToBooking(BuildContext context) {
    Navigator.pop(context); // Close seat selection
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => BookingConfirmationModal(
        movie: widget.movie,
        showTime: selectedShowTime,
        selectedSeats: selectedSeats,
        totalPrice: totalPrice,
      ),
    );
  }
}

class SeatStatus {
  final int row;
  final int col;
  final bool isBooked;
  bool isSelected;

  SeatStatus({
    required this.row,
    required this.col,
    required this.isBooked,
    required this.isSelected,
  });
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String label;

  const _LegendItem({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
