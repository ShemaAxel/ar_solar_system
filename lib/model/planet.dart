import 'dart:math';

class Planet {
  String name;
  String image;
  String distFromSun;
  String description;
  String moons;
  String hours;
  String life;
  String radius;
  String flatImage;
  Planet(
      {this.name,
      this.distFromSun,
      this.image,
      this.description,
      this.hours,
      this.life,
      this.moons,
      this.radius,
      this.flatImage});
}

List<Planet> planets = [
  Planet(
      image: 'assets/images/8.png',
      name: 'Neptune',
      distFromSun: '4.4 billion',
      description:
          'Neptune is the eighth and farthest-known Solar planet from the Sun. In the Solar System, it is the fourth-largest planet by diameter, the third-most-massive planet, and the densest giant planet.',
      hours: '16h',
      life: 'NO',
      moons: '14',
      radius: '24,622',
      flatImage: 'assets/images/neptune.jpeg'),
  Planet(
      image: 'assets/images/7.png',
      name: 'Uranus',
      distFromSun: '2.8 billion',
      description:
          'Uranus is the seventh planet from the Sun. Its name is a reference to the Greek god of the sky, Uranus, who, according to Greek mythology, was the great-grandfather of Ares, grandfather of Zeus and father of Cronus.',
      hours: '17h',
      life: 'NO',
      moons: '27',
      radius: '25,362',
      flatImage: 'assets/images/uranus.jpeg'),
  Planet(
      image: 'assets/images/6.png',
      name: 'Saturn',
      distFromSun: '1.4 billion',
      description:
          'Saturn is the sixth planet from the Sun and the second-largest in the Solar System, after Jupiter. It is a gas giant with an average radius of about nine and a half times that of Earth. It only has one-eighth the average density of Earth; however, with its larger volume, Saturn is over 95 times more massive.',
      hours: '11h',
      life: 'NO',
      moons: '82',
      radius: '58,232',
      flatImage: 'assets/images/earth.jpg'),
  Planet(
      image: 'assets/images/5.png',
      name: 'Jupiter',
      distFromSun: '778.5 million',
      description:
          'Jupiter is the fifth planet from the Sun and the largest in the Solar System. It is a gas giant with a mass two and a half times that of all the other planets in the Solar System combined, but less than one-thousandth the mass of the Sun.',
      hours: '10h',
      life: 'NO',
      moons: '79',
      radius: '69,911',
      flatImage: 'assets/images/jupiter.jpeg'),
  Planet(
      image: 'assets/images/4.png',
      name: 'Mars',
      distFromSun: '227.9 million',
      description:
          'Mars is the fourth planet from the Sun and the second-smallest planet in the Solar System, being larger than only Mercury. In English, Mars carries the name of the Roman god of war and is often referred to as the "Red Planet".',
      hours: '25h',
      life: 'Lol',
      moons: '2',
      radius: '3,389',
      flatImage: 'assets/images/mars.jpeg'),
  Planet(
      image: 'assets/images/3.png',
      name: 'Earth',
      distFromSun: '149.6 million',
      description:
          'Earth is the third planet from the Sun and the only astronomical object known to harbor and support life. About 29.2% of Earth\'s surface is land consisting of continents and islands.',
      hours: '24h',
      life: 'YES',
      moons: '1',
      radius: '6,371',
      flatImage: 'assets/images/earth.jpg'),
  Planet(
      image: 'assets/images/2.png',
      name: 'Venus',
      distFromSun: '108.2 million',
      description:
          'Venus is the second planet from the Sun. It is named after the Roman goddess of love and beauty. As the brightest natural object in Earth\'s night sky after the Moon, Venus can cast shadows and can be, on rare occasions, visible to the naked eye in broad daylight.',
      hours: '18h',
      life: 'NO',
      moons: '0',
      radius: '6,051',
      flatImage: 'assets/images/venus.jpeg'),
  Planet(
      image: 'assets/images/1.png',
      name: 'Mercury',
      distFromSun: '57.9 million',
      description:
          'Mercury is the smallest planet in the Solar System and the closest to the Sun. Its orbit around the Sun takes 87.97 Earth days, the shortest of all the Sun\'s planets.',
      hours: '15h',
      life: 'NO',
      moons: '0',
      radius: '2,439',
      flatImage: 'assets/images/mercury.jpeg'),
  Planet(
    image: 'assets/images/1.png',
    name: 'SUN',
    distFromSun: '',
  ),
];
