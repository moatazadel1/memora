import 'package:flutter/material.dart';
import 'package:memora/config/routes/app_router.dart';

import 'edit_activities.dart';

class CurvedButtonBar extends StatefulWidget {
  final Function(int) onPressed;

  const CurvedButtonBar({Key? key, required this.onPressed}) : super(key: key);

  @override
  _CurvedButtonBarState createState() => _CurvedButtonBarState();
}

class _CurvedButtonBarState extends State<CurvedButtonBar> {
  int _selectedButtonIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: _buildButton(0, 'Today'),
          ),
          Expanded(
            child: _buildButton(1, 'Schedule'),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(int index, String label) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedButtonIndex = index;
        });
        widget.onPressed(index);
        if (index == 1) { // If Schedule button is pressed
         Navigator.pushNamed(context, AppRoutesName.editAct);
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: _selectedButtonIndex == index ? Color(0xFF0B8FAC) : Colors.transparent,
          borderRadius: BorderRadius.horizontal(
            left: _selectedButtonIndex == index ? Radius.circular(100) : Radius.zero,
            right: _selectedButtonIndex == index ? Radius.circular(100) : Radius.zero,
          ),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: _selectedButtonIndex == index ? Colors.white : Colors.grey,
            fontSize: 18,fontWeight: FontWeight.w400

          ),
        ),
      ),
    );
  }
}
