class FilterItem {
  final String title;
  final List<String> options;
  final void Function(String) onSelected;

  FilterItem({required this.title, required this.options, required this.onSelected});
}