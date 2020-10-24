class Band {
  String id;

  String name;
  int vote;

  Band({
    this.id,
    this.name,
    this.vote
  });


  factory Band.fromMap( Map<String, dynamic> object) 
    => Band(
      id: object['id'],
      name: object['name'],
      vote: object['votes']
    );

}