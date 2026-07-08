import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:weatherapp/models/weather_model.dart';


class Home extends StatefulWidget {
  const Home({Key? key, required this.weatherModel}) : super(key: key);
  final WeatherModel weatherModel;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isclicked = false;

  @override
  Widget build(BuildContext context) {
    var list = widget.weatherModel.forcastDay[0].hour;
    return Scaffold(
      backgroundColor: HexColor('0xFF0B132B'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 50,
            left: 20,
            right: 20,
            bottom: 20,
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                width: double.infinity,
                height: 30,
                decoration: BoxDecoration(
                  color: HexColor('#b1bee6').withOpacity(0.15),
                ),
                child: Text(
                  'TODAY\'S WEATHER',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              AnimatedSize(
                duration: Duration(milliseconds: 800),
                curve: Curves.easeInOut,
                alignment: Alignment.topCenter,
                child: Container(
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1C2541).withOpacity(0.35),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white.withOpacity(0.15)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 20,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.weatherModel.name,
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '${widget.weatherModel.tempC}°',
                        style: TextStyle(
                          fontSize: 65,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 186, 184, 200),
                        ),
                      ),
                      Row(
                        children: [
                          Image(
                            image: NetworkImage(
                              'https:${widget.weatherModel.mainIcon}',
                            ),
                            width: 40,
                            height: 40,
                          ),
                          Text(
                            widget.weatherModel.text,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              setState(() {
                                isclicked = !isclicked;
                              });
                            },
                            child: Row(
                              children: [
                                Icon(
                                  isclicked
                                      ? Icons.keyboard_arrow_up_rounded
                                      : Icons.keyboard_arrow_down_rounded,
                                  color: Colors.white,
                                ),
                                Text(
                                  isclicked ? 'See less' : 'See more',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      if (isclicked)
                        ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              index > 11
                                  ? Text(
                                      '${list[index].time.split(' ')[1].split(':')[0]} PM',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    )
                                  : Text(
                                      '${list[index].time.split(' ')[1].split(':')[0]} AM',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                              Text(
                                '${list[index].temp}°',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Image(
                                image: NetworkImage(
                                  'https:${list[index].icon}',
                                ),
                                width: 40,
                                height: 40,
                              ),
                            ],
                          ),
                          separatorBuilder: (context, index) => Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 50,
                              vertical: 10,
                            ),
                            child: Container(
                              width: double.infinity,
                              height: 1,
                              color: const Color.fromARGB(255, 215, 233, 249),
                            ),
                          ),
                          // FIX: itemCount should match `list` (hours), not forcastDay (days)
                          itemCount: list.length,
                        ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20),

              Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                width: double.infinity,
                height: 30,
                decoration: BoxDecoration(
                  color: HexColor('#b1bee6').withOpacity(0.15),
                ),
                child: Text(
                  'WEATHER THIS WEEK',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 20),
              SizedBox(
                height: 170,
                width: double.infinity,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  // FIX: itemCount should match `forcastDay` (days), not list (hours)
                  itemCount: widget.weatherModel.forcastDay.length,
                  separatorBuilder: (context, index) => SizedBox(width: 10),
                  itemBuilder: (context, index) => Container(
                    padding: EdgeInsets.all(8),
                    width: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color(0xFF1C2541).withOpacity(0.35),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.weatherModel.forcastDay[index].date,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Image(
                          image: NetworkImage(
                            'https:${widget.weatherModel.forcastDay[index].listIcon}',
                          ),
                          width: 40,
                          height: 40,
                        ),
                        Text(
                          '${widget.weatherModel.forcastDay[index].avgT}°',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}