class MultiRecipientModel{
  bool isSelected;
  String email;
  MultiRecipientModel(this.isSelected,this.email);
  set setSelected(bool isSelected){
    this.isSelected=isSelected;
  }
  bool get getSelected => isSelected;
  String get getEmail => email;
}