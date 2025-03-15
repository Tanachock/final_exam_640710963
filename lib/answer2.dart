import 'package:flutter/material.dart';

class Answer2 extends StatefulWidget {
  const Answer2({super.key});

  @override
  State<Answer2> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Answer2> {
  double? _weight;
  bool _checkboxValue = false;
  bool _checkboxValue2 = false;
  int? _checkbox_Value;
  String? _selectedValue;
  int? _selected_Value;
  String? selectItem;
  int? select_Item;
  double? total;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('คำนวนค่าจัดส่ง'),
          centerTitle: false,
        ),
        body: Form(
          key: _formKey,
          // padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("น้ำหนักสินค้า (กก.):"),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter weight';
                  }
                  return null;
                },
                onChanged: (value) =>
                    setState(() => _weight = double.parse(value)),
              ),
              SizedBox(height: 16),
              Text("เลือกระยะทาง:"),
              SizedBox(height: 16),
              DropdownButton<String>(
                value: _selectedValue,
                hint: Text('เลือกระยะทาง'),
                items: [
                  DropdownMenuItem(
                    value: 'option1',
                    child: Text('ในเมือง'),
                  ),
                  DropdownMenuItem(
                    value: 'option2',
                    child: Text('ต่างจังหวัด'),
                  ),
                  DropdownMenuItem(
                    value: 'option3',
                    child: Text('ต่างประเทศ'),
                  ),
                ],
                onChanged: (String? value) {
                  // _selectedValue = value;
                  setState(() {
                    if (value == "option1") {
                      _selected_Value = 10;
                    } else if (value == "option2") {
                      _selected_Value = 15;
                    } else if (value == "option3") {
                      _selected_Value = 50;
                    }
                    _selectedValue = value;
                  });
                },
              ),
              SizedBox(height: 16),
              Text("บริการเสริม:"),
              Column(children: [
                CheckboxListTile(
                  title: Text('เพ็คกิ้งพิเศษ (+20 บาท)'),
                  value: _checkboxValue,
                  onChanged: (bool? value) {
                    if (value == true) {
                      setState(() {
                        _checkbox_Value = 20;
                        _checkboxValue = value!;
                      });
                    } else {
                      setState(() {
                        _checkbox_Value = 0;
                        _checkboxValue = value!;
                      });
                    }
                  },
                ),
                CheckboxListTile(
                  title: Text('ประกันพัสดุ (+50 บาท)'),
                  value: _checkboxValue2,
                  onChanged: (bool? value) {
                    if (value == true) {
                      setState(() {
                        _checkbox_Value = 50;
                        _checkboxValue2 = value!;
                      });
                    } else {
                      setState(() {
                        _checkbox_Value = 0;
                        _checkboxValue2 = value!;
                      });
                    }
                  },
                ),
              ]),
              SizedBox(height: 16),
              Text("เลือกความเร่งด่วน:"),
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Column(children: [
                  RadioListTile(
                    title: const Text('ปกติ'),
                    value: 'ปกติ',
                    groupValue: selectItem,
                    onChanged: (value) {
                      setState(() {
                        select_Item = 0;
                        selectItem = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text('ด่วน'),
                    value: 'ด่วน',
                    groupValue: selectItem,
                    onChanged: (value) {
                      setState(() {
                        select_Item = 30;
                        selectItem = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text('ด่วนพิเศษ'),
                    value: 'ด่วนพิเศษ',
                    groupValue: selectItem,
                    onChanged: (value) {
                      setState(() {
                        select_Item = 50;
                        selectItem = value.toString();
                      });
                    },
                  ),
                ]),
              ]),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {}
                    // เมื่อกดปุ่ม "คํานวนค่าจัดส่ง"
                    print("น้ำหนักสินค้า: $_weight");
                    print("เลือกระยะทาง: $_checkbox_Value");
                    print("บริการเสริม: $_selected_Value");
                    print("เลือกความเร่งด่วน: $select_Item");
                    // total = _weight ! * _checkbox_Value! + _selected_Value! + select_Item!;

                    if (_checkbox_Value == null) {
                      setState(() {
                        total = _weight! * _selected_Value! + select_Item!;
                      });
                    } else {
                      setState(() {
                        total = _weight! * _selected_Value! +
                            _checkbox_Value! +
                            select_Item!;
                      });
                    }
                    print("รวมค่าจัดส่ง: $total");
                  },
                  child: Text('คํานวนค่าจัดส่ง'),
                ),
              ),
              SizedBox(height: 16),
              if (total != null)
                // Center(
                //   child: Text(
                //     'รวมค่าจัดส่ง: $total บาท',
                //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, backgroundColor: Colors.blue),
                //   ),
                // ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Text(
                    'รวมค่าจัดส่ง: $total บาท',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
