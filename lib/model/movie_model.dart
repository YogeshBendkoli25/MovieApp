class MovieModel {
  double? score;
  Show? show;

  MovieModel({this.score, this.show});

  MovieModel.fromJson(Map<String, dynamic> json) {
    score = json['score'];
    show = json['show'] != null ? new Show.fromJson(json['show']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['score'] = this.score;
    if (this.show != null) {
      data['show'] = this.show!.toJson();
    }
    return data;
  }
}

class Show {
  int? id;
  String? url;
  String? name;
  String? type;
  String? language;
  List<String>? genres;
  String? status;
  int? runtime;
  double? averageRuntime; // Change made here for potential float values
  String? premiered;
  String? ended;
  String? officialSite;
  Schedule? schedule;
  Rating? rating;
  num? weight;
  Network? network;
  dynamic webChannel;
  dynamic dvdCountry;
  Externals? externals;
  Image? image;
  String? summary;
  int? updated;
  Links? lLinks;

  Show({
    this.id,
    this.url,
    this.name,
    this.type,
    this.language,
    this.genres,
    this.status,
    this.runtime,
    this.averageRuntime,
    this.premiered,
    this.ended,
    this.officialSite,
    this.schedule,
    this.rating,
    this.weight,
    this.network,
    this.webChannel,
    this.dvdCountry,
    this.externals,
    this.image,
    this.summary,
    this.updated,
    this.lLinks,
  });

  Show.fromJson(Map<String, dynamic> json) {
  id = json['id'];
  url = json['url'];
  name = json['name'];
  type = json['type'];
  language = json['language'];
  genres = json['genres']?.cast<String>();
  status = json['status'];
  runtime = json['runtime'] != null ? (json['runtime'] as num?)?.toInt() : null;
  averageRuntime = json['averageRuntime'] != null
      ? (json['averageRuntime'] as num?)?.toDouble()
      : null;
  premiered = json['premiered'];
  ended = json['ended'];
  officialSite = json['officialSite'];
  schedule = json['schedule'] != null
      ? Schedule.fromJson(json['schedule'])
      : null;
  rating = json['rating'] != null ? Rating.fromJson(json['rating']) : null;
  weight = (json['weight'] != null ? (json['weight'] as num?)?.toInt() : null)!;
  network = json['network'] != null ? Network.fromJson(json['network']) : null;
  webChannel = json['webChannel'];
  dvdCountry = json['dvdCountry'];
  externals = json['externals'] != null
      ? Externals.fromJson(json['externals'])
      : null;
  image = json['image'] != null ? Image.fromJson(json['image']) : null;
  summary = json['summary'];
  updated = json['updated'] != null ? (json['updated'] as num?)?.toInt() : null;
  lLinks = json['_links'] != null ? Links.fromJson(json['_links']) : null;
}


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['url'] = url;
    data['name'] = name;
    data['type'] = type;
    data['language'] = language;
    data['genres'] = genres;
    data['status'] = status;
    data['runtime'] = runtime;
    data['averageRuntime'] = averageRuntime;
    data['premiered'] = premiered;
    data['ended'] = ended;
    data['officialSite'] = officialSite;
    if (schedule != null) {
      data['schedule'] = schedule!.toJson();
    }
    if (rating != null) {
      data['rating'] = rating!.toJson();
    }
    data['weight'] = weight;
    if (network != null) {
      data['network'] = network!.toJson();
    }
    data['webChannel'] = webChannel;
    data['dvdCountry'] = dvdCountry;
    if (externals != null) {
      data['externals'] = externals!.toJson();
    }
    if (image != null) {
      data['image'] = image!.toJson();
    }
    data['summary'] = summary;
    data['updated'] = updated;
    if (lLinks != null) {
      data['_links'] = lLinks!.toJson();
    }
    return data;
  }
}


class Schedule {
  String? time;
  List<String>? days;

  Schedule({this.time, this.days});

  Schedule.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    days = json['days'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['days'] = this.days;
    return data;
  }
}

class Rating {
  num? average;

  Rating({this.average});

  Rating.fromJson(Map<String, dynamic> json) {
    average = json['average'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['average'] = this.average;
    return data;
  }
}

class Network {
  int? id;
  String? name;
  Country? country;
  String? officialSite;

  Network({this.id, this.name, this.country, this.officialSite});

  Network.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    country =
        json['country'] != null ? new Country.fromJson(json['country']) : null;
    officialSite = json['officialSite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.country != null) {
      data['country'] = this.country!.toJson();
    }
    data['officialSite'] = this.officialSite;
    return data;
  }
}

class Country {
  String? name;
  String? code;
  String? timezone;

  Country({this.name, this.code, this.timezone});

  Country.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    code = json['code'];
    timezone = json['timezone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['code'] = this.code;
    data['timezone'] = this.timezone;
    return data;
  }
}

class Externals {
  Null? tvrage;
  int? thetvdb;
  String? imdb;

  Externals({this.tvrage, this.thetvdb, this.imdb});

  Externals.fromJson(Map<String, dynamic> json) {
    tvrage = json['tvrage'];
    thetvdb = json['thetvdb'];
    imdb = json['imdb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tvrage'] = this.tvrage;
    data['thetvdb'] = this.thetvdb;
    data['imdb'] = this.imdb;
    return data;
  }
}

class Image {
  String? medium;
  String? original;

  Image({this.medium, this.original});

  Image.fromJson(Map<String, dynamic> json) {
    medium = json['medium'];
    original = json['original'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['medium'] = this.medium;
    data['original'] = this.original;
    return data;
  }
}

class Links {
  Self? self;
  Previousepisode? previousepisode;

  Links({this.self, this.previousepisode});

  Links.fromJson(Map<String, dynamic> json) {
    self = json['self'] != null ? new Self.fromJson(json['self']) : null;
    previousepisode = json['previousepisode'] != null
        ? new Previousepisode.fromJson(json['previousepisode'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.self != null) {
      data['self'] = this.self!.toJson();
    }
    if (this.previousepisode != null) {
      data['previousepisode'] = this.previousepisode!.toJson();
    }
    return data;
  }
}

class Self {
  String? href;

  Self({this.href});

  Self.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    return data;
  }
}

class Previousepisode {
  String? href;
  String? name;

  Previousepisode({this.href, this.name});

  Previousepisode.fromJson(Map<String, dynamic> json) {
    href = json['href'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    data['name'] = this.name;
    return data;
  }
}