import 'package:flutter/material.dart';
import 'package:rockinrio/models/atracao_model.dart';
import 'package:rockinrio/pages/atracao_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) :super(key: key);
  
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Atracao> _listaFavoritos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Atrações"),
      ),
      body: ListView.builder(
        itemCount: listaAtracoes.length,
        itemBuilder: (context, index) {
          final isFavorito = _listaFavoritos.contains(listaAtracoes[index]);
          return ListTile(
            title: Text(listaAtracoes[index].nome),
            subtitle: Wrap(
              spacing: 8,
              runSpacing: 4,
              children: listaAtracoes[index]
                .tags
                .map((tag) => Chip(label: Text('#$tag')))
                .toList(),
            ),
            leading: CircleAvatar(
              child: Text('${listaAtracoes[index].dia}'),
            ),
            trailing: IconButton(
              onPressed: () {
                setState(() {
                  if(isFavorito) {
                    _listaFavoritos.remove(listaAtracoes[index]);
                  } else {
                    _listaFavoritos.add(listaAtracoes[index]);
                  }
                });
              },
              icon: isFavorito 
                ? const Icon(
                  Icons.favorite, 
                  color: Colors.purple,) 
                : const Icon(Icons.favorite_border)
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AtracaoPage(atracao: listaAtracoes[index])),
                );
            },
          );
        }
      )
    );
  }
}
