import 'package:dunya_ulkeleri/model/country.dart';
import 'package:dunya_ulkeleri/view_model/main_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ülkeler"),
      ),
      body: _buildCountryList(context),
    );
  }

  Widget _buildCountryList(BuildContext context) {
    return Consumer<MainViewModel>(
      builder: (context, viewModel, child) => ListView.builder(
        itemCount: viewModel.countries.length,
        itemBuilder: (context, index) {
          Country country = viewModel.countries[index];
          return ListTile(
            title: Text(country.name),
            subtitle: Text(country.capital),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(country.flag),
            ),
          );
        },
      ),
    );
  }
}
