class FakeUser{
  double bigoId;
  String name;
  String profilePhotoUrl;
  bool isOnline;
  double stockCount;
  List<FakeUser> subUserList;
  FakeUser(this.bigoId, this.name, this.isOnline, this.stockCount, this.profilePhotoUrl, {this.subUserList});
}

class FakeBankIban{
  String title;
  String iban;
  FakeBankIban(this.title, this.iban);
}

class FakeOrder{
  FakeUser user;
  int itemCount;
  double price;
  String date;
  int orderStatus;  // 0: waiting, 1: processing, 2: approved
  FakeOrder(this.user, this.itemCount, this.price, this.date, this.orderStatus);
}

class FakeData{
  static List<FakeUser> userList = [
    FakeUser(3253, "Merve", true, 75, "https://images.pexels.com/photos/4026110/pexels-photo-4026110.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500", subUserList: [
      FakeUser(5135, "Esra", false, 48, "https://images.pexels.com/photos/3541390/pexels-photo-3541390.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
      FakeUser(4255, "Adem", false, 26, "https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
      FakeUser(1355, "Selin", true, 65, "https://images.pexels.com/photos/2718758/pexels-photo-2718758.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500")
    ]),
    FakeUser(4366, "Burak", false, 93, "https://images.pexels.com/photos/2379005/pexels-photo-2379005.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500", subUserList: [
      FakeUser(5737, "Tülin", true, 09, "https://images.pexels.com/photos/2100063/pexels-photo-2100063.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500")
    ]),
    FakeUser(7585, "Şahin", true, 77, "https://images.pexels.com/photos/2128807/pexels-photo-2128807.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500", subUserList: [
      FakeUser(5795, "Aslı", false, 18, "https://images.pexels.com/photos/1458332/pexels-photo-1458332.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500")
    ])
  ];

  static List<FakeBankIban> bankList = [
    FakeBankIban("Ziraat Bankası", "1111 1111 1111 1111 1111 1111"),
    FakeBankIban("Akbank", "1111 1111 1111 1111 1111 1111"),
    FakeBankIban("Yapı ve Kredi Bankası AŞ.", "1111 1111 1111 1111 1111 1111"),
    FakeBankIban("İş Bankası", "1111 1111 1111 1111 1111 1111"),
    FakeBankIban("İş Bankası", "1111 1111 1111 1111 1111 1111"),
    FakeBankIban("Vakıflar Bankası T.A.O", "1111 1111 1111 1111 1111 1111"),
  ];

  static List<FakeOrder> orderList = [
    FakeOrder(userList[0].subUserList[2], 515, 10, "2021.02.18 19:23:24", 0),
    FakeOrder(userList[0].subUserList[1], 543, 15, "2021.02.18 19:23:24", 1),
    FakeOrder(userList[0].subUserList[0], 346, 5, "2021.02.18 19:23:24", 2),
    FakeOrder(userList[1].subUserList[0], 253, 1, "2021.02.18 19:23:24", 1),
    FakeOrder(userList[2].subUserList[0], 625, 45, "2021.02.18 19:23:24", 2),
    FakeOrder(userList[1].subUserList[0], 242, 34, "2021.02.18 19:23:24", 2),
    FakeOrder(userList[0].subUserList[0], 235, 30, "2021.02.18 19:23:24", 0),
    FakeOrder(userList[0].subUserList[2], 625, 90, "2021.02.18 19:23:24", 1),
    FakeOrder(userList[1].subUserList[0], 848, 75, "2021.02.18 19:23:24", 0),
    FakeOrder(userList[0].subUserList[1], 148, 15, "2021.02.18 19:23:24", 1),
    FakeOrder(userList[0].subUserList[2], 253, 10, "2021.02.18 19:23:24", 0),
    FakeOrder(userList[1].subUserList[0], 259, 20, "2021.02.18 19:23:24", 0),
  ];
}