class UnbordingContent {
  String image;
  String title;
  String description;

  UnbordingContent(
  {required this.description, required this.image, required this.title}){}
}

List<UnbordingContent> contetns=[
  UnbordingContent(description: 'Best Takeaway in Town!\n    More than 35 dishes!',
      image: "images/screen1.png",
      title: 'Select from the best\n   Best Dishes'),
      UnbordingContent(description: 'You can pay cash on delivary or\n    Card Payment is available',
          image: "images/screen2.PNG",
          title: 'Easy and Online Payment'),
      UnbordingContent(description: 'Deliver your food ar your\n            Doorstep',
          image: "images/screen3.PNG",
          title: 'Quick Delivary at Your Doorstep')
];