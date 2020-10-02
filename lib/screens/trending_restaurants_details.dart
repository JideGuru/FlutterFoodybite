import 'package:flutter/material.dart';
import 'package:flutter_foodybite/util/categories.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductScreen extends StatefulWidget {
  final String img;
  final String title;
  final String address;
  final String rating;

  ProductScreen({
    Key key,
    @required this.img,
    @required this.title,
    @required this.address,
    @required this.rating,
  }) : super(key: key);
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        centerTitle: true,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Image.asset('${widget.img}'),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '${widget.title}',
                style: GoogleFonts.poppins(
                    fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: Colors.amber,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Flexible(
                    child: Text(
                      '${widget.address}',
                      style: GoogleFonts.poppins(fontSize: 16),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text('Popular Food',
                  style: GoogleFonts.poppins(
                      fontSize: 18, fontWeight: FontWeight.w700)),
              Expanded(
                  child: Container(
                child: GridView.count(
                  crossAxisCount: 2,
                  children: List.generate(categories.length, (index) {
                    return Container(
                      child: Card(
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('${categories[index]['img']}'),
                                fit: BoxFit.fitHeight),
                          ),
                          child: Text(
                            '${categories[index]['name']}',
                            style: GoogleFonts.poppins(
                                color: Colors.red.shade700,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
