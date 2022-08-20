import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_player/musics.dart';

class Player extends StatefulWidget {
  const Player({ Key? key, required this.music}) : super(key: key);
  
  final Music music;

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  
  bool isPlaying = false;
  final audioPlayer = AudioPlayer();
  Duration duration = Duration.zero;
  Duration position = Duration.zero;


  @override
  void initState() {
    
    audioPlayer.onPlayerStateChanged.listen((audioState) {             //event 1
      
      setState(() {
        isPlaying = audioState == PlayerState.PLAYING;
      });
    });

    audioPlayer.onAudioPositionChanged.listen((audioDuration) {       //event 2
      
      setState(() {
        duration = audioDuration;
      });
    });

    audioPlayer.onAudioPositionChanged.listen((audioPosition) {       //event 3

      setState(() {
        position = audioPosition;
      });
    });

    super.initState();
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
    appBar: AppBar(
          title: Text(
            widget.music.title,
            style: GoogleFonts.montserrat()
            ),
          backgroundColor: Colors.black87,
        ),  
        body: Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
            child: Column(
              children: [
                Container(
                  height: 270,
                  width: 270,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(widget.music.image,
                    fit: BoxFit.cover,
                    ),
                  ),
                ),

                SizedBox(height: 50),

              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.music.title,
                    style: GoogleFonts.montserrat(
                    fontSize:17,
                    fontWeight: FontWeight.w700,
                    ),
                    ),
                  Text(
                    widget.music.artist,
                    style: GoogleFonts.montserrat(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    ),
                    ),
                ],
              ),
              SizedBox(height: 30),

              SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    valueIndicatorColor: Color.fromARGB(255, 79, 206, 206), // This is what you are asking for
                    inactiveTrackColor: Color.fromARGB(255, 36, 36, 37), // Custom Gray Color
                    activeTrackColor: Color.fromARGB(255, 34, 34, 34),
                    thumbColor: Color.fromARGB(255, 79, 206, 206),
                    overlayColor: Color.fromARGB(41, 36, 36, 40),  // Custom Thumb overlay Color
                    thumbShape:
                        RoundSliderThumbShape(enabledThumbRadius: 12.0),
                    overlayShape:
                        RoundSliderOverlayShape(overlayRadius: 20.0),
                  ),

                child: Slider(
                  
                  min: 0,
                  max: duration.inSeconds.toDouble(),
                  value: position.inSeconds.toDouble(), 
                  onChanged: (value) async{
                    
                    position = Duration(seconds: value.toInt());
                    await audioPlayer.seek(position);

                  }
                  )
              ),

                IconButton(

                  onPressed: () async{

                     if(isPlaying == true)
                     {
                       await audioPlayer.pause();
                     }
                     else
                     {
                       await audioPlayer.play(widget.music.url);
                     }
                  },
                  icon: Icon(isPlaying?Icons.pause_circle:Icons.play_circle),
                  iconSize: 70,
                  color: Color.fromARGB(255, 79, 206, 206),
                  ),
              ],
            ),
          ),
        ),
    );
  }
}
