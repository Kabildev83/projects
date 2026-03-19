import 'package:flutter/material.dart';

class TableData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Table(
          border: TableBorder.all(color: Colors.black), // Set the border color
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            _buildTableRow(context, 'Title 1', 'Title 2', 'Title 3', true),
            ...List.generate(
              10,
                  (index) => _buildTableRow(context, 'Cell 1.$index', 'Cell 2.$index', 'Cell 3.$index', false, rowIndex: index),
            ),
          ],
        ),
      ),
    );
  }

  TableRow _buildTableRow(
      BuildContext context, String cell1, String cell2, String cell3, bool isHeader, {int? rowIndex}) {
    return TableRow(
      children: [
        _buildTableCell(context, cell1, isHeader, rowIndex, 0),
        _buildTableCell(context, cell2, isHeader, rowIndex, 1),
        _buildTableCell(context, cell3, isHeader, rowIndex, 2),
      ],
    );
  }

  Widget _buildTableCell(BuildContext context, String text, bool isHeader, int? rowIndex, int columnIndex) {
    return GestureDetector(
      onTap: () {
        // Show an alert dialog with the tapped column content
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(isHeader ? 'Header Row Tapped' : 'Row/Column Tapped'),
              content: Text(isHeader
                  ? 'You tapped on the header row.'
                  : rowIndex == null
                  ? 'You tapped on Column $columnIndex: $text'
                  : 'You tapped on Row ${rowIndex + 1}: $text'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      },
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
