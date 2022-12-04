import 'dart:io';

import 'package:airapp/home/manual/pdf/pdfAPI.dart';
import 'package:airapp/home/manual/pdf/pdfViewer.dart';
import 'package:airapp/constants.dart';
import 'package:flutter/material.dart';

class ManualCard extends StatelessWidget {
  //const ManualCard({super.key});
  IconData? icon;
  String? title;
  String? subtitle;
  String? author;

  ManualCard({super.key, this.icon, this.title, this.subtitle, this.author});

  @override
  Widget build(BuildContext context) {
    return Container(
      // /margin: const EdgeInsets.only(left: 30),
      padding: const EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width / 2 - 40,
      height: MediaQuery.of(context).size.height * 0.3 - 40,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey.withOpacity(0.2),
            blurRadius: 25,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(icon!, size: 20, color: AppColors.yellowAccent),
            ],
          ),
          SizedBox(height: 8),
          Text(
            title!,
            style: AppTextStyles.title1,
          ),
          Text(subtitle!, style: AppTextStyles.subHeadings),
        ],
      ),
    );
  }
}

class Manuals extends StatefulWidget {
  const Manuals({super.key});

  @override
  State<Manuals> createState() => _ManualsState();
}

class _ManualsState extends State<Manuals> {
  void openPDF(BuildContext context, File file) => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => PDFViewerPage(file: file)),
      );
  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 30,
      spacing: 20,
      children: [
        GestureDetector(
          onTap: () async {
            const path = 'assets/files/A320-Lights.pdf';
            final file = await PDFApi.loadAsset(path);
            openPDF(context, file);
          },
          child: ManualCard(
            icon: Icons.lightbulb_outline_rounded,
            title: 'A320 LIGHTS',
            subtitle: 'Flight Crew Operating Manual',
            author: '30 pages',
          ),
        ),
        // const SizedBox(
        //   width: 15,
        // ),
        GestureDetector(
          onTap: () async {
            const path = 'assets/files/Cessna_152_1978-1985_MM_D2064-1-13.pdf';
            final file = await PDFApi.loadAsset(path);
            openPDF(context, file);
          },
          child: ManualCard(
            icon: Icons.home_repair_service_outlined,
            title: 'Cessna 152 1978-1985 MM D2064-1-13',
            subtitle: 'Cessna Service Manual',
            author: '30 pages',
          ),
        ),
        // const SizedBox(
        //   width: 15,
        // ),
        GestureDetector(
          onTap: () async {
            const path = 'assets/files/Cessna-150-Owners-Manual.pdf';
            final file = await PDFApi.loadAsset(path);
            openPDF(context, file);
          },
          child: ManualCard(
            icon: Icons.handyman_rounded,
            title: "CESSNA 150 OWNER'S MANUAL",
            subtitle: "Cessna Owner's Manual",
            author: '30 pages',
          ),
        ),
        // const SizedBox(
        //   width: 15,
        // ),
        GestureDetector(
          onTap: () async {
            const path = 'assets/files/05.-ATA-24-ELECTRICAL-POWER.pdf';
            final file = await PDFApi.loadAsset(path);
            openPDF(context, file);
          },
          child: ManualCard(
            icon: Icons.flash_on_rounded,
            title: 'ATA 24 ELECTRICAL POWER',
            subtitle: 'Aircraft Maintenance Manual',
            author: '30 pages',
          ),
        ),
        // const SizedBox(
        //   width: 15,
        // ),
        GestureDetector(
          onTap: () async {
            const path = 'assets/files/150_sm_69.pdf';
            final file = await PDFApi.loadAsset(path);
            openPDF(context, file);
          },
          child: ManualCard(
            icon: Icons.import_contacts_rounded,
            title: '150 SM 69',
            subtitle: 'Cessna Service Manual',
            author: '30 pages',
          ),
        ),
        // const SizedBox(
        //   width: 15,
        // ),
        GestureDetector(
          onTap: () async {
            const path = 'assets/files/A319-320-321-Electrical.pdf';
            final file = await PDFApi.loadAsset(path);
            openPDF(context, file);
          },
          child: ManualCard(
            icon: Icons.monitor_heart_outlined,
            title: 'A319 320 321 Electrical',
            subtitle: 'Electrical Manual',
            author: '30 pages',
          ),
        ),
      ],
    );
  }
}
