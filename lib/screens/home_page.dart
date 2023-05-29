import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/Anime/anime_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String dropdownValue = 'Naruto';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<String>(
              // Step 3.
              value: dropdownValue,
              // Step 4.
              items: <String>['Naruto', 'Sasuke', 'Sakura', 'Kakashi']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(fontSize: 18),
                  ),
                );
              }).toList(),
              // Step 5.
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
            ),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton.icon(
              onPressed: () => {
                context
                    .read<AnimeBloc>()
                    .add(GetQuoteEvent(characterName: dropdownValue))
              },
              icon: const Icon(Icons.send),
              label: const Text(
                "Send Data",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            BlocConsumer<AnimeBloc, AnimeState>(
              listener: (context, state) {
                if (state is AnimeEror) {
                  print("There is eror in: ${state.erorText}");
                }
              },
              builder: (context, state) {
                if (state is AnimeLoading) {
                  return const CircularProgressIndicator();
                } else if (state is AnimeSuccess) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 45, horizontal: 45),
                    child: Text(state.animeModel!.quote),
                  );
                }

                return Container();
              },
            )
          ],
        ),
      ),
    );
  }
}
