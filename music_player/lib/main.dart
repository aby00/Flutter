import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_player/musics.dart';
import 'package:music_player/player.dart';

void main() { 
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  late List musicList;

  @override
  initState()
  {
    musicList=getList();
    super.initState();
  }

  List getList()
  {
    return[
      Music(
        title: "Best Song Ever", 
        image: "https://i.scdn.co/image/ab67616d0000b2732f76b797c382bedcafdf45e1", 
        artist: "One Direction", 
        url: "https://www.woo55.pk/adata/9377/One%20Direction%20-%20Best%20Song%20Ever%20(www.SongsLover.pk).mp3"
        ),
        Music(
        title: "Chlorine", 
        image: "https://cdns-images.dzcdn.net/images/cover/a87326124012a9f24354a6d5626c0338/500x500.jpg", 
        artist: "Twenty One Pilots", 
        url: "https://naijafinix.com/wp-content/uploads/2021/12/twenty-one-pilots-Chlorine-via-Naijafinix.com_.mp3"
        ),
        Music(
        title: "Watermelon Sugar", 
        image: "https://s3.amazonaws.com/media.thecrimson.com/photos/2019/12/23/134355_1341763.jpg", 
        artist: "Harry Styles", 
        url: "https://manyuploading.com/tracks/Harry%20Styles%20-%20Watermelon%20Sugar%20-%20(SongsLover.com).mp3"
        ),
        Music(
        title: "Enemy", 
        image: "https://pagalworld.nl/siteuploads/thumb/sft65/32474_resize2x_130x130.webp", 
        artist: "Imagine Dragons", 
        url: "https://pagalworld.nl/files/download/id/32474"
        ),
        Music(
        title: "Bones", 
        image: "https://i.scdn.co/image/ab67616d0000b273813713582dcc508e7d5073c4", 
        artist: "Imagine Dragons", 
        url: "https://pagalaworld.in/files/download/id/34168"
        ),
        Music(
        title: "Cheap Thrills", 
        image: "https://upload.wikimedia.org/wikipedia/en/f/fc/Sia_Cheap_Thrills.png", 
        artist: "Sia (ft. Sean Paul)", 
        url: "https://pagalworld.com.se/files/download/id/4250"
        ),
        Music(
        title: "Industry Baby", 
        image: "https://upload.wikimedia.org/wikipedia/en/f/f7/Lil_Nas_X_-_Industry_Baby.png", 
        artist: "Lil Nas X, Jack Harlow", 
        url: "https://pagalworldi.com/files/download/id/4033"
        ),
        Music(
        title: "Holy", 
        image: "https://upload.wikimedia.org/wikipedia/en/thumb/8/8d/Holy_-_Justin_Bieber.png/220px-Holy_-_Justin_Bieber.png", 
        artist: "Justin  Beiber", 
        url: "https://pagalworld.nl/files/download/id/16974"
        ),
        Music(
        title: "Uptown Funk", 
        image: "https://i.scdn.co/image/ab67616d0000b273e419ccba0baa8bd3f3d7abf2", 
        artist: "Mark Ronson (feat. Bruno Mars)", 
        url: "https://pagalworldi.com/files/download/id/2728"
        ),
        Music(
        title: "All of Me", 
        image: "https://i.scdn.co/image/ab67616d00001e029365dde25000bb00e2c0443e", 
        artist: "John Legend", 
        url: "https://www1.morexlusive.com/wp-content/uploads/2022/01/John_Legend_-_All_Of_Me.mp3"
        ),
        Music(
        title: "Hello", 
        image: "https://i.scdn.co/image/ab67616d0000b27323d302c1290685258a400ad0", 
        artist: "Adele", 
        url: "https://jesusful.com/wp-content/uploads/music/2021/12/Adele_-_Hello_(Jesusful.com).mp3"
        ),
        Music(
        title: "Rolling in the Deep", 
        image: "https://i.scdn.co/image/ab67616d0000b27333f4b6a81ff2d5be5f2cf917", 
        artist: "Adele", 
        url: "https://jesusful.com/wp-content/uploads/music/2022/02/Adele_-_Rolling_in_the_Deep_(Jesusful.com).mp3"
        ),
        Music(
        title: "Bang Bang", 
        image: "https://upload.wikimedia.org/wikipedia/en/3/38/Jessie_J_-_Bang_Bang_%28featuring_Ariana_Grande_%26_Nicki_Minaj%29_Cover_Art.png", 
        artist: "Ariana Grande, Jessie J, Nicki Minaj", 
        url: "https://pagalworld.nl/files/download/id/24243"
        ),
    ];
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Music Player",
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w500
          )
          ),
          backgroundColor: Colors.black87,
        ),
      
      body: Stack(
        children: [
          Container(
            color: Colors.black12,
          ),
    
          Expanded(
            child: ListView.builder(
              itemCount: musicList.length,
              itemBuilder: (context,index)=> InkWell(
                onTap: (){
                   Navigator.push(context, 
                   MaterialPageRoute(builder: (context)=>
                   Player(music: musicList[index])
                   ));
                },
                child: Padding(
                  padding: EdgeInsets.all(20),
                   child: Row(
                    children: [
                     Container(
                       height: 75,
                       width: 75,
                       child: ClipRRect(
                       borderRadius: BorderRadius.circular(8),
                       child: Image.network(
                         musicList[index].image,
                         fit: BoxFit.cover,
                       ),
                    ),
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(musicList[index].title, style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                        ),
                        ),
                        SizedBox(height: 5),
                        Text(musicList[index].artist, style: const TextStyle(
                          fontSize: 12.2,                          
                        ),)
                      ],
                    ),
                    Spacer(),
                    Icon(Icons.play_circle_fill,
                    color: Color.fromARGB(103, 0, 0, 0),
                    size: 45,
                    ),
                  ]),
                ),
              )
                ),
          ),
        ],
      ),
    ),
    );
  }
}