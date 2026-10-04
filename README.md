# Escala de Voo - Aplicação Flutter

Aplicação Flutter para visualização de escala de voos, com funcionalidades de cálculo de salário, logbook e gerenciamento de diárias para tripulantes da LATAM.

## 🚀 Funcionalidades

### 1. **Menu**
- Toggle para mostrar/ocultar salário nos voos
- Seção de contatos (Email, Telefone, WhatsApp)

### 2. **Cálculo de Salário**
- Cálculo de salário por voos programados
- Cálculo de horas de reserva
- Cálculo de standby
- Cálculo de diárias
- Resumo semanal
- Projeção mensal

### 3. **Logbook**
- **Visualizar**: Histórico de voos com horas diurnas/noturnas e badges PF/PM
- **Sincronizar**: Importação de dados do mês anterior do iFlight
- **Exportar**: Exportação em PDF ou Excel

## 📋 Estrutura do Projeto

```
lib/
├── main.dart                 # App principal e navegação
├── screens/
│   ├── menu.dart            # Tela de menu e contatos
│   ├── salary.dart          # Cálculo de salário
│   └── logbook.dart         # Logbook de voos
├── models/
│   └── flight_log.dart      # Modelo de registro de voo
└── utils/
    └── theme.dart           # Tema e cores LATAM
```

## 🎨 Design

A aplicação utiliza Material Design 3 com as cores corporativas LATAM:
- Azul Principal: `#003D82`
- Azul Escuro: `#002447`
- Branco: `#FFFFFF`

### Cores de Badges
- **PF (Pilot Flying)**: Verde `#4CAF50`
- **PM (Pilot Monitoring)**: Azul `#2196F3`

## 📦 Dependências

```yaml
dependencies:
  flutter: sdk: flutter
  intl: ^0.19.0          # Internacionalização
  http: ^1.1.0           # Requisições HTTP
  path_provider: ^2.1.0  # Acesso a diretórios do sistema
```

## 🚀 Como Executar

### Pré-requisitos
- Flutter SDK 3.0.0+
- Dart SDK 3.0.0+
- Android Studio ou VS Code com extensão Flutter

### Passos

1. **Clone o repositório**
```bash
git clone <repo-url>
cd flutter_escala_voo
```

2. **Instale as dependências**
```bash
flutter pub get
```

3. **Execute a aplicação**
```bash
flutter run
```

### Plataformas Suportadas
- ✅ Android
- ✅ iOS
- ✅ Web (com limitações)

## 📊 Dados de Exemplo

A aplicação vem com dados de exemplo hardcoded para demonstração:

### Cálculo de Salário
- **Voos**: 142.5h × R$ 100 = R$ 14.250
- **Reserva**: 20h × R$ 50 = R$ 1.000
- **Standby**: 16h × R$ 30 = R$ 480
- **Diárias**: 16 dias × R$ 230 = R$ 3.680
- **Total**: R$ 19.410

### Logbook
4 voos de exemplo com:
- Origem e destino
- Horários de partida e chegada
- Tipo de aeronave
- Função do piloto (PF/PM)
- Horas diurnas e noturnas

## 🔧 Customização

### Modificar Cores LATAM
Edite `lib/utils/theme.dart` para alterar as cores:

```dart
static const Color latamBlue = Color(0xFF003D82);
static const Color latamDarkBlue = Color(0xFF002447);
```

### Adicionar Dados Reais
Para conectar com o backend, modifique as classes de modelo em `lib/models/` e as screens para fazer requisições HTTP.

## 📝 Notas de Desenvolvimento

- A aplicação utiliza NavigationBar para navegação entre abas
- Os dados são armazenados em variáveis (sem persistência local no momento)
- As funcionalidades de sincronização e exportação são placeholders com validação visual

## 🤝 Próximas Etapas

- [ ] Integrar com API do backend
- [ ] Adicionar persistência local com SQLite
- [ ] Implementar autenticação
- [ ] Sincronização real com iFlight
- [ ] Exportação real em PDF/Excel

## 📄 Licença

Projeto da LATAM Airlines - Uso interno
