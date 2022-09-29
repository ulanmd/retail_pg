import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../evrika_colors.dart';
import '../widgets/proposalItemWidget.dart';

class RetailPage extends StatelessWidget {
  const RetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 25, 0, 15),
              child: Text(
                'Ваши заявки',
                style: TextStyle(color: EvrikaColors.darkColor, fontSize: 25),
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: const [
                    ProposalItemWidget(
                        type: 'completed',
                        color: EvrikaColors.completedTextColor,
                        text: 'Закрыт'),
                    ProposalItemWidget(
                        type: 'cancelled',
                        color: EvrikaColors.cancelledColor,
                        text: 'Отменен'),
                    ProposalItemWidget(
                        type: 'inProcess',
                        color: EvrikaColors.inProcessColor,
                        text: 'В процессе'),
                    ProposalItemWidget(
                        type: 'inProcess',
                        color: EvrikaColors.inProcessColor,
                        text: 'В процессе'),
                    ProposalItemWidget(
                        type: 'inProcess',
                        color: EvrikaColors.inProcessColor,
                        text: 'В процессе'),
                    ProposalItemWidget(
                        type: 'inProcess',
                        color: EvrikaColors.inProcessColor,
                        text: 'В процессе'),
                  ],
                ),
              ),
            ),),
          ],
        ),
      ),
    );
  }
}
