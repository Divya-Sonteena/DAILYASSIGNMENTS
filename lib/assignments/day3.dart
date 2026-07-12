import 'package:flutter/material.dart';

class Registrationpage extends StatefulWidget {
  const Registrationpage({super.key});

  @override
  State<Registrationpage> createState() => _RegistrationpageState();
}

class _RegistrationpageState extends State<Registrationpage> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _middleNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  String? _gender;
  String? _selectedCity;
  bool _acceptTerms = false;
  bool _isRegisteredSuccessfully = false;
  final List<String> _cities = ["HYD", "kkd", "vizag", "delhi"];

  void _showAlertDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Invalid Input'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final phone = _phoneController.text.trim();
      if (phone.length != 10 || int.tryParse(phone) == null) {
        _showAlertDialog('Please enter a valid 10-digit phone number.');
        return;
      }
      if (_gender == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select your gender')),
        );
        return;
      }
      if (_selectedCity == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select your city')),
        );
        return;
      }
      if (!_acceptTerms) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please accept the terms and conditions')),
        );
        return;
      }
      setState(() {
        _isRegisteredSuccessfully = true;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Registration Successful!'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration Screen'),
        backgroundColor: Theme.of(context).canvasColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (_isRegisteredSuccessfully) ...[
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: Colors.green.shade100,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: Colors.green),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.check_circle, color: Colors.green),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'You have successfully registered',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
              ],
              const Text(
                'Create Your Account',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _firstNameController,
                decoration: const InputDecoration(
                  labelText: 'First Name *',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) => value == null || value.trim().isEmpty ? 'First name is mandatory' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _middleNameController,
                decoration: const InputDecoration(
                  labelText: 'Middle Name',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person_outline),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _lastNameController,
                decoration: const InputDecoration(
                  labelText: 'Last Name *',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) => value == null || value.trim().isEmpty ? 'Last name is mandatory' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email Address',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (value) => value == null || !value.contains('@') ? 'Enter a valid email' : null,
                onTapOutside: (event) {
                  final value = _emailController.text;
                  if (value.isNotEmpty && !value.contains('@')) {
                    _showAlertDialog('Please enter a valid email "@" symbol is missing.');
                  }
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                maxLength: 10,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone),
                  counterText: "",
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
                onTapOutside: (event) {
                  final value = _phoneController.text.trim();
                  if (value.isNotEmpty && (value.length != 10 || int.tryParse(value) == null)) {
                    _showAlertDialog('Please enter a valid 10-digit phone number.');
                  }
                },
              ),
              const SizedBox(height: 30),
              const Text('Gender', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Row(
                children: ['Male', 'Female','prefer not to say'].map((String option) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Radio<String>(
                        value: option,
                        groupValue: _gender,
                        onChanged: (val) => setState(() => _gender = val),
                      ),
                      Text(option),
                      const SizedBox(width: 16),
                    ],
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),
              const Text('Select City', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              DropdownButton<String>(
                value: _selectedCity,
                hint: const Text('Choose a city'),
                isExpanded: true,
                items: _cities.map((String city) {
                  return DropdownMenuItem<String>(value: city, child: Text(city));
                }).toList(),
                onChanged: (val) => setState(() => _selectedCity = val),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Checkbox(
                    value: _acceptTerms,
                    onChanged: (val) => setState(() => _acceptTerms = val!),
                  ),
                  const Expanded(child: Text('I accept the Terms and Conditions')),
                ],
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('SUBMIT REGISTRATION', style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
