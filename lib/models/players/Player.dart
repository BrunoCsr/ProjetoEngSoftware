class Player {
  final String _name;
  final String _age;
  double life = 100;
  bool dead = false;

  Player(
    this._name,
    this._age,
  );

  void revive() {
    life = 100;
  }

  bool checkLowLife() {
    bool low = false;
    life > 20 ? low = true : low = false;
    return low;
  }

  void takeDamage(Player player) {
    checkLowLife() ? player.life -= 10 : revive();
  }
}
