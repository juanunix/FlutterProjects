class FlutterTeamModel{

  final int id;
  final String name;
  final String position;
  final String image;
  final String address;

  FlutterTeamModel(this.id, this.name, this.position, this.image, this.address);

  static List<FlutterTeamModel>  getFlutterTeamList() {
    var  list = new List<FlutterTeamModel>();

    list.add(FlutterTeamModel(0, 'Eric Seidel', 'Eng Mgr.',
        'https://pbs.twimg.com/profile_images/947228834121658368/z3AHPKHY_400x400.jpg',
        'California, USA'));
    list.add(FlutterTeamModel(1, 'Tim Sneath', 'Product Manager',
        'https://pbs.twimg.com/profile_images/653618067084218368/XlQA-oRl_400x400.jpg',
        'Seattle, WA'));

    list.add(FlutterTeamModel(2, 'Filip Hráček', 'Software Eng',
        'https://pbs.twimg.com/profile_images/796079953079111680/ymD9DY5g_400x400.jpg',
        'Mountain View, CA'));
    list.add(FlutterTeamModel(3, 'Emily Fortuna', 'Dev Advocate',
        'http://www.emilyfortuna.com/wp-content/uploads/2013/12/MG_0486smaller-673x1024.jpg',
        'Seattle'));
    list.add(FlutterTeamModel(4, 'Andrew Brogdon', 'Software',
        'https://pbs.twimg.com/profile_images/651444930884186112/9vlhNFlu_400x400.png',
        'USA'));
    list.add(FlutterTeamModel(5, 'Seth Ladd', 'Product Manager',
        'https://pbs.twimg.com/profile_images/986316447293952000/oZWVUWDs_400x400.jpg',
        'Mountain View, CA'));
    list.add(FlutterTeamModel(6, 'Nilay Yener', 'People',
        'https://pbs.twimg.com/media/DtvqWggU4AAs-QN.jpg',
        'USA'));

    list.add(FlutterTeamModel(7, 'Matt Sullivan', 'Dev Advocate', 'https://pbs.twimg.com/profile_images/1019713543657086976/sHuPNy5Q_400x400.jpg', 'Mountain View, CA'));

    list.add(FlutterTeamModel(8, 'Martin Aguinis', 'Marketing Lead', 'https://pbs.twimg.com/media/DocdLRSUYAAGxL4.jpg', 'USA'));

    list.add(FlutterTeamModel(9, 'Flutter Fb Group', 'Support',
        'https://cdn-images-1.medium.com/max/1200/1*5-aoK8IBmXve5whBQM90GA.png',
        'World'));
    return list;
  }
}
