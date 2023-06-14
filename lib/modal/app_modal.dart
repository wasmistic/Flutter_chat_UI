class VerticalList{
    final String? img;
    final String? to;
    final String? from;
    final String? min;
    final int? chat;

    VerticalList({this.img, this.to, this.from, this.min, this.chat,});
}


List<VerticalList> generateVerticalChatList(){
return[
   VerticalList(
       img:'m2.webp',
       chat: 2,
       from: 'Hello Ayo',
       to: 'What up Dare?',
       min: '2hrs'
   ),
    VerticalList(
        img:'m8.webp',
        chat: 15,
        from: 'Micheal where are u?',
        to: 'on my way',
        min: '7min'
    ),
    VerticalList(
        img:'m7.webp',
        chat: 3,
        from: 'Happy new month',
        to: 'Same to you',
        min: 'yesterday'
    ),
    VerticalList(
        img:'g5.webp',
        chat: 1,
        from: 'Good morning?',
        to: 'Morning blessing',
        min: '2hrs'
    ),
  VerticalList(
      img:'m6.webp',
      chat: 4,
      from: 'Happy birthday',
      to: '',
      min: '2hrs'
  ),
  VerticalList(
      img:'g3.webp',
      chat: 22,
      from: 'Check it again',
      to: 'Okay no problem i will',
      min: '2min'
  ),
  VerticalList(
      img:'g7.webp',
      chat: 2,
      from: 'Kemi are you back?',
      to: 'No am not around',
      min: '2min'
  ),
  VerticalList(
      img:'m3.webp',
      chat: 0,
      from: '',
      to: '',
      min: ''
  ),
];
}

class NameChatList{
  final String? img;
  final String? name;

  NameChatList({this.img, this.name,});
}

List<NameChatList> generateNameList(){
  return [
    NameChatList(
        img:'m1.webp',
        name:'David Micheal'
    ),
    NameChatList(
        img:'g1.webp',
        name:'Janet Isreal'
    ),
    NameChatList(
        img:'g2.webp',
        name:'Esther Joe'
    ),
    NameChatList(
        img:'g3.webp',
        name:'Emmanuella George'
    ),
    NameChatList(
        img:'g4.webp',
        name:'Emmanuella George'
    ),
    NameChatList(
        img:'g5.webp',
        name:'Kemi Paul'
    ),
    NameChatList(
        img:'g6.webp',
        name:'Blessing John'
    ),
  ];
}