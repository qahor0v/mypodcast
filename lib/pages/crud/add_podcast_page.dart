import 'package:ebook_app/controllers/add_podcast/add_podcast_controller.dart';
import 'package:flutter/material.dart';

class AddPodcastPage extends StatefulWidget {
  const AddPodcastPage({Key? key}) : super(key: key);

  @override
  State<AddPodcastPage> createState() => _AddPodcastPageState();
}

class _AddPodcastPageState extends State<AddPodcastPage> {
  List<String> items = [
    "newest_podcasts",
    "politics_podcasts",
    "science_podcasts",
    "technology_podcasts",
    "top_podcasts"
  ];

  String? selectedDatabaseTableController = "newest_podcasts";
  TextEditingController nameController = TextEditingController();
  TextEditingController releaseDateController = TextEditingController();
  TextEditingController synopsisController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  TextEditingController durationController = TextEditingController();
  TextEditingController pdfLinkController = TextEditingController();
  TextEditingController audioLinkController = TextEditingController();
  TextEditingController imageLinkController = TextEditingController();

  void _addPodcast() {
    AddPodcastController.selectedDatabaseTableController =
        selectedDatabaseTableController;
    AddPodcastController.nameController = nameController.text;
    AddPodcastController.releaseDateController = releaseDateController.text;
    AddPodcastController.synopsisController = synopsisController.text;
    AddPodcastController.detailsController = detailsController.text;
    AddPodcastController.durationController = durationController.text;
    AddPodcastController.pdfLinkController = pdfLinkController.text;
    AddPodcastController.audioLinkController = audioLinkController.text;
    AddPodcastController.imageLinkController = imageLinkController.text;
    AddPodcastController.create();
    _makeControllersEmpty();
  }

  void _makeControllersEmpty() {
    nameController.text = "";
    releaseDateController.text = "";
    synopsisController.text = "";
    detailsController.text = "";
    durationController.text = "";
    pdfLinkController.text = "";
    audioLinkController.text = "";
    imageLinkController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff2F2F2F),
        title: Text("Add podcast"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black54),
                  ),
                ),
                value: selectedDatabaseTableController,
                items: items
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                          ),
                        ))
                    .toList(),
                onChanged: (item) => setState(() {
                  selectedDatabaseTableController = item;
                }),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Name of the poscast',
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: releaseDateController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Release date',
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: synopsisController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Synopsis',
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: detailsController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Details',
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: durationController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Duration',
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: pdfLinkController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'PDF link',
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: audioLinkController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Audio link',
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: imageLinkController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Image link',
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                color: Color(0xff2F2F2F),
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    _addPodcast();
                  },
                  child: const Text(
                    "Add",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
