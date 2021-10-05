import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/screens/movies_listd.dart';

class StartPage extends StatefulWidget {
  StartPage({Key? key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Form(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkbICwbXCm3TL9T-jzoWAbJZrpfPcxdoYlrsGnLcpxvxcJ8zQK_yQTrL84MjGNcIfWm5w&usqp=CAU'),
                  fit: BoxFit.cover)),
          child: Column(
            children: [
              Container(
                height: 220,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'ReviewHat',
                      style: GoogleFonts.lobster(
                        textStyle: TextStyle(color: Colors.blue, fontSize: 45),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 450,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                    
                         Container(
                            height: 45,
                            width: double.infinity,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary:
                                      Colors.blue, // set the background color
                                  onPrimary: Colors.white,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MovieList()));
                                },
                                child: Text('Explore'),
                              ),
                            )),
                      
                      SizedBox(height: 10),
                    ],
                  ))
            ],
          ),
        ),
      )),
    );
  }
}
