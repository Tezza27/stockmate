import 'package:flutter/material.dart';
import 'package:stockmate/models/agent_card_class.dart';
import 'package:stockmate/templates/agent_card.dart';
import 'package:stockmate/Settings/colours.dart';

class AgentScreen extends StatefulWidget {
  @override
  _AgentState createState() => new _AgentState();
}

class _AgentState extends State<AgentScreen> {
  List<AgentCardClass> agentCardList = const <AgentCardClass>[
    AgentCardClass(
      agentOrganisation: "Brass Music Specialists",
      firstName: "Greg",
      lastName: "Aitken",
      agentAddress1: "90 Appel Street",
      agentAddress2: "Graceville",
      agentCity: "Brisbane",
      agentState: "QLD",
      agentPostcode: "4075",
      agentPhone: "+61 7 3278 1311",
      agentEmail: "brass@brassmusic.com.au",
    ),
    AgentCardClass(
      agentOrganisation: "Concept Musical Instruments",
      firstName: "Graham",
      lastName: "Hoskins",
      agentAddress1: "244 - 246 Cambridge St ",
      agentAddress2: "Wembley",
      agentCity: "Perth",
      agentState: "WA",
      agentPostcode: "6014",
      agentPhone: "+61 08 9381 2277",
      agentEmail: "conceptm@iinet.au",
    ),
    AgentCardClass(
      agentOrganisation: "Engadine Music",
      firstName: "John",
      lastName: "Brandman",
      agentAddress1: "25 Station Street",
      agentAddress2: "",
      agentCity: "Engadine",
      agentState: "NSW",
      agentPostcode: "2233",
      agentPhone: "+61 2 9520 3044",
      agentEmail: "shop@engadinemusic.com.au",
    ),
  ];
  TextEditingController controller = new TextEditingController();
  String dropdownValue = "Agents Descending";
  String filter;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: appBarColour,
          title: Text("Agents"),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.add_circle,
                color: iconColour,
              ),
              iconSize: 48.0,
              onPressed: (){
                Navigator.pushNamed(
                  context,
                  "AgentDetailsScreen",);},
            ),
          ],
        ),
        body: Container(
          color: backgroundColour,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Column(
              children: <Widget>[
                DropdownButton<String>(
                  value: dropdownValue,
                  icon: Icon(Icons.arrow_drop_down_circle),
                  iconEnabledColor: iconColour,
                  iconSize: 24,
                  elevation: 16,
                  onChanged: (String dropdownSelection) {
                    setState(() {
                      dropdownValue = dropdownSelection;
                    });
                  },
                  items: <String>[
                    "Agents Ascending",
                    "Agents Descending",
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 2.0),
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: agentCardList.length,
                        itemBuilder: (context, int index) {
                          return InkWell(
                              onTap: (){},
                              child: AgentCard(
                                  agentCard: agentCardList[index]));
                        }),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
