class FForm {
  final String formkey;
  final List<List> responsedata; // [{'question':'answer'}]
  final String eventname;
  final String adminid;

  FForm({
    required this.formkey,
    required this.responsedata,
    required this.adminid,
    required this.eventname,
  });
}
