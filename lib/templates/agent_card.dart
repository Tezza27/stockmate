import 'package:flutter/material.dart';
import 'package:stockmate/Settings/colours.dart';
import 'package:stockmate/models/agent_card_class.dart';

class AgentCard extends StatelessWidget {
  const AgentCard({Key key, this.agentCard}) : super(key: key);
  final AgentCardClass agentCard;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 2.0),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: BorderSide(color: borderColour, width: 1.0)),
        color: lozengeColour,
        elevation: 16.0,
        borderOnForeground: true,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  agentCard.agentOrganisation,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  agentCard.firstName + " " + agentCard.lastName,
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
                ),
                Text(
                  agentCard.agentAddress1,
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
                ),
                Text(
                  agentCard.agentAddress2,
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
                ),
                Text(
                  agentCard.agentCity,
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
                ),
                Text(
                  agentCard.agentState,
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
                ),
                Text(
                  agentCard.agentPostcode,
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
                ),
                Text(
                  agentCard.agentPhone,
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
                ),
                Text(
                  agentCard.agentEmail,
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
                ),
              ]),
        ),
      ),
    );
  }
}
