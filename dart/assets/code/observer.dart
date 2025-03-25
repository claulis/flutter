// observer_pattern.dart
abstract class Observer {
  void update(String mensagem);
}

class Subject {
  final List<Observer> _observers = [];

  void adicionarObservador(Observer observer) {
    _observers.add(observer);
  }

  void removerObservador(Observer observer) {
    _observers.remove(observer);
  }

  void notificarObservadores(String mensagem) {
    for (var observer in _observers) {
      observer.update(mensagem);
    }
  }
}

class DisplayObserver implements Observer {
  final String nome;
  
  DisplayObserver(this.nome);

  @override
  void update(String mensagem) {
    print('$nome recebeu: $mensagem');
  }
}

void main() {
  var subject = Subject();
  
  var display1 = DisplayObserver('Display 1');
  var display2 = DisplayObserver('Display 2');

  subject.adicionarObservador(display1);
  subject.adicionarObservador(display2);

  subject.notificarObservadores('Evento importante ocorreu!');
}