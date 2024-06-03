class TransctionModel{
  num id;
  String title;
  String note;
  num amount;
  String type;

  TransctionModel({
    this.id=1,
    this.title="",
    this.note="",
    this.amount=0,
    this.type="EXPENSE",
});
}