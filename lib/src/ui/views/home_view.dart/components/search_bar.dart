import 'package:canton_design_system/canton_design_system.dart';

class SearchBar extends StatelessWidget {
  const SearchBar(this.search);

  final void Function(String) search;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
          padding: MediaQuery.of(context).viewInsets,
          child: CantonTextInput(
            hintText: 'Search',
            isTextFormField: false,
            obscureText: false,
            containerPadding: const EdgeInsets.all(10),
            radius: BorderRadius.circular(30),
            controller: TextEditingController(),
            onChanged: (query) {
              search(query);
            },
            prefixIcon: Icon(
              Iconsax.search_normal_1,
              color: Theme.of(context).colorScheme.secondaryVariant,
            ),
          ),
        ),
        Divider(),
      ],
    );
  }
}
