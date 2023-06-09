import 'package:flutterlicensenow/Questions.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper.internal();

  factory DBHelper() => _instance;

  static late Database _db;

  static const int id = 0;
  static const String question = "question";
  static const String option1 = "option1";
  static const String option2 = "option2";
  static const String option3 = "option3";
  static const String ans = "ans";
  static const String isImage = "isImage";
  static const String image = "img";
  static const String TABLE = "questionTable";
  static const String DB_NAME = "licenseNow.db";

  Future<Database> get db async {
    _db = await initDb();
    return _db;
  }

  initDb() async {
    var db = await openDatabase(join(await getDatabasesPath(), DB_NAME),
        version: 1, onCreate: _onCreate, onOpen: (db) {});
    return db;
  }

  DBHelper.internal();

  _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS $TABLE ("$question" TEXT, "$option1" TEXT, "$option2" TEXT, "$option3" TEXT, "$ans" INTEGER, "$isImage" INTEGER, "$image" INTEGER )');

    insertQuestions(Questions(
        question:
            "તમે સાંકળા નાળા પાસે પહોચો છો, સામેથી નાળા માં બીજું વાહન પ્રવેશે છે, તમે શું કરશો?",
        option1: "તમારી ઝડપ વધારી જેમ બને તેમ ઝડપ થી નાળું પસાર કરશો.",
        option2: "હેડ લાઈટ ચાલુ કરી નાળું પસાર કરશો.",
        option3: "સામેનું વાહન પસાર થાય ત્યાં સુધી થોભી ત્યાર બાદ આગળ વધશો.",
        ans: 3));

    insertQuestions(Questions(
        question:
            "રાહદારીઓ માટેના ક્રોસિંગ ઉપર રાહદારી રોડ ક્રોસ કરવા ઉભા હોય ત્યારે તમે શું કરશો?",
        option1: "હોર્ન વગાડી આગળ વધશો.",
        option2: "વાહન ધીમું પાડીને હોર્ન વગાડી આગળ વધશો.",
        option3:
            "વાહન ઉભું રાખી દઈ રાહદારીઓ રોડ ક્રોસ કરી લે ત્યાં સુધી થોભી પછી આગળ વધશો.",
        ans: 3));
    insertQuestions(Questions(
        question: "નીચે મુજબ ની નિશાની શું બતાવે છે?",
        option1: "ડાબી બાજુ હાંકો.",
        option2: "ડાબી બાજુ રસ્તો નથી.",
        option3: "ફરજીયાત ડાબી બાજુ રસ્તો રાખો.",
        ans: 3,
        isImage: 1,
        img: 3));
    insertQuestions(Questions(
        question: "નીચે મુજબ ની નિશાની શું બતાવે છે?",
        option1: "વાહન થોભો.",
        option2: "નો પાર્કિંગ.",
        option3: "આગળ હોસ્પિટલ છે.",
        ans: 1,
        isImage: 1,
        img: 4));
    insertQuestions(Questions(
        question: " નીચે મુજબ ની નિશાની શું બતાવે છે?",
        option1: "આગળ પુલ છે.",
        option2: "નાસ્તા પાણી માટે નો સ્ટોલ છે.",
        option3: "આગળ હોડી સેવા છે.",
        ans: 2,
        isImage: 1,
        img: 5));
    insertQuestions(Questions(
        question: "નીચે મુજબ ની નિશાની શું બતાવે છે?",
        option1: "છુટા પથ્થર વાળો રસ્તો.",
        option2: "લપસી જવાય એવો ચીકણો રસ્તો.",
        option3: "મોટર કાર માટે પ્રવેશ મનાઈ.",
        ans: 1,
        isImage: 1,
        img: 6));
    insertQuestions(Questions(
        question: "નીચે મુજબ ની નિશાની શું બતાવે છે?",
        option1: "સાઇકલ માટે નું ક્રોસિંગ.",
        option2: "સાઇકલ ક્રોસ કરવાની મનાઈ છે.",
        option3: "સાઇકલ માટે પ્રવેશ બંધ.",
        ans: 1,
        isImage: 1,
        img: 7));
    insertQuestions(Questions(
        question: "નીચે મુજબ ની નિશાની શું બતાવે છે?",
        option1: "ડાબી બાજુ વાળો.",
        option2: "જમણી બાજુ વાળો.",
        option3: "વાય ક્રોસિંગ ડાબી બાજુ.",
        ans: 3,
        isImage: 1,
        img: 8));
    insertQuestions(Questions(
        question: "નીચે મુજબ ની નિશાની શું બતાવે છે?",
        option1: "ડાબી બાજુ વાય ક્રોસિંગ.",
        option2: "જમણી બાજુ વાય ક્રોસિંગ.",
        option3: "ડાબી બાજુ સાઈડ રોડ છે.",
        ans: 2,
        isImage: 1,
        img: 9));
    insertQuestions(Questions(
        question: "નીચે મુજબ ની નિશાની શું બતાવે છે?",
        option1: "સામે બંને તરફ રોડ છે.",
        option2: "આગળ સાંકડો બ્રીજ છે.",
        option3: "આગળ સાંકડો રોડ છે.",
        ans: 2,
        isImage: 1,
        img: 10));
    insertQuestions(Questions(
        question: "અકસ્માત વખતે મેડીકલ મદદ મેળવવા કયો ફોન નંબર ડાયલ કરશો?",
        option1: "૧૦૮ અથવા ૧૦૨",
        option2: "૧૦૧",
        option3: "આ પૈકી કોઈપણ.",
        ans: 1));
    insertQuestions(Questions(
        question: " નીચે મુજબ ની નિશાની શું બતાવે છે?",
        option1: "આગળ સાંકડો રસ્તો છે.",
        option2: "ભયજનક સુપડી છે.",
        option3: "હોડી સેવા છે.",
        ans: 2,
        isImage: 1,
        img: 12));
    insertQuestions(Questions(
        question: "નીચે મુજબ ની નિશાની શું બતાવે છે?",
        option1: "આગળ સાંકડો રસ્તો છે.",
        option2: "આગળ સાંકડું નાળું છે.",
        option3: "આગળ બંને બાજુ રસ્તા છે.",
        ans: 1,
        isImage: 1,
        img: 13));
    insertQuestions(Questions(
        question: "નીચે મુજબ ની નિશાની શું બતાવે છે?",
        option1: "રસ્તો બંધ છે.",
        option2: "પાર્કિંગ ની મનાઈ છે.",
        option3: "ગતિ મર્યાદા નો અંત.",
        ans: 3,
        isImage: 1,
        img: 14));
    insertQuestions(Questions(
        question: "નીચે મુજબ ની નિશાની શું બતાવે છે?",
        option1: "નજીક માં રેલ્વે સ્ટેશન છે.",
        option2: "ફાટક વગરનું રેલ્વે ક્રોસિંગ .",
        option3: "ફાટક વાળું રેલ્વે ક્રોસિંગ છે.",
        ans: 3,
        isImage: 1,
        img: 15));

    insertQuestions(Questions(
        question:
            "કયા પ્રકાર ના વાહન ચલાવવા માટે ચાલકે ગણવેશ પહેરવો ફરજીયાત છે?  ",
        option1: "પ્રાઇવેટ વાહનો  ",
        option2: "તમામ કોમર્શિઅલ વાહનો  ",
        option3: "બધા જ વાહનો",
        ans: 2));
    insertQuestions(Questions(
        question: "૬૫ કિ.મી. કરતા વધુ સ્પીડે ચલાવવા માન્ય વાહન ફક્ત  ",
        option1: "મોટર સાઇકલ  ",
        option2: "મોટર કાર  ",
        option3: "સ્ટેજ કેરેજ બસ",
        ans: 2));
    insertQuestions(Questions(
        question: " વાહન ગતિ માં હોય ત્યારે વાહનમાંથી ઉતરવું કે ચઢવું  ",
        option1: "બસ માં માન્ય છે.  ",
        option2: "ઓટો રીક્ષા માં માન્ય છે.  ",
        option3: "કોઈપણ વાહન માં માન્ય નથી.",
        ans: 3));
    insertQuestions(Questions(
        question: "તમે વાહન નો ફ્યુઅલ વપરાશ ઘટાડવા..  ",
        option1: "વાહન નું યોગ્ય ટ્યુનીંગ કરાવશો.  ",
        option2: "વાહન ને યોગ્ય રીતે સાફ રાખશો.  ",
        option3: "વાહન ચલાવતી વખતે ક્લચ નો વધુ પડતો ઉપયોગ કરશો.",
        ans: 1));
    insertQuestions(Questions(
        question: "પાછળ નું દ્રશ્ય જોવાનો અરીસો શા માટે વપરાય છે?  ",
        option1: "પોતાનો ચેહરો જોવા માટે  ",
        option2: "પાછળ થી આવતા વાહનો જોવા માટે  ",
        option3: "પાછળથી આવતા વાહનો જોવા માટે",
        ans: 2));
    insertQuestions(Questions(
        question: "મોટર કાર ચલાવવા માટે વધુ માં વધુ ગતિ મર્યાદા કેટલી છે?  ",
        option1: "કોઈ મર્યાદા નથી.  ",
        option2: "૭૦ કિમી/કલાક  ",
        option3: "૫૦ કિમી/કલાક",
        ans: 1));
    insertQuestions(Questions(
        question: "કાયદા મુજબ દ્વિચક્રિ વાહન ચલાવનાર વ્યક્તિ  ",
        option1: "ઝાકીટ પહેરશે  ",
        option2: "હેલ્મેટ પહેરશે.  ",
        option3: "બુટ પહેરશે.",
        ans: 2));
    insertQuestions(Questions(
        question: "જરૂરિયાત વગર હોર્ન નો વારંવાર ઉપયોગ ગુન્હો બને છે.  ",
        option1: "હા  ",
        option2: "ના  ",
        option3: "એવો કાયદો નથી.",
        ans: 1));
    insertQuestions(Questions(
        question: "પી.યુ.સી. ની મુદત કેટલી છે?  ",
        option1: "૬ મહિના  ",
        option2: "૧ વર્ષ  ",
        option3: "૨ વર્ષ",
        ans: 1));
    insertQuestions(Questions(
        question: "ટ્રાફિક જંકશન ઉપર લીલી લાઈટ પછી કઈ લાઈટ થશે?  ",
        option1: "લાલ  ",
        option2: "ભૂરી  ",
        option3: "પીળી",
        ans: 3));
    insertQuestions(Questions(
        question: "ભાડેથી ફરતા વાહનની નંબર પ્લેટ કયા કલર ની હોય છે?  ",
        option1: "પીળી પ્લેટ ઉપર કાળા અક્ષરો  ",
        option2: "કાળા પ્લેટ ઉપર પીળા અક્ષરો  ",
        option3: "સફેદ પ્લેટ ઉપર કાળા અક્ષરો",
        ans: 1));

    insertQuestions(Questions(
        question: "નશો કરીને વાહન ચલાવવું..",
        option1: "પ્રાઇવેટ વાહન માં મંજૂર છે.",
        option2: "રાત્રી દરમિયાન મંજૂર છે.",
        option3: "કોઈપણ વાહન માં મનાઈ છે.",
        ans: 3));
    insertQuestions(Questions(
        question: "વધુ માં વધુ ૫૦ કિમી/કલાક ની ઝડપે મોટર સાઇકલ ચલાવી શકાય..",
        option1: "રાત્રિ દરમિયાન",
        option2: "દિવસ દરમિયાન",
        option3: "કોઈપણ સમયે",
        ans: 3));
    insertQuestions(Questions(
        question: "રીવર્સ લાઈટ નો રંગ કેવો હોય છે?",
        option1: "લાલ",
        option2: "સફેદ",
        option3: "કેસરી",
        ans: 2));
    insertQuestions(Questions(
        question: "વાહન ચલાવતી વખતે તમે શેનું ધ્યાન રાખશો?",
        option1: "વાતાવરણ અને રસ્તાની પરિસ્થિતિ",
        option2: "તમારી આજુ-બાજુ નો ટ્રાફિક",
        option3: "બંને",
        ans: 3));
    insertQuestions(Questions(
        question: "નીચે મુજબ ની નિશાની શું બતાવે છે?",
        option1: "આગળ જમણી બાજુ રસ્તો છે.",
        option2: "ફરજીયાત જમણી બાજુ.",
        option3: "જમણી બાજુ વળવાની મનાઈ છે.",
        ans: 1,
        isImage: 1,
        img: 16));
    insertQuestions(Questions(
        question: "નીચે મુજબ ની નિશાની શું બતાવે છે?",
        option1: "આગળ ચાર રસ્તા છે.",
        option2: "આગળ મુખ્ય રસ્તો છે.",
        option3: "ફસ્ટ એઇડ",
        ans: 2,
        isImage: 1,
        img: 17));
    insertQuestions(Questions(
        question: "નીચે મુજબ ની નિશાની શું બતાવે છે?",
        option1: "વાંકો ચૂકો રસ્તો જમણી બાજુ.",
        option2: "વાંકો ચૂકો રસ્તો ડાબી બાજુ.",
        option3: "જમણી બાજુ વળાંક લઈને આગળ વધો.",
        ans: 1,
        isImage: 1,
        img: 18));
    insertQuestions(Questions(
        question: "નીચે મુજબ ની નિશાની શું બતાવે છે?",
        option1: "વાંકો ચૂકો રસ્તો જમણી બાજુ.",
        option2: "વાંકો ચૂકો રસ્તો ડાબી બાજુ.",
        option3: "ડાબી બાજુ વળાંક લઈને આગળ વધો.",
        ans: 2,
        isImage: 1,
        img: 19));
    insertQuestions(Questions(
        question: "નીચે મુજબ ની નિશાની શું બતાવે છે?",
        option1: "ડાબી બાજુ ઢાળ.",
        option2: "ડાબી બાજુ ચીપિયા જેવો વળાંક.",
        option3: "વાહન રસ્તા ની ડાબી બાજુ રાખો.",
        ans: 2,
        isImage: 1,
        img: 20));

    insertQuestions(Questions(
        question: "નીચે મુજબ ની નિશાની શું બતાવે છે? ",
        option1: "જમણી બાજુ ચીપિયા જેવો વળાંક. ",
        option2: "જમણી બાજુ ચઢાણ અને ઢાળ. ",
        option3: "જમણી બાજુ ઢાળ.",
        ans: 1,
        isImage: 1,
        img: 21));
    insertQuestions(Questions(
        question: "નીચે મુજબ ની નિશાની શું બતાવે છે? ",
        option1: "U-Turn મનાઈ છે. ",
        option2: "જમણી બાજુ વળવાની મનાઈ છે. ",
        option3: "ડાબી બાજુથી ઓવેર ટેકિંગ મનાઈ.",
        ans: 2,
        isImage: 1,
        img: 22));
    insertQuestions(Questions(
        question: "નીચે મુજબ ની નિશાની શું બતાવે છે? ",
        option1: "U-Turn મનાઈ છે. ",
        option2: "જમણી બાજુ વળવાની મનાઈ છે. ",
        option3: "ડાબી બાજુથી ઓવેર ટેકિંગ મનાઈ.",
        ans: 1,
        isImage: 1,
        img: 23));
    insertQuestions(Questions(
        question: "નીચે મુજબ ની નિશાની શું બતાવે છે? ",
        option1: "બળદગાડા માટે પ્રવેશ ની મનાઈ છે. ",
        option2: "સાઇકલ માટે પ્રવેશ ની મનાઈ છે. ",
        option3: "બધા જ વાહનો માટે પ્રવેશ ની મનાઈ છે.",
        ans: 1,
        isImage: 1,
        img: 24));
    insertQuestions(Questions(
        question: "નીચે મુજબ ની નિશાની શું બતાવે છે? ",
        option1: "ટ્રક માટે પ્રવેશ ની મનાઈ છે. ",
        option2: "બસ માટે પ્રવેશ ની મનાઈ છે. ",
        option3: "હેવી વાહનો માટે પ્રવેશ ની મનાઈ છે.",
        ans: 1,
        isImage: 1,
        img: 25));

    insertQuestions(Questions(
        question: "નીચે મુજબ ની નિશાની શું બતાવે છે?",
        option1: "ડાબી બાજુ વાળી શકાય.",
        option2: "ફરજીયાત આગળ વધો અથવા ડાબી બાજુ વાહન વાળી શકાય.",
        option3: "ડાબી બાજુ સાઈડ રોડ છે.",
        ans: 2,
        isImage: 1,
        img: 26));
    insertQuestions(Questions(
        question: "નીચે મુજબ ની નિશાની શું બતાવે છે?",
        option1: "આગળ ક્રોસ રોડ છે (બે રસ્તાઓ ભેગા થાય છે / ચાર રસ્તા છે);",
        option2: "પ્રવેશ મનાઈ",
        option3: "હોસ્પિટલ",
        ans: 1,
        isImage: 1,
        img: 27));
    insertQuestions(Questions(
        question: "નીચે મુજબ ની નિશાની શું બતાવે છે?",
        option1: "ફરજીયાત સીધા જાઓ અથવા right side વાળો.",
        option2: "ફરજીયાત સીધા જાઓ અથવા ડાબે વાળો.",
        option3: "આગળ સાઈડ રોડ છે.",
        ans: 1,
        isImage: 1,
        img: 28));
    insertQuestions(Questions(
        question: "નીચે મુજબ ની નિશાની શું બતાવે છે?",
        option1: "હોર્ન વગાડવો ફરજીયાત છે.",
        option2: "હોર્ન સતત વગાડવો.",
        option3: "હોર્ન વગાડવાની મનાઈ છે.",
        ans: 1,
        isImage: 1,
        img: 29));
    insertQuestions(Questions(
        question: "નીચે મુજબ ની નિશાની શું બતાવે છે?",
        option1: "રોડ ની જમણી બાજુ વાહન હાંકો.",
        option2: "જમણી બાજુ પાર્કિંગ માન્ય છે.",
        option3: "ફરજીયાત ડાબી બાજુ વાળવું.",
        ans: 2,
        isImage: 1,
        img: 30));

    insertQuestions(Questions(
        question: "નીચે મુજબ ની નિશાની શું બતાવે છે?",
        option1: "ડાબી બાજુ સાઈડ રોડ છે.",
        option2: "ગતિ મર્યાદા",
        option3: "એક્ષલ વજન ની મર્યાદા.",
        ans: 3,
        isImage: 1,
        img: 31));
    insertQuestions(Questions(
        question: "નીચે મુજબ ની નિશાની શું બતાવે છે?",
        option1: "રોડ ઉપર માણસ કામ કરે છે.",
        option2: "બાળકો રમે છે.",
        option3: "રાહદારીઓ નું ક્રોસિંગ છે.",
        ans: 1,
        isImage: 1,
        img: 32));
    insertQuestions(Questions(
        question: "નીચે મુજબ ની નિશાની શું બતાવે છે?",
        option1: "જમણી બાજુ વાળો.",
        option2: "ડાબી બાજુ વાળો.",
        option3: "ગોળ ફરીને જાઓ.",
        ans: 3,
        isImage: 1,
        img: 33));
    insertQuestions(Questions(
        question: "નીચે મુજબ ની નિશાની શું બતાવે છે?",
        option1: "વાય ક્રોસિંગ ડાબી બાજુ",
        option2: "વાય ક્રોસિંગ જમણી બાજુ",
        option3: "વાય ક્રોસિંગ",
        ans: 3,
        isImage: 1,
        img: 34));
    insertQuestions(Questions(
        question: "નીચે મુજબ ની નિશાની શું બતાવે છે?",
        option1: "આગળ રસ્તો નથી.",
        option2: "આગળ બમ્પ છે.",
        option3: "રોડ ઉપર રીપેરીંગ કામ ચાલુ છે.",
        ans: 1,
        isImage: 1,
        img: 35));

    insertQuestions(Questions(
        question: "નીચે મુજબ ની નિશાની શું બતાવે છે?",
        option1: "પાર્કિંગ મનાઈ છે.",
        option2: "બંને બાજુ પાર્કિંગ થઇ શકે.",
        option3: "પોલીસ મદદ ની પોસ્ટ.",
        ans: 2,
        isImage: 1,
        img: 71));
    insertQuestions(Questions(
        question: "નીચે મુજબ ની નિશાની શું બતાવે છે?",
        option1: "પેટ્રોલ પંપ.",
        option2: "ગેરેજ.",
        option3: "હવા ભરવાની સગવડ છે.",
        ans: 1,
        isImage: 1,
        img: 72));
    insertQuestions(Questions(
        question: "નીચે મુજબ ની નિશાની શું બતાવે છે?",
        option1: "પ્રાઇવેટ કાર માટે પ્રવેશ બંધ.",
        option2: "ટેક્ષી માટે પાર્કિંગ.",
        option3: "પોલીસ વાહનો માટે પાર્કિંગ.",
        ans: 2,
        isImage: 1,
        img: 73));
    insertQuestions(Questions(
        question: "નીચે મુજબ ની નિશાની શું બતાવે છે?",
        option1: "રિક્ષા માટે પાર્કિંગ.",
        option2: "રિક્ષા માટે મનાઈ છે.",
        option3: "રિક્ષા રીપેરીંગ નું સ્થળ",
        ans: 1,
        isImage: 1,
        img: 74));
    insertQuestions(Questions(
        question:
            "હોસ્પિટલ પાસે તમે એક વાહન ને ઓવરટેક કરવા માંગો છો. તમે શું કરશો?",
        option1: "તમે સતત હોર્ન વગાડશો.",
        option2: "હોર્ન વગાડશો નહિ.",
        option3: "ફક્ત તુટક તુટક હોર્ન વગાડશો.",
        ans: 2,
        isImage: 0));
    insertQuestions(Questions(
        question: "શું વાહન નો વીમો કઢાવવો જરૂરી છે?",
        option1: "હા",
        option2: "ના",
        option3: "જેણે જીવન વીમો લીધો હોય તેને જરૂરી નથી.",
        ans: 1));
    insertQuestions(Questions(
        question: "નીચે મુજબ ની નિશાની શું બતાવે છે?",
        option1: "સ્કુટર-મોટર સાઇકલ માટે પાર્કિંગ.",
        option2: "સ્કુટર-મોટર સાઇકલ માટે મનાઈ.",
        option3: "સ્કુટર-મોટર સાઇકલ માટે રીપેરીંગ.",
        ans: 1,
        isImage: 1,
        img: 77));
    insertQuestions(Questions(
        question: " નીચે મુજબ ની નિશાની શું બતાવે છે?",
        option1: "વાહન થોભાવો, હોર્ન વગાડો અને આગળ વધો.",
        option2: "વાહન ધીમું કરો અને સાવચેતી થી આગળ વધો.",
        option3: "સતત હોર્ન ચાલુ રાખો અને આગળ વધો.",
        ans: 2,
        isImage: 1,
        img: 78));
    insertQuestions(Questions(
        question: "નીચે મુજબ ની નિશાની શું બતાવે છે?",
        option1: "૫૦ કિમી/કલાક કરતા વધુ ઝડપે વાહન ચલાવવું નહિ.",
        option2: "૫૦ કિમી/કલાક કરતા વધુ ઝડપે વાહન ચલાવવું.",
        option3: "૫૦ કિમી/કલાક ની ઝડપે વાહન ચલાવવું.",
        ans: 1,
        isImage: 1,
        img: 79));
    insertQuestions(Questions(
        question: "નીચે મુજબ ની નિશાની શું બતાવે છે?",
        option1: "જમણી બાજુ એ ઓવર ટેઈક કરવાની મનાઈ છે.",
        option2: "ડાબી બાજુ એ વળાંક લો.",
        option3: "ડાબી બાજુ વાળવાની મનાઈ છે.",
        ans: 3,
        isImage: 1,
        img: 80));

    insertQuestions(Questions(
        question: " નીચે મુજબ ની નિશાની શું બતાવે છે?",
        option1: "સીધા આગળ જવાનો ઈરાદો.",
        option2: "વાહન ઉભું રાખવાનો ઈરાદો.",
        option3: "જમણી બાજુ વાળવાનો ઈરાદો.",
        ans: 2,
        isImage: 1,
        img: 81));
    insertQuestions(Questions(
        question: " નીચે મુજબ ની નિશાની શું બતાવે છે?",
        option1: "પાછળથી આવતા વાહન ને ઉભું રાખવા વિનંતી.",
        option2: "પાછળથી આવતા વાહન ને પસાર થઇ જવા વિનંતી.",
        option3: "સામેથી આવતા વાહન ને ઊભું રાખવા વિનંતી.",
        ans: 2,
        isImage: 1,
        img: 82));
    insertQuestions(Questions(
        question: "નીચે મુજબ ની નિશાની શું બતાવે છે?",
        option1: "જમણી બાજુ વાળવાનો ઈરાદો.",
        option2: "સામેથી આવતા વાહન ને ઊભું રાખવા વિનંતી.",
        option3: "પોતાની વાહન ધીમું કરવા ઈરાદો.",
        ans: 3,
        isImage: 1,
        img: 83));
    insertQuestions(Questions(
        question: "નીચે મુજબ ની નિશાની શું બતાવે છે?",
        option1: "પાછળથી આવતા વાહન ને ઊભું રાખવા નિશાની.",
        option2: "જમણી બાજુ વળાંક લેવા માટે નિશાની.",
        option3: "સામેથી આવતા વાહન ને ઉભું રાખવા નિશાની.",
        ans: 2,
        isImage: 1,
        img: 84));
    insertQuestions(Questions(
        question: "જાહેર જગ્યા માં અન રજીસ્ટર્ડ વાહન વાપરવું એ",
        option1: "ગેરકાયદેસર છે.",
        option2: "કાયદેસર છે.",
        option3: "અનિવાર્ય સંજોગો માં વાપરી શકાય.",
        ans: 1));

    insertQuestions(Questions(
        question: "વાહન નો ડ્રાઈવર યુ ટર્ન લેશે નહિ.",
        option1: "જ્યાં યુ ટર્ન લેવાની મનાઈ હોય તેવા રોડ પર",
        option2: "વ્યસ્ત રોડ પર",
        option3: "ડાબી બાજુ થી વાહનો પસાર થતા હોય ત્યારે.",
        ans: 1));
    insertQuestions(Questions(
        question:
            "ગીયર વગર ના વાહન નું લાઈસન્સ મેળવવા માટે ઓછામાં ઓછી ઉંમર કેટલી જોઈએ?",
        option1: "૧૮ વર્ષ",
        option2: "૨૧ વર્ષ",
        option3: "૧૬ વર્ષ",
        ans: 3));
    insertQuestions(Questions(
        question: "વળાંક પહેલા..",
        option1: "વાહન ધીમું પાડી વળાંક લેવો",
        option2: "વાહન ધીમું પાડવું નહિ.",
        option3: "વાહન ની ગતિ વધારવી.",
        ans: 1));
    insertQuestions(Questions(
        question: "રાત્રે શહેર માં વાહન ચલાવતી વખતે..",
        option1: "વાહન ની હેડ લાઈટ નો લો બીમનો ઉપયોગ કરીશું.",
        option2: "હાઈ બીમનો ઉપયોગ કરીશું.",
        option3: "બધી જ લાઈટો બંધ કરીશું.",
        ans: 1));
    insertQuestions(Questions(
        question: "ટ્રાફિક સિગ્નલ માં લાલ લાઈટ શું દર્શાવે છે?",
        option1: "સાવચેતી રાખીને વાહન આગળ વધી શકે છે.",
        option2: "વાહન થોભાવો.",
        option3: "વાહન ધીમું કરો.",
        ans: 2));
    insertQuestions(Questions(
        question: "પાકા લાઇસન્સ માટે તમે કેટલા દિવસ પછી અરજી કરી શકો?",
        option1: "કાચું લાઇસન્સ ઇસ્યુ થવાની તારીખથી ૩૦ દિવસ પછી",
        option2: "કાચું લાઇસન્સ ઇસ્યુ થવાની તારીખથી ૬૦ દિવસ પછી",
        option3: "કાચું લાઇસન્સ ઇસ્યુ થવાની તારીખથી ૧૮૦ દિવસ પછી",
        ans: 1));
    insertQuestions(Questions(
        question: "જયારે તમારું વાહન ઓવર ટેક થઇ રહ્યું હોય ત્યારે..",
        option1: "તમારું વાહન થોભાવો અને તેને ઓવર ટેક કરવા દો.",
        option2: "તમારા વાહન ની ગતિ ઘટાડી દેશો.",
        option3: "પાછાળના વાહન ને ઓવર ટેક કરતા ખલેલ પહોચાડશો નહિ.",
        ans: 2));
    insertQuestions(Questions(
        question:
            "રાત્રે જયારે તમે હેડ લાઈટ ના દૂર ના બીમ થી ડ્રાઈવિંગ કરો છો ત્યારે સામેની બાજુ થી વાહન આવે ત્યારે",
        option1: "રોડ ના ડાબી બાજુ વાહન રાખીને આગળ વધો.",
        option2: "હેડ લાઈટ ડીમ-ફૂલ વારાફરથી ઘણીવાર કરશો.",
        option3: "સામેનું વાહન પસાર થઇ જાય ત્યાં સુધી હેડ લાઈટ ડીમ રાખશો.",
        ans: 3));
    insertQuestions(Questions(
        question:
            "જયારે સ્કુલ બસ વિદ્યાર્થીઓ ને ચઢવા અથવા ઉતારવા માટે ઊભી હોય ત્યારે..",
        option1: "હોર્ન વગાડો અને આગળ વધો.",
        option2:
            "ધીમેથી અને સાવચેતી થી આગળ વધો કારણકે વિદ્યાર્થી અચાનક રોડ ક્રોસ કરી શકે તેવી શક્યતા છે.",
        option3: "ખાસ કાળજી લેવાની જરૂર નથી.",
        ans: 2));
    insertQuestions(Questions(
        question: "ડાબી બાજુ વળાંક લેતી વખતે તમે શું કરશો?",
        option1:
            "ડાબી બાજુ સિગ્નલ બતાવી વાહન સેન્ટર માં લઇ ડાબી બાજુ વળાંક લઈશું.",
        option2: "હોર્ન વગાડી ડાબી બાજુ વળાંક લઈશું.",
        option3:
            "ડાબી બાજુનો સિગ્નલ બતાવી રોડ ની ડાબી સાઈડ વાહન રાખીને વળાંક લઈશું.",
        ans: 3));
    insertQuestions(Questions(
        question: "સીટ ઉપર લગાવેલ હેડ રેસ્ટ કઈ રીતે ઉપયોગી છે?",
        option1: "Driving કરતા આરામ મળે છે.",
        option2: "અકસ્માત વખતે ડોક ની ઈજા થી બચાવે છે.",
        option3: "સીટ સારી દેખાય તે માટે છે.",
        ans: 2));
    insertQuestions(Questions(
        question: "તમારી પાછળ જો એમ્બુલન્સ નજીક આવી ગઈ હોય તો..",
        option1: "સામેથી જો કોઈ વાહન આવતું હોય તો સાઈડ આપી દો.",
        option2: "કોઈ અગ્રતા આપવાની જરૂર નથી.",
        option3: "પોતાનું વાહન રોડ ની સાઈડ માં લઈને રસ્તો કરી આપો",
        ans: 3,
        isImage: 0,
        img: 0));
    insertQuestions(Questions(
        question:
            "રિક્ષા ચાલક ટૂંકા અંતર ના ભાડા માટે ગ્રાહક ને લઇ જવાની ના પડે તો..",
        option1: "લાઇસન્સ સસ્પેન્ડ અથવા રદ થઇ શકે છે.",
        option2: "ફક્ત દંડ થઇ શકે છે.",
        option3: "બંને થઇ શકે છે.",
        ans: 3,
        isImage: 0,
        img: 0));
    insertQuestions(Questions(
        question: "યુ ટર્ન લેતી વખતે સિગ્નલ કઈ રીતે દર્શાવાય?",
        option1: "ડાબી બાજુ વળવાનું સિગ્નલ.",
        option2: "જમણી બાજુનું વળવાનું સિગ્નલ.",
        option3: "ધીમું પાડવાનું સિગ્નલ.",
        ans: 2,
        isImage: 0,
        img: 0));
    insertQuestions(Questions(
        question: "કઈ પરિસ્થિતિ માં ઓવર ટેકિંગ કરવાની મનાઈ છે?",
        option1: "સ્ટેટ હાઈવે",
        option2: "પંચાયત રોડ ઉપર",
        option3: "સંકડા પુલ ઉપર",
        ans: 3));
    insertQuestions(Questions(
        question: "નીચે મુજબ ની નિશાની શું બતાવે છે?",
        option1: "એક તરફી રસ્તો.",
        option2: "બંને દિશા માં વાહનો લઇ જવાની મનાઈ છે.",
        option3: "ઓવર ટેક કરવાની મનાઈ છે.",
        ans: 1,
        isImage: 1,
        img: 36));
    insertQuestions(Questions(
        question: "નીચે મુજબ ની નિશાની શું બતાવે છે?",
        option1: "સીધુ ચઢાણ.",
        option2: "સીધુ ઉતરાણ.",
        option3: "ચીકણો રસ્તો.",
        ans: 1,
        isImage: 1,
        img: 37));
    insertQuestions(Questions(
        question: " નીચે મુજબ ની નિશાની શું બતાવે છે?",
        option1: "સીધુ ચઢાણ.",
        option2: "સીધુ ઉતરાણ.",
        option3: "ચીકણો રસ્તો.",
        ans: 2,
        isImage: 1,
        img: 38));
    insertQuestions(Questions(
        question: "નીચે મુજબ ની નિશાની શું બતાવે છે?",
        option1: "ડાબી બાજુ હાંકો.",
        option2: "ડાબી બાજુ રસ્તો નથી.",
        option3: "ફરજીયાત ડાબી બાજુ વાળો.",
        ans: 3,
        isImage: 1,
        img: 39));
    insertQuestions(Questions(
        question: "નીચે મુજબ ની નિશાની શું બતાવે છે?",
        option1: "અંકુશ નો અંત.",
        option2: "વાહન ને અલ્પ સમય માટે પણ ઉભું રાખવાની મનાઈ છે.",
        option3: "પાર્કિંગ ની મનાઈ છે.",
        ans: 2,
        isImage: 1,
        img: 40));

    insertQuestions(Questions(
        question: "નીચે મુજબ ની નિશાની શું બતાવે છે?",
        option1: "રસ્તો આપો",
        option2: "હોસ્પિટલ છે",
        option3: "પ્રથ્મિક ચિકિત્સાલય",
        ans: 2,
        isImage: 1,
        img: 41));
    insertQuestions(Questions(
        question: "નીચે મુજબ ની નિશાની શું બતાવે છે?",
        option1: "જમણી બાજુ વાળો.",
        option2: "જમણી બાજુ સાઈડ રોડ છે.",
        option3: "રોડ ની જમણી સાઈડ વાહન ચલાવો.",
        ans: 1,
        isImage: 1,
        img: 42));
    insertQuestions(Questions(
        question: "નીચે મુજબ ની નિશાની શું બતાવે છે?",
        option1: "આગળ right side અને left side રોડ છે.",
        option2: "વાંકો ચૂકો રસ્તો.",
        option3: "જમણે અને ડાબે વળવું નહિ.",
        ans: 1,
        isImage: 1,
        img: 43));
    insertQuestions(Questions(
        question: "નીચે મુજબ ની નિશાની શું બતાવે છે?",
        option1: "ડાબી બાજુ રોડ છે.",
        option2: "ડાબે વાળો.",
        option3: "ડાબી બાજુ વળવું નહિ.",
        ans: 1,
        isImage: 1,
        img: 44));
    insertQuestions(Questions(
        question: "નીચે મુજબ ની નિશાની શું બતાવે છે?",
        option1: "આગળ સાંકડો રસ્તો છે.",
        option2: "વાય ક્રોસિંગ છે.",
        option3: "આગળ રસ્તો પહોળો છે.",
        ans: 3,
        isImage: 1,
        img: 45));
    insertQuestions(Questions(
        question: "નીચે મુજબ ની નિશાની શું બતાવે છે?",
        option1: "જમણી બાજુ થી પ્રવેશ મનાઈ છે.",
        option2: "ડાબી બાજુ થી પ્રવેશ મનાઈ છે.",
        option3: "ઓવર ટેકિંગ ની મનાઈ છે.",
        ans: 3,
        isImage: 1,
        img: 46));
    insertQuestions(Questions(
        question: "નીચે મુજબ ની નિશાની શું બતાવે છે?",
        option1: "રસ્તો આપો.",
        option2: "હોસ્પિટલ છે.",
        option3: "આગળ ટ્રાફિક આઈલેન્ડ છે.",
        ans: 1,
        isImage: 1,
        img: 47));
    insertQuestions(Questions(
        question: " નીચે મુજબ ની નિશાની શું બતાવે છે?",
        option1: "નો એન્ટ્રી",
        option2: "વન-વે",
        option3: "ગતિ મર્યાદા નો અંત",
        ans: 1,
        isImage: 1,
        img: 48));
    insertQuestions(Questions(
        question: "નીચે મુજબ ની નિશાની શું બતાવે છે?",
        option1: "જમણી બાજુ વળવું મનાઈ છે.",
        option2: "જમણી બાજુ તીવ્ર વળાંક.",
        option3: "U-turn લેવાની મનાઈ છે.",
        ans: 2,
        isImage: 1,
        img: 49));
    insertQuestions(Questions(
        question: "નીચે મુજબ ની નિશાની શું બતાવે છે?",
        option1: "ડાબી બાજુ નો વળાંક.",
        option2: "ડાબી બાજુ ચઢાણ.",
        option3: "ડાબી બાજુ રાખો.",
        ans: 1,
        isImage: 1,
        img: 50));
    insertQuestions(Questions(
        question: " નીચે મુજબ ની નિશાની શું બતાવે છે?",
        option1: "હોર્ન વગાડવાની મનાઈ છે.",
        option2: "ફરજીયાત હોર્ન વગાડવો.",
        option3: "હોર્ન વગાડી શકાય.",
        ans: 1,
        isImage: 1,
        img: 51));
    insertQuestions(Questions(
        question: "નીચે મુજબ ની નિશાની શું બતાવે છે?",
        option1: "રાહદારી માટે નું ક્રોસિંગ.",
        option2: "રાહદારી પ્રવેશ કરી શકે છે.",
        option3: "રાહદારી માટે મનાઈ છે.",
        ans: 1,
        isImage: 1,
        img: 52));
    insertQuestions(Questions(
        question: " નીચે મુજબ ની નિશાની શું બતાવે છે?",
        option1: "વિદ્યાર્થી માટે મનાઈ છે.",
        option2: "રાહદારી માટે માન્ય છે.",
        option3: "રાહદારી માટે મનાઈ છે.",
        ans: 3,
        isImage: 1,
        img: 53));
    insertQuestions(Questions(
        question: "નીચે મુજબ ની નિશાની શું બતાવે છે?",
        option1: "હોસ્પિટલ",
        option2: "આરામ ગૃહ",
        option3: "ફસ્ટ એઇડ",
        ans: 2,
        isImage: 1,
        img: 54));
    insertQuestions(Questions(
        question: "નીચે મુજબ ની નિશાની શું બતાવે છે?",
        option1: "ફાટક વાળું રેલ્વે ક્રોસિંગ",
        option2: "ફાટક વગર નું રેલ્વે ક્રોસિંગ",
        option3: "૨૦૦ મીટર આગળ ફાટક વાળું રેલ્વે ક્રોસિંગ",
        ans: 1,
        isImage: 1,
        img: 55));
    insertQuestions(Questions(
        question: "નીચે મુજબ ની નિશાની શું બતાવે છે?",
        option1: "આગળ સ્કૂલ છે.",
        option2: "રાહદારી નું ક્રોસિંગ.",
        option3: "રાહદારી માટે ક્રોસ કરવાની મનાઈ છે.",
        ans: 1,
        isImage: 1,
        img: 56));
    insertQuestions(Questions(
        question: "નીચે મુજબ ની નિશાની શું બતાવે છે?",
        option1: "સીધા જાઓ.",
        option2: "એક માર્ગી રસ્તો.",
        option3: "બંને દિશા માં જવાની મનાઈ છે.",
        ans: 1,
        isImage: 1,
        img: 57));
    insertQuestions(Questions(
        question: "નીચે મુજબ ની નિશાની શું બતાવે છે?",
        option1: "સીધા જાઓ.",
        option2: "એક માર્ગી રસ્તો.",
        option3: "બંને દિશા માં જવાની મનાઈ છે.",
        ans: 3,
        isImage: 1,
        img: 58));
    insertQuestions(Questions(
        question: "નીચે મુજબ ની નિશાની શું બતાવે છે?",
        option1: "ખરબચડો રસ્તો.",
        option2: "ચીકણો રસ્તો.",
        option3: "ખડક ના પથ્થરો ઉપર થી પડે તેમ છે.",
        ans: 3,
        isImage: 1,
        img: 59));
    insertQuestions(Questions(
        question: " નીચે મુજબ ની નિશાની શું બતાવે છે?",
        option1: "સાઈડ રોડ આગળ થી બંધ છે.",
        option2: "ડાબી બાજુ વળાંક છે.",
        option3: "આગળ પુલ છે.",
        ans: 1,
        isImage: 1,
        img: 60));
    insertQuestions(Questions(
        question: "નીચે મુજબ ની નિશાની શું બતાવે છે?",
        option1: "આગળ બેરીયર છે.",
        option2: "રેલ્વે ક્રોસિંગ છે.",
        option3: "આગળ વજન કાંટો છે.",
        ans: 1,
        isImage: 1,
        img: 61));
    insertQuestions(Questions(
        question: " નીચે મુજબ ની નિશાની શું બતાવે છે?",
        option1: "વાહન લપસી જાય એવો ચીકણો રસ્તો.",
        option2: "પથ્થર વાળો કાચો રસ્તો.",
        option3: "મોટર કાર માટે મનાઈ છે.",
        ans: 1,
        isImage: 1,
        img: 62));
    insertQuestions(Questions(
        question: "નીચે મુજબ ના સ્થળો એ પાર્કિંગ ની મનાઈ છે.",
        option1: "અગ્નિશામક પ્રણાલી ને અવરોધ પડે તેમ",
        option2: "જાહેર કુવા પાસે",
        option3: "રસ્તા ની ડાબી બાજુ એ",
        ans: 1));
    insertQuestions(Questions(
        question: "વળાંક નજીક પહોંચો ત્યારે ઓવર ટેક કરવું?",
        option1: "માન્ય છે.",
        option2: "માન્ય નથી.",
        option3: "કાળજી લઈને માન્ય છે.",
        ans: 2));
    insertQuestions(Questions(
        question: "નીચે મુજબ ની નિશાની શું બતાવે છે?",
        option1: "બધા પ્રકાર ના વાહનો માટે પ્રવેશ બંધ.",
        option2: "કાર તથા મોટર સાઇકલ માટે બંધ.",
        option3: "કાર તથા મોટર સાઇકલ માટે પ્રવેશ.",
        ans: 1,
        isImage: 1,
        img: 65));
    insertQuestions(Questions(
        question: "નીચે મુજબ ની નિશાની શું બતાવે છે?",
        option1: "વાહન થોભો.",
        option2: "નો પાર્કિંગ.",
        option3: "આગળ હોસ્પિટલ છે.",
        ans: 2,
        isImage: 1,
        img: 66));
    insertQuestions(Questions(
        question: "નીચે મુજબ ની નિશાની શું બતાવે છે?",
        option1: "ખાડા ટેકરા વાળો કે સ્પીડ બ્રેકર રસ્તો",
        option2: "વાંકો ચૂકો રસ્તો.",
        option3: "ઘાટ રોડ.",
        ans: 1,
        isImage: 1,
        img: 67));
    insertQuestions(Questions(
        question: "નીચે મુજબ ની નિશાની શું બતાવે છે?",
        option1: "હોડી સેવા છે.",
        option2: "આગળ રસ્તો નથી.",
        option3: "રસ્તા ઉપર પાણી છે.",
        ans: 1,
        isImage: 1,
        img: 68));
    insertQuestions(Questions(
        question: "નીચે મુજબ ની નિશાની શું બતાવે છે?",
        option1: "રસ્તા ની મધ્ય માં ગટર લાઈન છે.",
        option2: "આગળ પુલ છે.",
        option3: "રોડ ડીવાઈડરમાં જગ્યા છે.",
        ans: 3,
        isImage: 1,
        img: 69));
    insertQuestions(Questions(
        question: "નીચે મુજબ ની નિશાની શું બતાવે છે?",
        option1: "પશુ માટે મનાઈ છે.",
        option2: "રસ્તા ઉપર ઢોર-પશુ આવવાની શક્યતા છે.",
        option3: "વાહન માં પશુ લઇ જવાની મનાઈ છે.",
        ans: 2,
        isImage: 1,
        img: 70));
    insertQuestions(Questions(
        question: "કોઈપણ વાહન ચલાવતી વખતે મોબાઈલ ઉપર વાત કરવી જોઈએ?",
        option1: "હા",
        option2: "ના",
        option3: "વાહન ધીમું કરીને વાત કરવી",
        ans: 2));
    insertQuestions(Questions(
        question: "જયારે વાહન માં બળતણ ( પેટ્રોલ/ડીઝલ/ગેસ ) ભરતા હોય ત્યારે..",
        option1: "હવા ચેક કરવાની મનાઈ છે.",
        option2: "ધુમ્રપાન કરવું નહિ.",
        option3: "વાહન ની કોઈપણ લાઈટ ચાલુ કરવી નહિ.",
        ans: 2));
    insertQuestions(Questions(
        question: "મોટર સાઇકલ માટે વધુ માં વધુ સ્પીડ..",
        option1: "કોઈ મર્યાદા નથી.",
        option2: "૫૦ કિમી/કલાક",
        option3: "૬૦ કિમી/કલાક",
        ans: 2));
    insertQuestions(Questions(
        question: "મોબાઈલ ફોન ક્યારે વાપરી શકાય?",
        option1: "જયારે વાહન અત્યંત ધીમી ગતિ એ ચાલતું હોય ત્યારે...",
        option2:
            "જયારે વાહન મધ્યમ ગતિ એ એક્ષ્પ્રેસ હાઇવે પર ચાલતું હોય ત્યારે...",
        option3: "જયારે વાહન સાઈડ માં પાર્ક કરેલ હોય ત્યારે...",
        ans: 3));
    insertQuestions(Questions(
        question: "નીચે મુજબ ના સ્થળો એ પાર્કિંગ ની મનાઈ છે.",
        option1: "હોસ્પિટલ ના દરવાજા પાસે..",
        option2: "રોડ ની ડાબી બાજુ એ..",
        option3: "માર્કેટ એરિયા",
        ans: 1));
    insertQuestions(Questions(
        question:
            "ખાનગી વાહન માં કેટલા વ્યક્તિ ને બેસાડી શકાય તે કયા દસ્તાવેજ માં હોય છે?",
        option1: "Registration Certificate માં દર્શાવેલ સંખ્યા મુજબ ની વ્યક્તિ",
        option2: "ટેક્ષ ટોકન માં",
        option3: "પરમિટ માં",
        ans: 1));
    insertQuestions(Questions(
        question: "આગળ ના વાહન ને ઓવરટેક કરવા દેવા માટે સિગ્નલ બતાવેલ નથી..",
        option1: "આપણે ઓવરટેક કરી શકીએ.",
        option2: "આપણે ઓવરટેક કરીશું નહિ.",
        option3: "હોર્ન વગાડી આપડે ઓવરટેક કરી શકીએ.",
        ans: 2));
    insertQuestions(Questions(
        question: "Driver રસ્તા ઉપર પોતાનું વાહન કઈ બાજુ ચલાવશે?",
        option1: "રસ્તા ની જમણી બાજુ",
        option2: "રસ્તા ની ડાબી બાજુ",
        option3: "રસ્તા ની મધ્ય માં",
        ans: 2));
    insertQuestions(Questions(
        question:
            "ચાર રસ્તા ઉપર સિગ્નલ ની પીળી લાઈટ દેખાય ત્યાં પહોચતા વાહન નો ચાલક..",
        option1: "સલામતી નક્કી કરીને વાહન હંકારી જશે.",
        option2: "થોભવા માટે વાહન ધીમું પાડશે.",
        option3: "હોર્ન વગાડશે અને આગળ વધશે.",
        ans: 2));
    insertQuestions(Questions(
        question: "વાહન ની હેન્ડ બ્રેક નો ઉપયોગ ક્યારે કરવામાં આવે છે?",
        option1: "વાહન ની ગતિ ધીમી કરવા માટે..",
        option2: "અચાનક બ્રેક મારવા..",
        option3: "વાહન પાર્કિંગ કરવા..",
        ans: 3));
    insertQuestions(Questions(
        question: "બે કરતા વધુ વ્યક્તિઓ મોટર સાઇકલ પર જાય તો..",
        option1: "માત્ર અનિવાર્ય સંજોગોમાં..",
        option2: "કાયદા નો ભંગ છે.",
        option3: "જયારે ટ્રાફિક નું પ્રમાણ હળવું હોય ત્યારે..",
        ans: 2));
    insertQuestions(Questions(
        question:
            " જયારે અંધ વ્યક્તિ સફેદ લાકડી હાથમાં પકડી રોડ ક્રોસ કરે ત્યારે..",
        option1:
            "વાહન નો ચાલક સફેદ લાકડી ને વાહન ઉભું રાખવા માટે નું સિગ્નલ સમજશે.",
        option2: "હોર્ન વગાડશો અને આગળ વધશો.",
        option3: "વાહન ધીમું કરશો અને સાવચેતીથી આગળ વધશો.",
        ans: 1));
    insertQuestions(Questions(
        question: "રીવર્સ ગીઅર માં વાહન ચલાવવાની મનાઈ છે..",
        option1: "એક માર્ગીય રસ્તા ઉપર",
        option2: "બજારમાં",
        option3: "સ્ટેટ હાઈવે ઉપર",
        ans: 1));
    insertQuestions(Questions(
        question:
            "તમે એવા ચાર રસ્તા ઉપર પહોચો છો કે જ્યાં સિગ્નલ લાઈટ કે પોલીસમેન નથી..",
        option1: "અન્ય રોડ ઉપરથી ચાર રસ્તા તરફ આવતા દરેક વાહન ને જવા દેશો.",
        option2: "યોગ્ય સિગ્નલ આપી, હોર્ન વગાડી આગળ વધશો.",
        option3:
            "તમારી જમણી તરફથી ચાર રસ્તા ઉપર આવતા ટ્રાફિક ને રસ્તો આપી ને આગળ વધશો",
        ans: 3));
    insertQuestions(Questions(
        question: " કયા પ્રકાર ના હોર્ન માન્ય છે?",
        option1: "એર-હોર્ન",
        option2: "મલ્ટી-ટોન હોર્ન",
        option3: "ઈલેકટ્રીક હોર્ન",
        ans: 3));
    insertQuestions(Questions(
        question: "વાહન ના વીમા ની મુદત",
        option1: "૬ માસ",
        option2: "૧ વર્ષ",
        option3: "૨ વર્ષ",
        ans: 2));
    insertQuestions(Questions(
        question: "જ્યાં પાર્કિંગ ની મનાઈ છે તેવી જગ્યા કઈ?",
        option1: "પાર્કિંગ કરેલ વાહન ની સામેની જગ્યા",
        option2: "એક માર્ગીય રસ્તા ઉપર",
        option3: "ફૂટ-પાથ ઉપર",
        ans: 3));
    insertQuestions(Questions(
        question: "નીચે મુજબ ની નિશાની શું બતાવે છે?",
        option1: "ડાબી બાજુ વાળવાનો ઈરાદો છે.",
        option2: "જમણી બાજુ વાળવાનો ઈરાદો છે.",
        option3: "બીજા બધા જ વાહનો ને ઉભા રેહવા વિનંતી છે.",
        ans: 1,
        isImage: 1,
        img: 118));
    insertQuestions(Questions(
        question: " મોટર સાઇકલ ઉપર પાછળ વ્યક્તિને બેસી જવી હોય ત્યારે..",
        option1:
            "વાહન ઉપર ફૂટ રેસ્ટ, હેન્ડ ગ્રીપ તથા સાઈડ ગાર્ડ લગાડવામાં આવશે.",
        option2: "વાહન સાથે સાઈડ-કાર જોડવામાં આવશે.",
        option3: "વાહન ઉપર રીઅર વ્યુ મિરર ફીટ કરવામાં આવશે.",
        ans: 1));
    insertQuestions(Questions(
        question:
            "અન્ય વ્યક્તિઓ કે પેસેન્જર ને અડચણ પડે તેમ વાહન ને જાહેર રસ્તા ઉપર રાખવામાં આવે તો..",
        option1: "લાઈસન્સ સસ્પેન્ડ અથવા રદ થઇ શકે છે.",
        option2: "ફક્ત દંડ થઇ શકે છે.",
        option3: "બંને થઇ શકે છે.",
        ans: 3));
    insertQuestions(Questions(
        question: "નોન ટ્રાન્સ્પોટ વાહન સાથે રાખવાના દસ્તાવેજો..",
        option1: "આર.સી. બુક, પીયુસી, વીમા પ્રમાણપત્ર, લાઇસન્સ",
        option2: "આર.સી. બુક, વીમા પ્રમાણપત્ર , ટેક્ષ ટોકન",
        option3: "આર.સી. બુક, પરમિટ ટ્રીપશીપ",
        ans: 1));
    insertQuestions(Questions(
        question:
            "તમે એવા ચાર રસ્તા ઉપર પહોચો છો જ્યાં પીળી સિગ્નલ લાઈટ ઝબકારા મારે છે ત્યારે..",
        option1: "કોઈપણ જાત નો પ્રતિબંધ ન હોવાથી એ જ ગતિ એ આગળ વધશો.",
        option2: "વાહન થોભાવી લીલી લાઈટ થાય ત્યાં સુધી ઉભા રહેશો.",
        option3: "વાહન ધીમું કરીને સલામત લાગે તેમ નક્કી થાય તો આગળ વધશો.",
        ans: 3));
    insertQuestions(Questions(
        question: "ડાબી બાજુ વળાંક લેતી વખતે મોટર સાઇકલ ચલાવનાર શું કરશે?",
        option1: "પોતાનો ડાબો હાથ બહાર કાઢી ડાબી બાજુ બતાવશે.",
        option2: "હાથ થી સિગ્નલ બતાવશે નહિ.",
        option3: "પોતાના જમણા હાથ થી ડાબી બાજુ જવા સિગ્નલ બતાવશે.",
        ans: 3));
    insertQuestions(Questions(
        question:
            " પાછળ ના વાહન ને જયારે આપણા વાહન ને ઓવર ટેક કરવાનું શરુ કર્યું હોય ત્યારે..",
        option1: "આપણે બીજા વાહન ને ઓવર ટેક કરીશું નહિ.",
        option2: "આપણે બીજા વાહન ને ઓવર ટેક કરી શકીએ.",
        option3: "હોર્ન વગાડીને આપણે બીજા વાહન ને ઓવર ટેક કરી શકીએ છીએ.",
        ans: 1));
    insertQuestions(Questions(
        question:
            " નાના સાઈડ રોડ ઉપરથી મેઈન રોડ ઉપર પ્રવેશ કરતી વખતે વાહનચાલક શેને અગ્રતા આપશે?",
        option1: "ડાબી બાજુ થી આવતા દરેક વાહન ને જવા દેશે.",
        option2: "જમણી બાજુ થી આવતા દરેક વાહન ને જવા દેશે.",
        option3: "પસાર થતા દરેક વાહન ને જવા દેશે.",
        ans: 2));
    insertQuestions(Questions(
        question: "તમે જયારે ચઢાંણવાળા રસ્તા ઉપર વાહન ચલાવતા હોવ ત્યારે..",
        option1: "ઢાળ ઉતરતા વાહન ને પહેલા જવાની અગ્રતા આપવી.",
        option2: "ચઢાંણ ચઢતા વાહન ને પહેલા જવાની અગ્રતા આપવી.",
        option3: "વધુ વાહન લઇ જતા વાહન ને પહેલી અગ્રતા આપવી જોઈએ.",
        ans: 2));
    insertQuestions(Questions(
        question:
            "સફેદ રંગથી રસ્તા ઉપર તૂટક-તૂટક લાઈન ચીતરેલી હોય તો તમે શું કરશો?",
        option1: "તમે track બદલશો નહિ.",
        option2: "જરૂર પડે તો track બદલશો.",
        option3: "વાહન થોભાવી દેશો.",
        ans: 2));
    insertQuestions(Questions(
        question: "સિગ્નલ પર પીળા રંગ ની લાઈટ ઝબુક-ઝબુક થાય છે તેનો અર્થ..",
        option1: "લીલી લાઈટ થાય ત્યાં સુધી થોભો.",
        option2: "વાહન થોભાવો અને સલામત હોય તો આગળ વધો.",
        option3: "વાહન ની ગતિ ઓછી કરો અને સલામતી પૂર્વક આગળ વધો.",
        ans: 3));
    insertQuestions(Questions(
        question:
            "વરસાદ માં બ્રેક લગાવતી વખતે સ્ટોપીંગ ડિસ્ટન્સ ઉપર શું અસર પડે છે?",
        option1: "સ્ટોપીંગ ડિસ્ટન્સ વધે છે.",
        option2: "સ્ટોપીંગ ડિસ્ટન્સ ઓછુ થાય છે.",
        option3: "કોઈ અસર થતી નથી.",
        ans: 1));
    insertQuestions(Questions(
        question:
            " વાહન ચલાવતી વખતે ચાલકે લાઇસન્સ કયા સ્વરૂપે સાથે રાખવું ફરજીયાત છે?",
        option1: "અસલ લાઇસન્સ",
        option2: "રંગીન ઝેરોક્ષ",
        option3: "પ્રમાણિત નકલ",
        ans: 1));
    insertQuestions(Questions(
        question:
            "કોઈ જગ્યા એ રસ્તા ઉપર તમારી કારને રીવર્સ કરવી સલામત નથી. તમારે..",
        option1: "આગળ જવું અને રીવર્સ કરવા અનુકુળ જગ્યા શોધશો.",
        option2: "બધા જ રીઅર વ્યુ મિરર નો યોગ્ય ઉપયોગ કરવો.",
        option3: "રીવર્સ હોર્ન ચાલુ કરી વાહન રીવર્સ કરશો.",
        ans: 1));
    insertQuestions(Questions(
        question: "રાત્રી દરમિયાન જયારે રોડ ની સાઈડ માં વાહન થોભાવો ત્યારે..",
        option1: "વાહન ને લોક કરવું.",
        option2: "લાઇસન્સ ધરાવનાર વ્યક્તિ ચાલક સીટ ઉપર બેસેલી હોવી જોઈએ.",
        option3: "પાર્કિંગ લાઈટ વાહન ની ચાલુ કરવી જોઈએ.",
        ans: 3));
    insertQuestions(Questions(
        question: "તમે વાહન ની ડાબી બાજુએ થી ઓવર ટેક કરી શકો છો જો -",
        option1:
            "આગળ નું વાહન જમણી બાજુ વળવા માટે સિગ્નલ બતાવીને વાહન ને જમણી બાજુ રાખે..",
        option2: "ડાબી બાજુ પુરતી જગ્યા હોય તો..",
        option3: "આગળ નું વાહન ધીમી ગતિ કરતુ હોય તો..",
        ans: 1));
    insertQuestions(Questions(
        question: "તમે મોટર સાઇકલ નું લનર્સ લાઇસન્સ ધરાવતા હોય તો..",
        option1: "તમે જયારે ટ્રાફિક ઓછો હોય ત્યારે હાકશો.",
        option2:
            "મોટર સાઇકલ નું લાઇસન્સ ધરાવનાર ઇનસ્ટ્રકટર તમારી સાથે હશે તો જ તમે હાકશો.",
        option3: "તમે વાહન ઉપર કોઈપણ વ્યક્તિ ને પાછળ બેસાડશો.",
        ans: 2));
    insertQuestions(Questions(
        question: "નીચેના સંજોગો માં ઓવર-ટેકિંગ મનાઈ છે.",
        option1: "અન્ય ટ્રાફિક ને જયારે ભય ઉભો થાય તેવી શક્યતા હોય ત્યારે",
        option2: "આગળ ના વાહનની ગતિ ધીમી પડે ત્યારે..",
        option3: "રાત્રી દરમિયાન",
        ans: 1));
    insertQuestions(Questions(
        question: "ખાનગી વાહન ની નંબર પ્લેટ નો રંગ..",
        option1: "કાળા રંગ ની પ્લેટ ઉપર પીળા અક્ષર",
        option2: "પીળા રંગ ની પ્લેટ ઉપર કાળા અક્ષર",
        option3: "સફેદ રંગ ની પ્લેટ ઉપર કાળા અક્ષર",
        ans: 3));
    insertQuestions(Questions(
        question: "કોમર્શીયલ વાહન ચલાવવા માટે નું લાઇસન્સ લેવા માટે જરૂરી ઉંમર",
        option1: "૧૮ વર્ષ",
        option2: "૨૧ વર્ષ",
        option3: "૨૦ વર્ષ",
        ans: 3));
    insertQuestions(Questions(
        question: " નીચે મુજબ ની નિશાની શું સૂચવે છે?",
        option1: "લેન બદલી શકાય છે.",
        option2: "સાવધાની થી લેન બદલી શકાય છે.",
        option3: "લેન બદલવાની પરવાનગી નથી.",
        ans: 2,
        isImage: 1,
        img: 138));
    insertQuestions(Questions(
        question: " વાહન પાર્કિંગ કરતી વખતે..",
        option1: "ગીયર માં રાખવું",
        option2: "પાર્કિંગ બ્રેક લગાડો.",
        option3: "માત્ર હેઝાર્ડ (પાર્કિંગ) લાઈટ ચાલુ કરો.",
        ans: 2));
    insertQuestions(Questions(
        question: "રોડ ઉપર ઝેબ્રા લાઇન્સ શું દર્શાવે છે?",
        option1: "વાહન ઉભું રાખવા",
        option2: "રાહદારી ને રોડ ક્રોસ કરવા માટે નો રસ્તો.",
        option3: "વાહનો ને અગ્રતા આપવા",
        ans: 2));
    insertQuestions(Questions(
        question: "ધુમ્મસ લેમ્પ (ફોગ લેમ્પ) નો ઉપયોગ કરવામાં આવે છે...",
        option1: "રાત્રી દરમિયાન",
        option2: "વાતાવરણ માં ધુમ્મસ હોય ત્યારે..",
        option3: "સામેનું વાહન જયારે ડીમ લાઈટ નો ઉપયોગ ના કરે ત્યારે..",
        ans: 2));
    insertQuestions(Questions(
        question: " વાહન નો ચાલક ઓવર ટેક કરી શકે છે..",
        option1: "જયારે ચઢાંણ ઉપરથી નીચે ઉતરતી વખતે",
        option2: "જો રસ્તો પૂરતા પ્રમાણ માં પહોળો ન હોય ત્યારે",
        option3:
            "આગળ જતા વાહન નો ચાલક ઓવર ટેઈક કરવા દેવાની નિશાની બતાવે ત્યારે",
        ans: 3));
    insertQuestions(Questions(
        question: "સામેથી આવતા વાહનને તમારી કઈ સાઈડ થી પસાર થવા દેશો?",
        option1: "તમારી જમણી બાજુથી",
        option2: "તમારી ડાબી બાજુથી",
        option3: "કોઈપણ અનુકુળ બાજુથી",
        ans: 1));
    insertQuestions(Questions(
        question:
            "વાહન ચાલક પોતાનો જમણો હાથ બહાર કાઢી હથેળી નીચે ની તરફ રાખી હાથ ઘણીવાર ઉપર નીચે કરે છે ત્યારે ?",
        option1: "તે ડાબી બાજુ વળવા માંગે છે.",
        option2: "તે પોતાનું વાહન ધીમું કરી રહ્યો છે.",
        option3: "તે પાછળ આવતા વાહન ને ઓવર ટેક કરવા માંગે છે.",
        ans: 2));
    insertQuestions(Questions(
        question: "ઓવર ટેકિંગ મનાઈ છે?",
        option1: "જયારે આગળ નો રસ્તો બરાબર ન દેખાતો હોય ત્યારે",
        option2: "રાત્રી દરમ્યાન",
        option3:
            "રસ્તા માં સેન્ટર માં સફેદ તુટક લાઈન નું માર્કિંગ કરેલું હોય ત્યારે..",
        ans: 1));
    insertQuestions(Questions(
        question:
            " લાઇસન્સ ની મુદત પૂરી થયા બાદ કેટલા સમય સુધી ચાલક વાહન ચલાવી શકે?",
        option1: "૩૦ દિવસ",
        option2: "૬૦ દિવસ",
        option3: "એક પણ દિવસ નહિ.",
        ans: 1));
    insertQuestions(Questions(
        question: "જયારે રસ્તો લપસણો છે તેવી નિશાની દેખાય ત્યારે વાહન ચાલક..",
        option1: "ગીયર બદલી ને ગતિ ધીમી કરશે.",
        option2: "બ્રેક લગાવશે.",
        option3: "એ ગતિ એ જ આગળ વધશે.",
        ans: 1));
    insertQuestions(Questions(
        question: "કાયદા મુજબ મોટર કાર ચલાવનાર વ્યક્તિ..",
        option1: "ચશ્માં પહેરશે.",
        option2: "સીટ બેલ્ટ બાંધશે.",
        option3: "ટોપી પહેરશે.",
        ans: 2));
    insertQuestions(Questions(
        question: "કાર ચલાવવા માટે નું લાઇસન્સ લેવા માટે જરૂરી ઉંમર",
        option1: "૧૬ વર્ષ",
        option2: "૧૮ વર્ષ",
        option3: "૨૦ વર્ષ",
        ans: 2));
    insertQuestions(Questions(
        question: "અકસ્માત ના કિસ્સામાં વાહન ચાલક લાઇસન્સ ધરાવતા નથી.",
        option1: "ઇન્સ્યોરન્સ કંપની સંપૂર્ણ કલેઈમ આપશે.",
        option2: "ઇન્સ્યોરન્સ કંપની સંપૂર્ણ કલેઈમ નામંજૂર કરશે.",
        option3: "અંશતઃ કલેઈમ મંજૂર કરશે.",
        ans: 2));
    insertQuestions(Questions(
        question: "વાહન ચલાવતી વખતે ચાલક કઈ રીતે થાક ઉતારશે?",
        option1: "દારૂ પીને",
        option2: "દર બે કલાકે વાહન ઉભું રાખી આરામ કરીને",
        option3: "સંગીત સાંભળીને",
        ans: 2));
    insertQuestions(Questions(
        question: "વાહન ચલાવતી વખતે મોબાઈલ ફોન નો ઉપયોગ કરવાથી",
        option1: "અકસ્માત ની શક્યતાઓ વધે છે.",
        option2: "કામનો અને સમયનો બચાવ થશે.",
        option3: "આપાતકાલીન સંજોગો માં માન્ય છે.",
        ans: 1));
    insertQuestions(Questions(
        question: "ઢોળાવવાળા રસ્તા ઉપરથી નીચે ઉતરતી વખતે તમે શું કરશો?",
        option1: "ક્લચ પેન્ડલ દબાવીને તમારા વાહન ને ચાલવા દેશો.",
        option2: "બળતણ બચાવવા એન્જીન બંધ કરીને વાહન ને ઉતારવા દેશો.",
        option3: "બંને ટાળશો.",
        ans: 3));
    insertQuestions(Questions(
        question: "રાત્રી ના સમયે તમારું વાહન પાર્કિંગ કરતી વખતે તમે શું કરશો?",
        option1: "પાર્કિંગ બ્રેક મારીશું.",
        option2: "પાર્કિંગ લાઈટ ચાલુ કરીશું.",
        option3: "બંને કરીશું.",
        ans: 3));
    insertQuestions(Questions(
        question:
            "લાલ અને સફેદ પટ્ટાવાળી રિબન થી ગાર્ડ કરેલી જગ્યા શું બતાવે છે?",
        option1: "રોડ નું રીપેરીંગ કામ ચાલુ છે.",
        option2: "સંભવિત અકસ્માત વિસ્તાર",
        option3: "આગળ ચેક પોસ્ટ છે.",
        ans: 1));
    insertQuestions(Questions(
        question: "આર.ટી.ઓ. દ્વારા આપવામાં આવેલ લાઇસન્સ ક્યાં માન્ય છે?",
        option1: "સમગ્ર દેશ માં",
        option2: "ફક્ત જે તે રાજ્ય માં",
        option3: "ફક્ત જે તે ડીસ્ટ્રીક માં",
        ans: 1));
    insertQuestions(Questions(
        question: "રોડ સાઈન માં વપરાતી સ્ટોપ લાઈનમાં કયો કલર હોય છે?",
        option1: "પીળો",
        option2: "સફેદ",
        option3: "પીળો અને કાળો",
        ans: 2));
    insertQuestions(Questions(
        question: "દ્વિચક્રી વાહન ચલાવતી વખતે મહિલાઓ માટે હેલ્મેટ પહેરવી..",
        option1: "કાયદા થી ફરજીયાત છે.",
        option2: "કાયદા થી ફરજીયાત નથી.",
        option3: "હેલ્મેટ પહેરવી કે નહિ તે તેમની મુનસફી પર છે.",
        ans: 1));
    insertQuestions(Questions(
        question:
            "અકસ્માત ના કિસ્સામાં પેસેન્જર ના બચાવ માટે સલામતી નું કયું સાધન ફરજીયાત છે?",
        option1: "સીટ બેલ્ટ",
        option2: "બ્રેક પેન્ડલ",
        option3: "એર બેગ",
        ans: 1));
    insertQuestions(Questions(
        question: "લાંબા વાહન ની પાચળ હાંકતી વખતે તમે.",
        option1: "તે વાહન થી ઓછુ અંતર જાળવશો.",
        option2: "તેની નજીક વાહન હાંકી શકો કારણકે એ વાહન ઉભું રેહવાનું નથી.",
        option3:
            "ઘણું વધારે અંતર રાખશો જેથી આગળ ના ટ્રાફિક ને સારી રીતે જોઈ શકાય.",
        ans: 3));
    insertQuestions(Questions(
        question:
            "અકસ્માત ના સંજોગો માં કોઈ વ્યક્તિને પીઠ/કરોડરજ્જુમાં ઈજા થઇ છે તો આપ...",
        option1: "ઘાયલ વ્યક્તિ ને ઊંચકીને સલામત સ્થળે લઇ જશો.",
        option2:
            "ઘાયલ વ્યક્તિ ને ખસેડશો નહિ અને અન્ય વાહન ચાલકોને અકસ્માત અંગે ચેતવણી આપશો.",
        option3: "ઘાયલ વ્યક્તિ ના પગ ઉચા કરીને ઇજને તપાસશો.",
        ans: 2));
    insertQuestions(Questions(
        question:
            "અકસ્માતના સંજોગોમાં કોઈ વ્યક્તિ ની ચામડી બળી ગઈ હોય તો આપ શું કરશો?",
        option1:
            "બળેલા ભાગને ઠંડા પાણીથી ધોઈને ઘાયલ વ્યક્તિને છાયડામાં લઇ જશો અને એમ્બ્યુલન્સ બોલાવશો.",
        option2: "ફોલ્લા પડ્યા હોય તો તે ફોડશો.",
        option3: "ચામડી સાથે ચોટેલા કપડા ઉખાડશો.",
        ans: 1));
    insertQuestions(Questions(
        question:
            "અકસ્માત ને લીધે જયારે ત્રીજી વ્યક્તિની સંપતિને નુકશાન થાય ત્યારે",
        option1: "વાહન ચાલક નજીક ના પોલીસ સ્ટેશન માં ૨૪ કલાક માં જાણ કરશે.",
        option2: "વાહન ચાલક નજીકના પોલીસ સ્ટેશન માં ૭ દિવસ માં જાણ કરશે.",
        option3: "કોઈપણ પોલીસ સ્ટેશન માં જાણ કરવાની જરૂર નથી.",
        ans: 1));
    insertQuestions(Questions(
        question: "જયારે મોટર વાહન અકસ્માત માં સંડોવાય ત્યારે આ વાહન હાંકનાર..",
        option1: "નજીક ના પોલીસ સ્ટેશન માં ૨૪ કલાક માં જાણ કરશે.",
        option2: "નજીક ના પોલીસ સ્ટેશન માં ૧૨ કલાક માં જાણ કરશે.",
        option3: "નજીક ના પોલીસ સ્ટેશન માં ૪૮ કલાક માં જાણ કરશે.",
        ans: 1));
    insertQuestions(Questions(
        question:
            "જયારે ફાટક વગરના રેલ્વે ક્રોસિંગ પાસે વાહન પહોચે છે ત્યારે ફાટક ક્રોસ કરતા પહેલા ચાલક શું કરશે?",
        option1:
            "રસ્તાની ડાબી બાજુ વાહન ઉભું રાખી નીચે ઉતરીને ચાલક રેલ્વે લાઈન ઉપર જઈને ખાતરી કરશે",
        option2: "હોર્ન વગાડી બને એટલો ઝડપથી રેલ્વે લાઈન ક્રોસ કરશે.",
        option3: "રેઇલગાડી પસાર થાય ત્યાં સુધી થોભશો.",
        ans: 1));
    insertQuestions(Questions(
        question: " અયોગ્ય રીતે ગીયર બદલવાથી",
        option1: "ગીયર બોક્ષ ને નુકશાન થઇ શકે છે.",
        option2: "વધુ ફયુલ વપરાશે.",
        option3: "બંને થઇ શકે છે.",
        ans: 3));
    insertQuestions(Questions(
        question: "રસ્તા ઉપર લેઈન બદલતી વખતે..",
        option1: "હોર્ન વગાડો અને લેઈન બદલો.",
        option2: "ઈન્ડીકેટર બતાડો અને લેઈન બદલો.",
        option3:
            "ઈન્ડીકેટર બતાડવાની જરૂર નથી, ફક્ત રીઅર વ્યુ મિરર માં જુઓ અને લેન બદલો.",
        ans: 2));
    insertQuestions(Questions(
        question: "વાહન ઉભું રાખવા માટે ડાબી લાઈનમાં જવા તમે..",
        option1: "ડાબી બાજુ ની ઈન્ડીકેટર લાઈટ ચાલુ કરશો.",
        option2: "જમણી બાજુ ની ઈન્ડીકેટર લાઈટ ચાલુ કરશો.",
        option3: "પાર્કિંગ લાઈટ ચાલુ કરશો.",
        ans: 1));
    insertQuestions(Questions(
        question: "વાહન માં ટાયરોની આગળ પાછળ ફેર બદલી કરવી કેમ સલાહ ભરેલ છે?",
        option1: "એને લીધે વ્હીલ બેલેન્સીંગ જળવાઈ રહે છે.",
        option2: "એને લીધે વ્હીલ એલાઈમેન્ટ જળવાઈ રહે છે.",
        option3: "ટાયરોને અસામાન્ય ઘસારો અટકે છે.",
        ans: 3));
    insertQuestions(Questions(
        question: "સગીર બાળક વાહન ચલાવતા અકસ્માત કરે તે..",
        option1: "સગીર હોવાથી તેને સજા ન થઇ શકે.",
        option2: "બાળક ના માબાપ અથવા વાલીને પણ જવાબદાર ગણાશે.",
        option3: "કાયદેસર પોલીસ ફરિયાદ નોંધાવવી અને તે મુજબ દંડ થશે.",
        ans: 3));
    insertQuestions(Questions(
        question: "કાચા લાઇસન્સ ની મુદત શું છે?",
        option1: "જ્યાં સુધી પાકું લાઇસન્સ મેળવો ત્યાં સુધી",
        option2: "૬ મહિના",
        option3: "૩૦ દિવસ",
        ans: 2));
    insertQuestions(Questions(
        question: "તમે કોઈપણ વાહન ને કઈ બાજુ થી ઓવરટેક કરી શકો છો?",
        option1: "આગળ ના વાહન ની જમણી બાજુ થી",
        option2: "આગળ ના વાહન ની ડાબી બાજુ થી",
        option3: "જો રસ્તો પહોળો હોય તો ડાબી બાજુ થી",
        ans: 1));
    insertQuestions(Questions(
        question: "પ્રાથમિક સારવાર માં એસ.બી.સી. નો અર્થ શું થાય?",
        option1: "એર વે, બ્રીધ, કોન્ટેક્ટ",
        option2: "એર વે, બ્રીધીંગ, સર્ક્યુલેશન",
        option3: "એક્સીલરેટર, બ્રેક, ક્લચ",
        ans: 2));
    insertQuestions(Questions(
        question: "જે રોડ વન-વે તરીકે જાહેર થયેલ હોય ત્યાં",
        option1: "પાર્કિંગ ની મનાઈ છે.",
        option2: "ઓવર ટેકિંગ ની મનાઈ છે.",
        option3: "રીવર્સ ગીયર માં વાહન ચલાવવું નહિ.",
        ans: 3));
    insertQuestions(Questions(
        question:
            "અકસ્માત ના સંજોગોમાં માનવ જીવનને બચાવવા કયા પ્રકારનું જ્ઞાન આપને મદદરૂપ થઇ શકે છે?",
        option1: "વાહનની માવજત",
        option2: "પ્રાથમિક સારવાર",
        option3: "કાયદાકીય",
        ans: 2));
    insertQuestions(Questions(
        question: "નીચે મુજબ ના કિસ્સામાં પાર્કિંગ મનાઈ છે.",
        option1: "રસ્તા ની બાજુમાં",
        option2: "જ્યાં પાર્કિંગ કરવું માન્ય છે.",
        option3: "ટ્રાફિક સિગ્નલ લાઈટ પાસે..",
        ans: 3));
    insertQuestions(Questions(
        question:
            "કાર ના ડેશ બોર્ડ ઉપર લગાવેલ ટેમ્પરેચર મીટર શેનું તાપમાન બતાવે છે?",
        option1: "કાર ની બહાર ના વાતાવરણ નું તાપમાન",
        option2: "કાર ની અંદર નું તાપમાન",
        option3: "એન્જીન નું",
        ans: 3));
    insertQuestions(Questions(
        question: " ફૂટપાથ વગર ના રોડ ઉપર રાહદારી એ શું કરવું?",
        option1: "રોડ ની ડાબી બાજુ એ ચાલવું",
        option2: "રોડ ની જમણી બાજુ એ ચાલવું",
        option3: "રોડ ની કોઈપણ બાજુ એ ચાલવું",
        ans: 2));
    insertQuestions(Questions(
        question: " બ્રેક લાઈટ વગર વાહન ચલાવવું એ",
        option1: "દ્વિ-ચક્રી વાહનો માટે માન્ય છે.",
        option2: "એ ગુન્હો છે.",
        option3: "ફક્ત ટ્રક માં માન્ય",
        ans: 2));
    insertQuestions(Questions(
        question: "નીચે મુજબ ના વાહનો ને જવાની અગ્રતા આપવી જોઈએ..",
        option1: "નાના વાહનો",
        option2: "એમ્બ્યુલન્સ અને ફાયર ફાઈટર વાહનો",
        option3: "એક્ષ્પ્રેસ્સ તથા સુપર એક્ષ્પ્રેસ્સ બસ",
        ans: 2));
    insertQuestions(Questions(
        question: "રોડ ની મધ્ય માં દોરેલ પીળા રંગ ના સળંગ પટ્ટા એટલે..",
        option1: "ઓવેરટેક કરી શકીએ..",
        option2: "પીળી લાઈન ક્રોસ કરવાની મનાઈ છે.",
        option3: "ચાલક આ લાઈન પાર કરી શકે છે.",
        ans: 2));
    insertQuestions(Questions(
        question:
            "માન્ય સેન્ટર માંથી તમે એલપીજી/સીએનજી કીટ ફીટ કરાવી છે. આરટીઓ માંથી તેની નોંધણી કરાવવી ફરજીઆત છે?",
        option1: "હા",
        option2: "ના",
        option3: "જરૂરી નથી.",
        ans: 1));
    insertQuestions(Questions(
        question: "આલ્કોહોલ નું સેવન કાર્ય બાદ વાહન ચલાવવાથી...",
        option1: "ચાલક નું જજમેન્ટ ખોટું પડી શકે છે.",
        option2: "ચાલક ની દ્રષ્ટિ નબળી પડી શકે છે.",
        option3: "બંને થઇ શકે છે.",
        ans: 3));
    insertQuestions(Questions(
        question:
            "પુખ્ત વયના વ્યક્તિ ના હૃદયના ધબકારા સામાન્ય રીતે કેટલા હોય છે?",
        option1: "૫૦/મિનીટ",
        option2: "૭૦/મિનીટ",
        option3: "૧૦૦/મિનીટ",
        ans: 2));
    insertQuestions(Questions(
        question: "જયારે કાર માં ચાઈલ્ડ લોક ચાલુ કરેલ હોય ત્યારે..",
        option1: "દરવાજો ફક્ત અંદર ની બાજુ ખોલી શકાય",
        option2: "દરવાજો બહાર ની બાજુ થી ખોલી શકાય",
        option3: "દરવાજો બંને સાઈડ થી ખોલી શકાય",
        ans: 2));
    insertQuestions(Questions(
        question:
            "You are approaching a narrow bridge, another vehicle is about to enter the bridge from opposite side, you..",
        option1:
            "Increase the speed and try to cross the bridge as fast as possible\n",
        option2: "Put on the headlight and pass the bridge\n",
        option3:
            "Wait till the other vehicle crosses the bridge and then proceed",
        ans: 3));
    insertQuestions(Questions(
        question:
            "Near a pedestrian crossing, when the pedestrians are waiting to cross the road, you should",
        option1: "Sound horn and proceed.",
        option2: "Slow down, sound horn and pass.",
        option3:
            "Stop the vehicle and wait till the pedestrians cross the road and then proceed.",
        ans: 3));
    insertQuestions(Questions(
        question: "What does following sign represent?",
        option1: "Keep left.",
        option2: "There is no road on the left.",
        option3: "Compulsory keep left.",
        ans: 3,
        isImage: 1,
        img: 3));
    insertQuestions(Questions(
        question: "What does following sign represent?",
        option1: "Stop.",
        option2: "No Parking.",
        option3: "Hospital Ahead.",
        ans: 1,
        isImage: 1,
        img: 4));
    insertQuestions(Questions(
        question: "What does following sign represent?",
        option1: "Bridge ahead.",
        option2: "Refreshment stall ahead.",
        option3: "Ferry service.",
        ans: 2,
        isImage: 1,
        img: 5));
    insertQuestions(Questions(
        question: "What does following sign represent?",
        option1: "Loose gravel.",
        option2: "Slippery road.",
        option3: "No entry for motor car.",
        ans: 1,
        isImage: 1,
        img: 6));
    insertQuestions(Questions(
        question: " What does following sign represent?",
        option1: "Cycle crossing.",
        option2: "Cycle crossing prohibited.",
        option3: "No entry for cycles.",
        ans: 1,
        isImage: 1,
        img: 7));
    insertQuestions(Questions(
        question: "What does following sign represent?",
        option1: "Turn left.",
        option2: "Turn right.",
        option3: "Y-inter section on left.",
        ans: 3,
        isImage: 1,
        img: 8));
    insertQuestions(Questions(
        question: "What does following sign represent?",
        option1: "Y-inter section on left.",
        option2: "Y-inter section on right.",
        option3: "Side road left.",
        ans: 2,
        isImage: 1,
        img: 9));
    insertQuestions(Questions(
        question: "What does following sign represent?",
        option1: "Roads on both sides in front.",
        option2: "Narrow bridge ahead.",
        option3: "Narrow road ahead.",
        ans: 2,
        isImage: 1,
        img: 10));
    insertQuestions(Questions(
        question:
            " In case of an accident to seek a medical help, you should dial.",
        option1: "108 or 102.",
        option2: "101.",
        option3: "Any of these.",
        ans: 1));
    insertQuestions(Questions(
        question: "What does following sign represent?",
        option1: "Narrow road ahead.",
        option2: "Dangerous dip.",
        option3: "Ferry service.",
        ans: 2,
        isImage: 1,
        img: 12));
    insertQuestions(Questions(
        question: "What does following sign represent?",
        option1: "Narrow road ahead.",
        option2: "Dangerous dip.",
        option3: "Ferry service.",
        ans: 1,
        isImage: 1,
        img: 13));
    insertQuestions(Questions(
        question: "What does following sign represent?",
        option1: "Road closed.",
        option2: "No parking.",
        option3: "End of speed restriction.",
        ans: 3,
        isImage: 1,
        img: 14));
    insertQuestions(Questions(
        question: "What does following sign represent?",
        option1: "Railway station nearest.",
        option2: "Unguarded level crossing.",
        option3: "Level crossing guarded.",
        ans: 3,
        isImage: 1,
        img: 15));
    insertQuestions(Questions(
        question: "What does following sign represent?",
        option1: "Road to the right in front.",
        option2: "Compulsory turn right.",
        option3: "Turn to right prohibited.",
        ans: 1,
        isImage: 1,
        img: 16));
    insertQuestions(Questions(
        question: "What does following sign represent?",
        option1: "Cross road ahead.",
        option2: "Major road ahead.",
        option3: "First aid.",
        ans: 2,
        isImage: 1,
        img: 17));
    insertQuestions(Questions(
        question: "What does following sign represent?",
        option1: "Right reverse bend.",
        option2: "Left reverse bend.",
        option3: "Turn right and go ahead.",
        ans: 1,
        isImage: 1,
        img: 18));
    insertQuestions(Questions(
        question: " What does following sign represent?",
        option1: "Right reverse bend.",
        option2: "Left reverse bend.",
        option3: "Turn left and go ahead.",
        ans: 2,
        isImage: 1,
        img: 19));
    insertQuestions(Questions(
        question: "What does following sign represent?",
        option1: "Left descend.",
        option2: "Left hairpin bend.",
        option3: "Keep left.",
        ans: 2,
        isImage: 1,
        img: 20));
    insertQuestions(Questions(
        question: "It is compulsory for a driver to wear uniform while driving",
        option1: "Private vehicle.",
        option2: "All commercial vehicle.",
        option3: "All vehicles.",
        ans: 2));
    insertQuestions(Questions(
        question:
            "The only vehicle that is permitted to be driven at a speed exceeding 65 Km/hr is",
        option1: "Motor cycle.",
        option2: "Motor car.",
        option3: "Stage carriage.",
        ans: 2));
    insertQuestions(Questions(
        question: "Boarding in or alighting from a vehicle while in motion",
        option1: "Permitted in bus.",
        option2: "Permitted in auto-rickshaw.",
        option3: "Prohibited in all vehicles.",
        ans: 3));
    insertQuestions(Questions(
        question: "You can save fuel by",
        option1: "Proper tuning of the vehicle.",
        option2: "Proper cleaning of the vehicle.",
        option3: "Making excessive use of clutch while driving.",
        ans: 1));
    insertQuestions(Questions(
        question: "Rear view mirror is used",
        option1: "For seeing face.",
        option2: "For watching traffic approaching from behind.",
        option3: "For seeing the back seat passenger",
        ans: 2));
    insertQuestions(Questions(
        question: "Maximum speed allowed for motor cars",
        option1: "No lim",
        option2: "70 Km/hr.",
        option3: "50 Km/hr.",
        ans: 1));
    insertQuestions(Questions(
        question: "According to law, a person driving a motor cycle shall",
        option1: "Wear jacket.",
        option2: "Wear helmet.",
        option3: "Wear shoes.",
        ans: 2));
    insertQuestions(Questions(
        question:
            "Unnecessary and repeated use of horn is prohibited under the law",
        option1: "Yes.",
        option2: "No.",
        option3: "There is no law.",
        ans: 1));
    insertQuestions(Questions(
        question:
            "What is the validity of pollution under control certificate?",
        option1: "6 months.",
        option2: "1 month.",
        option3: "2 months.",
        ans: 1));
    insertQuestions(Questions(
        question:
            "Which traffic light should lit after green light at junction?",
        option1: "Red.",
        option2: "Blue.",
        option3: "Yellow.",
        ans: 3));
    insertQuestions(Questions(
        question:
            "What is the color scheme of the number plate of a commercial vehicle?",
        option1: "Yellow base and black letters.",
        option2: "Black base and white letters.",
        option3: "White base and black letters.",
        ans: 1));
    insertQuestions(Questions(
        question: "Drunken driving is",
        option1: "Allowed in private vehicles.",
        option2: "Allowed during night time.",
        option3: "Prohibited in all vehicles.",
        ans: 3));
    insertQuestions(Questions(
        question: "Motor cycle can be driven at a speed of 50 Km/hr",
        option1: "During night.",
        option2: "During daytime.",
        option3: "Any time.",
        ans: 3));
    insertQuestions(Questions(
        question: "The color of reverse light is",
        option1: "Red.",
        option2: "White.",
        option3: "Orange.",
        ans: 2));
    insertQuestions(Questions(
        question: "While driving, what will you keep in mind?",
        option1: "The weather and road conditions.",
        option2: "The traffic around you.",
        option3: "Both.",
        ans: 3));
    insertQuestions(Questions(
        question: "What does following sign represent?",
        option1: "Right hairpin bend.",
        option2: "Right ascend and descend.",
        option3: "Right descend.",
        ans: 1,
        isImage: 1,
        img: 21));
    insertQuestions(Questions(
        question: "What does following sign represent?",
        option1: "U-turn prohibited.",
        option2: "Right turn prohibited.",
        option3: "Overtaking through left prohibited.",
        ans: 2,
        isImage: 1,
        img: 22));
    insertQuestions(Questions(
        question: "What does following sign represent?",
        option1: "U-turn prohibited.",
        option2: "Right turn prohibited.",
        option3: "Overtaking through left prohibited.",
        ans: 1,
        isImage: 1,
        img: 23));
    insertQuestions(Questions(
        question: "What does following sign represent?",
        option1: "Bullock cart prohibited.",
        option2: "Cycle prohibited.",
        option3: "All vehicles prohibited.",
        ans: 1,
        isImage: 1,
        img: 24));
    insertQuestions(Questions(
        question: "What does following sign represent?",
        option1: "Trucks prohibited.",
        option2: "Bus prohibited.",
        option3: "Heavy vehicles prohibited.",
        ans: 1,
        isImage: 1,
        img: 25));
    insertQuestions(Questions(
        question: "What does following sign represent?",
        option1: "May turn to left.",
        option2: "Compulsory go ahead or turn left.",
        option3: "Side road left.",
        ans: 2,
        isImage: 1,
        img: 26));
    insertQuestions(Questions(
        question: "What does following sign represent?",
        option1: "Cross road ahead.",
        option2: "No entry.",
        option3: "Hospital.",
        ans: 1,
        isImage: 1,
        img: 27));
    insertQuestions(Questions(
        question: "What does following sign represent?",
        option1: "Compulsory go ahead or turn right.",
        option2: "Compulsory go ahead or turn left.",
        option3: "Side road ahead.",
        ans: 1,
        isImage: 1,
        img: 28));
    insertQuestions(Questions(
        question: "What does following sign represent?",
        option1: "Sound horn compulsory.",
        option2: "Sound horn continuously.",
        option3: "Horn prohibited.",
        ans: 1,
        isImage: 1,
        img: 29));
    insertQuestions(Questions(
        question: "What does following sign represent?",
        option1: "Keep right side.",
        option2: "Parking on the right allowed.",
        option3: "Compulsory turn to right.",
        ans: 2,
        isImage: 1,
        img: 30));
    insertQuestions(Questions(
        question: "What does following sign represent?",
        option1: "Side road left.",
        option2: "Speed lim",
        option3: "Axle load lim",
        ans: 3,
        isImage: 1,
        img: 31));
    insertQuestions(Questions(
        question: "What does following sign represent?",
        option1: "Men at work.",
        option2: "Children playing.",
        option3: "Pedestrian crossing.",
        ans: 1,
        isImage: 1,
        img: 32));
    insertQuestions(Questions(
        question: "What does following sign represent?",
        option1: "Turn right.",
        option2: "Turn left.",
        option3: "Round about.",
        ans: 3,
        isImage: 1,
        img: 33));
    insertQuestions(Questions(
        question: "What does following sign represent?",
        option1: "Y-inter section on left.",
        option2: "Y-inter section on right.",
        option3: "Y-inter section.",
        ans: 3,
        isImage: 1,
        img: 34));
    insertQuestions(Questions(
        question: "What does following sign represent?",
        option1: "No through road.",
        option2: "Bump ahead.",
        option3: "Road repairing work going on.",
        ans: 1,
        isImage: 1,
        img: 35));
    insertQuestions(Questions(
        question: "What does following sign represent?",
        option1: "Parking prohibited.",
        option2: "Parking allowed on both sides.",
        option3: "Police aid post.",
        ans: 2,
        isImage: 1,
        img: 71));
    insertQuestions(Questions(
        question: "What does following sign represent?",
        option1: "Petrol pump.",
        option2: "Garage.",
        option3: "Air-filling facility.",
        ans: 1,
        isImage: 1,
        img: 72));
    insertQuestions(Questions(
        question: "What does following sign represent?",
        option1: "No entry for private cars.",
        option2: "Parking lot- Taxis.",
        option3: "Parking for police vehicles.",
        ans: 2,
        isImage: 1,
        img: 73));
    insertQuestions(Questions(
        question: "What does following sign represent?",
        option1: "Parking lot - auto rickshaws.",
        option2: "Auto rickshaws prohibited.",
        option3: "Auto rickshaws repairing.",
        ans: 1,
        isImage: 1,
        img: 74));
    insertQuestions(Questions(
        question: "You want to overtake a vehicle near a hospital, you will",
        option1: "Blow horn continuously.",
        option2: "Not blow horn.",
        option3: "Blow horn only intermittently.",
        ans: 2));
    insertQuestions(Questions(
        question: "Is it compulsory to have vehicle insurance?",
        option1: "Yes.",
        option2: "No.",
        option3: "Not compulsory if you are insured with life insurance.",
        ans: 1));
    insertQuestions(Questions(
        question: "What does following sign represent?",
        option1: "Parking lot - scooter and motor cycles.",
        option2: "Scooter and motor cycles prohibited.",
        option3: "Scooter and motor cycles repairing.",
        ans: 1,
        isImage: 1,
        img: 77));
    insertQuestions(Questions(
        question: "When you see the traffic sign of school, you should",
        option1: "Stop the vehicle, sound horn and proceed.",
        option2: "Slow down and proceed with caution.",
        option3: "Sound horn continuously and proceed.",
        ans: 2,
        isImage: 1,
        img: 78));
    insertQuestions(Questions(
        question: " What does following sign represent?",
        option1: "Drive the vehicle not exceeding 50 Km/hr.",
        option2: "Drive the vehicle at 50 Km/hr.",
        option3: "Drive the vehicle exceeding 50 Km/hr.",
        ans: 1,
        isImage: 1,
        img: 79));
    insertQuestions(Questions(
        question: " What does following sign represent?",
        option1: "Overtaking prohibited through the right side.",
        option2: "Turn left.",
        option3: "Left turn prohibited.",
        ans: 3,
        isImage: 1,
        img: 80));
    insertQuestions(Questions(
        question: "What does following sign represent?",
        option1: "Intends to go straight.",
        option2: "Intends to stop the vehicle.",
        option3: "Intends to turn right.",
        ans: 2,
        isImage: 1,
        img: 81));
    insertQuestions(Questions(
        question: "What does following sign represent?",
        option1: "Requesting to stop the vehicle from behind.",
        option2: "Allow to pass the vehicle from behind.",
        option3: "Request to stop the vehicle from front",
        ans: 2,
        isImage: 1,
        img: 82));
    insertQuestions(Questions(
        question: "What does following sign represent? (Waving hand up-down)",
        option1: "Intends to turn right.",
        option2: "Request to stop the vehicle coming from opposite direction.",
        option3: "Intends to slow down the vehicle.",
        ans: 3,
        isImage: 1,
        img: 83));
    insertQuestions(Questions(
        question: "What does following sign represent?",
        option1: "Request to stop the vehicle coming from behind.",
        option2: "Intends to turn right.",
        option3: "Request to stop the vehicle coming from opposite direction.",
        ans: 2,
        isImage: 1,
        img: 84));
    insertQuestions(Questions(
        question: "Using Unregistered vehicle in public place is",
        option1: "Illegal.",
        option2: "Legal",
        option3: "Legal if there is urgency.",
        ans: 1));
    insertQuestions(Questions(
        question: "The driver of a vehicle shall not take U-turn",
        option1: "In a road where U-turn is prohibited.",
        option2: "In a busy road.",
        option3: "When there are vehicles passing through the left.",
        ans: 1));
    insertQuestions(Questions(
        question:
            "Minimum age for getting a licence to drive motor cycle without gear is",
        option1: "18 years.",
        option2: "21 years.",
        option3: "16 years.",
        ans: 3));
    insertQuestions(Questions(
        question: "Before taking turn, driver should",
        option1: "Slow down the vehicle.",
        option2: "Not slow down the vehicle.",
        option3: "Drive fast.",
        ans: 1));
    insertQuestions(Questions(
        question:
            "While driving at night on city roads, keep your head-light on a",
        option1: "Low beam.",
        option2: "High beam.",
        option3: "Switch off all lights.",
        ans: 1));
    insertQuestions(Questions(
        question: "Red traffic light indicates",
        option1: "Vehicle can proceed with caution.",
        option2: "Stop the vehicle.",
        option3: "Slow down.",
        ans: 2));
    insertQuestions(Questions(
        question: "You can apply for a permanent driving licence after",
        option1: "30 days from the date of issue of learners' licence.",
        option2: "60 days from the date of issue of learners' licence.",
        option3: "180 days from the date of issue of learners' licence.",
        ans: 1));
    insertQuestions(Questions(
        question: "While your vehicle is being overtaken, you should",
        option1: "Stop your vehicle and let the vehicle to overtake.",
        option2: "Reduce the speed of your vehicle.",
        option3: "Not to obstruct the other vehicle from overtaking.",
        ans: 2));
    insertQuestions(Questions(
        question:
            "While you are driving with head light in high beam during night, a vehicle approaches from opposite direction, you will",
        option1: "Proceed keeping to the left.",
        option2:
            "Switch the head light from dim to bright alternately several times.",
        option3: "Dim the head light till the vehicle passes.",
        ans: 3));
    insertQuestions(Questions(
        question:
            "When a school bus is stopped for picking up or dropping down students",
        option1: "Blow horn and proceed.",
        option2:
            "Proceed slowly and cautiously since there is chance of students suddenly crossing the road.",
        option3: "No special care is required.",
        ans: 2));
    insertQuestions(Questions(
        question: " While turning left, you should",
        option1:
            "Show the left turn signal, drive to the center and turn to left.",
        option2: "Sound horn and turn to left.",
        option3:
            "Show the left turn signal, keep your vehicle to the left side of the road and turn left.",
        ans: 3));
    insertQuestions(Questions(
        question: "How does headrest of the seat help?",
        option1: "You can relax while driving.",
        option2: "Protects you from neck injury in case of an accident.",
        option3: "Seat looks beautiful with headrests.",
        ans: 2));
    insertQuestions(Questions(
        question: "When an ambulance is approaching",
        option1: "Allow passage if there are no vehicle from front side.",
        option2: "No preference need to be given.",
        option3:
            "The driver shall allow free passage by driving to the left side of the road.",
        ans: 3));
    insertQuestions(Questions(
        question:
            "If the driver of an auto rickshaw refusing the offer for journey for the reason that the distance is short. What can happen?",
        option1: "The driving licence is liable to be suspended/cancelled.",
        option2: "Fine is attracted.",
        option3: "Both of the Above.",
        ans: 3));
    insertQuestions(Questions(
        question: " Signal to take U-turn is",
        option1: "Left turn signal.",
        option2: "Right turn signal.",
        option3: "Slow down signal.",
        ans: 2));
    insertQuestions(Questions(
        question: "Overtaking is prohibited in the following case",
        option1: "State highway.",
        option2: "Panchayat roads.",
        option3: "Narrow bridge.",
        ans: 3));
    insertQuestions(Questions(
        question: "What does following sign represent?",
        option1: "One way sign.",
        option2: "Vehicles prohibited in both directions.",
        option3: "Overtaking prohibited.",
        ans: 1,
        isImage: 1,
        img: 36));
    insertQuestions(Questions(
        question: "What does following sign represent?",
        option1: "Steep ascend.",
        option2: "Steep descend.",
        option3: "Slippery road.",
        ans: 1,
        isImage: 1,
        img: 37));
    insertQuestions(Questions(
        question: "What does following sign represent?",
        option1: "Steep ascend.",
        option2: "Steep descend.",
        option3: "Slippery road.",
        ans: 2,
        isImage: 1,
        img: 38));
    insertQuestions(Questions(
        question: "What does following sign represent?",
        option1: "Keep left.",
        option2: "There is no road to left.",
        option3: "Compulsory turn left.",
        ans: 3,
        isImage: 1,
        img: 39));
    insertQuestions(Questions(
        question: "What does following sign represent?",
        option1: "End of restriction.",
        option2: "No Stopping or standing.",
        option3: "No parking.",
        ans: 2,
        isImage: 1,
        img: 40));
    insertQuestions(Questions(
        question: " What does following sign represent?",
        option1: "Give way.",
        option2: "Hospital.",
        option3: "First Aid Center.",
        ans: 2,
        isImage: 1,
        img: 41));
    insertQuestions(Questions(
        question: " What does following sign represent?",
        option1: "Compulsory turn right.",
        option2: "Side road right.",
        option3: "Keep right.",
        ans: 1,
        isImage: 1,
        img: 42));
    insertQuestions(Questions(
        question: "What does following sign represent?",
        option1: "Staggered intersections.",
        option2: "Zigzag road.",
        option3: "No right and left turn.",
        ans: 1,
        isImage: 1,
        img: 43));
    insertQuestions(Questions(
        question: " What does following sign represent?",
        option1: "Side road left.",
        option2: "Turn left.",
        option3: "No left turn.",
        ans: 1,
        isImage: 1,
        img: 44));
    insertQuestions(Questions(
        question: "What does following sign represent?",
        option1: "Narrow road ahead.",
        option2: "Y-intersection.",
        option3: "Road widens ahead.",
        ans: 3,
        isImage: 1,
        img: 45));
    insertQuestions(Questions(
        question: "What does following sign represent?",
        option1: "Entry through right side prohibited.",
        option2: "Entry through left side prohibited.",
        option3: "Overtaking prohibited.",
        ans: 3,
        isImage: 1,
        img: 46));
    insertQuestions(Questions(
        question: "What does following sign represent?",
        option1: "Give way.",
        option2: "Hospital ahead.",
        option3: "Traffic island ahead.",
        ans: 1,
        isImage: 1,
        img: 47));
    insertQuestions(Questions(
        question: "What does following sign represent?",
        option1: "No entry.",
        option2: "One way.",
        option3: "Speed limit ends.",
        ans: 1,
        isImage: 1,
        img: 48));
    insertQuestions(Questions(
        question: "What does following sign represent?",
        option1: "Right turn prohibited.",
        option2: "Sharp curve to the right.",
        option3: "U-turn prohibited.",
        ans: 2,
        isImage: 1,
        img: 49));
    insertQuestions(Questions(
        question: "What does following sign represent?",
        option1: "Left hand curve.",
        option2: "Left ascend.",
        option3: "Keep left.",
        ans: 1,
        isImage: 1,
        img: 50));
    insertQuestions(Questions(
        question: "What does following sign represent?",
        option1: "Horn prohibited.",
        option2: "Compulsory sound horn.",
        option3: "May sound horn.",
        ans: 1,
        isImage: 1,
        img: 51));
    insertQuestions(Questions(
        question: "What does following sign represent?",
        option1: "Pedestrian crossing.",
        option2: "Pedestrians may enter.",
        option3: "Pedestrian prohibited.",
        ans: 1,
        isImage: 1,
        img: 52));
    insertQuestions(Questions(
        question: "What does following sign represent?",
        option1: "Students prohibited.",
        option2: "Pedestrian permitted.",
        option3: "Pedestrian prohibited.",
        ans: 3,
        isImage: 1,
        img: 53));
    insertQuestions(Questions(
        question: " What does following sign represent?",
        option1: "Hospital.",
        option2: "Resting Place.",
        option3: "First aid.",
        ans: 2,
        isImage: 1,
        img: 54));
    insertQuestions(Questions(
        question: "What does following sign represent?",
        option1: "Guarded railway crossing (200m ahead).",
        option2: "Unguarded railway crossing.",
        option3: "Unguarded railway crossing 200m ahead.",
        ans: 1,
        isImage: 1,
        img: 55));
    insertQuestions(Questions(
        question: "What does following sign represent?",
        option1: "School ahead.",
        option2: "Pedestrian crossing.",
        option3: "Pedestrian crossing prohibited.",
        ans: 1,
        isImage: 1,
        img: 56));
    insertQuestions(Questions(
        question: "What does following sign represent?",
        option1: "Compulsory ahead only.",
        option2: "One way.",
        option3: "Prohibited in both directions.",
        ans: 1,
        isImage: 1,
        img: 57));
    insertQuestions(Questions(
        question: "What does following sign represent?",
        option1: "Go straight.",
        option2: "One way.",
        option3: "Prohibited in both directions.",
        ans: 3,
        isImage: 1,
        img: 58));
    insertQuestions(Questions(
        question: " What does following sign represent?",
        option1: "Rough road.",
        option2: "Slippery road.",
        option3: "Falling rocks.",
        ans: 3,
        isImage: 1,
        img: 59));
    insertQuestions(Questions(
        question: "What does following sign represent?",
        option1: "No thorough side road.",
        option2: "Left turn ahead.",
        option3: "Bridge ahead.",
        ans: 1,
        isImage: 1,
        img: 60));
    insertQuestions(Questions(
        question: "What does following sign represent?",
        option1: "Barrier ahead.",
        option2: "Railway cross ahead.",
        option3: "Weigh bridge ahead.",
        ans: 1,
        isImage: 1,
        img: 61));
    insertQuestions(Questions(
        question: "What does following sign represent?",
        option1: "Slippery road.",
        option2: "Gravel ahead.",
        option3: "No entry for motor car.",
        ans: 1,
        isImage: 1,
        img: 62));
    insertQuestions(Questions(
        question: "In which of the following places, parking is prohibited?",
        option1: "Blocking a fire hydrant.",
        option2: "Near a public well.",
        option3: "Left side of the road.",
        ans: 1));
    insertQuestions(Questions(
        question: "Overtaking when approaching a bend(turn)",
        option1: "Is permissible.",
        option2: "Is not permissible.",
        option3: "Is permissible with care.",
        ans: 2));
    insertQuestions(Questions(
        question: "What does following sign represent?",
        option1: "All motor vehicles prohibited.",
        option2: "No entry for cars and motor cycles.",
        option3: "Entry allowed for cars and motor cycles.",
        ans: 1,
        isImage: 1,
        img: 65));
    insertQuestions(Questions(
        question: "What does following sign represent?",
        option1: "Stop.",
        option2: "No Parking.",
        option3: "Hospital ahead.",
        ans: 2,
        isImage: 1,
        img: 66));
    insertQuestions(Questions(
        question: "What does following sign represent?",
        option1: "Hump or rough road.",
        option2: "Zigzag road.",
        option3: "Ghat road.",
        ans: 1,
        isImage: 1,
        img: 67));
    insertQuestions(Questions(
        question: "What does following sign represent?",
        option1: "Ferry.",
        option2: "No road ahead.",
        option3: "Water on the road.",
        ans: 1,
        isImage: 1,
        img: 68));
    insertQuestions(Questions(
        question: "What does following sign represent?",
        option1: "Drainage in the middle.",
        option2: "Bridge ahead.",
        option3: "Gap in the median.",
        ans: 3,
        isImage: 1,
        img: 69));
    insertQuestions(Questions(
        question: "What does following sign represent?",
        option1: "Cattle prohibited.",
        option2: "Possibility of animal on the road.",
        option3: "Vehicles carrying cattle prohibited.",
        ans: 2,
        isImage: 1,
        img: 70));
    insertQuestions(Questions(
        question: "You can talk on mobile while driving any vehicle",
        option1: "Yes.",
        option2: "No.",
        option3: "You can talk after slowing down your vehicle.",
        ans: 2));
    insertQuestions(Questions(
        question: "When fuel is filled in a vehicle, you",
        option1: "Shall not check air pressure.",
        option2: "shall not smoke.",
        option3: "Shall not use any light of the vehicle.",
        ans: 2));
    insertQuestions(Questions(
        question: "Maximum permissible speed of a motor cycle",
        option1: "No lim",
        option2: "50 Km/hr.",
        option3: "60 Km/hr.",
        ans: 2));
    insertQuestions(Questions(
        question: " When should you use mobile phone?",
        option1: "When the vehicle is running at very slow speed.",
        option2:
            "When the vehicle is running at medium speed on express highway.",
        option3: "When the vehicle is parked a side.",
        ans: 3));
    insertQuestions(Questions(
        question: "Parking is prohibited in the following place",
        option1: "Entrance of hospital.",
        option2: "Left side of the road.",
        option3: "Market area.",
        ans: 1));
    insertQuestions(Questions(
        question:
            "The number of passengers permitted to be taken in vehicle is recorded in the",
        option1: "Registration certificate.",
        option2: "Tax token.",
        option3: "Fitness.",
        ans: 1));
    insertQuestions(Questions(
        question:
            "The driver of the vehicle in front has not given signal for allowing over taking",
        option1: "We can overtake.",
        option2: "We shall not overtake.",
        option3: "We can overtake blowing horn.",
        ans: 2));
    insertQuestions(Questions(
        question: "Driver of a major vehicle shall drive through",
        option1: "The right side of the road.",
        option2: "The left side of the road.",
        option3: "The center of the road.",
        ans: 2));
    insertQuestions(Questions(
        question:
            "When the yellow light at an intersection appear on the signal light, the driver of a approaching vehicle should",
        option1: "Ensure safety and drive away.",
        option2: "Slow down to stop.",
        option3: "Sound horn and proceed.",
        ans: 2));
    insertQuestions(Questions(
        question: "The hand brake is to be used",
        option1: "To reduce the speed.",
        option2: "To apply sudden brake.",
        option3: "To park a vehicle.",
        ans: 3));
    insertQuestions(Questions(
        question: "When a blind person crosses the road holding white cane.",
        option1:
            "The driver of a vehicle shall consider the white cane as a traffic sign to stop the vehicle.",
        option2: "Blow horn and proceed.",
        option3: "Slow down and proceed with caution.",
        ans: 1));
    insertQuestions(Questions(
        question: "More than two persons on a two wheeler is",
        option1: "Allowed in unavoidable circumstances.",
        option2: "Violation of law.",
        option3: "Allowed when traffic is less.",
        ans: 2));
    insertQuestions(Questions(
        question: "Road on which driving in reverse gear is prohibited",
        option1: "One way road.",
        option2: "Market area.",
        option3: "State highway.",
        ans: 1));
    insertQuestions(Questions(
        question:
            "When you reach an intersection where there is no signal light or police man, you will",
        option1:
            "Give way to all traffic approaching the intersection from other roads.",
        option2: "Give proper signal, sound the horn and proceed.",
        option3:
            "Give way to the traffic approaching from your right side and proceed.",
        ans: 3));
    insertQuestions(Questions(
        question: "Type of horn permitted?",
        option1: "Air-horn.",
        option2: "Multi-toned horn.",
        option3: "Electric horn.",
        ans: 3));
    insertQuestions(Questions(
        question: "Validity of vehicle insurance is",
        option1: "6 months.",
        option2: "1 year.",
        option3: "2 years.",
        ans: 1));
    insertQuestions(Questions(
        question: "Road on which driving in reverse gear is prohibited",
        option1: "One way road.",
        option2: "Market area.",
        option3: "State highway.",
        ans: 1));
    insertQuestions(Questions(
        question:
            "What does following sign represent? (Turn on the left turn signal and waving hand in circular manner)",
        option1: "Intends to turn left.",
        option2: "Intends to turn right.",
        option3: "Request to stop all other vehicle.",
        ans: 1,
        isImage: 1,
        img: 118));
    insertQuestions(Questions(
        question: "To carry pillion rider on a motor cycle",
        option1: "The vehicle should have foot rest, hand grip and sari guard.",
        option2: "The vehicle should have side car.",
        option3: "The vehicle should have rear view mirror.",
        ans: 1));
    insertQuestions(Questions(
        question:
            " Abandoning vehicle in a public place causing inconvenience to others or passengers",
        option1: "The driving licence is liable to be suspended/cancelled.",
        option2: "Fine is attracted.",
        option3: "Both of the above.",
        ans: 3));
    insertQuestions(Questions(
        question:
            "Documents of non transport vehicles to be kept in the vehicle are",
        option1:
            "Registration certificate, PUC, Insurance certificate and Driving licence.",
        option2:
            "Registration certificate, Insurance certificate, Tax token and Driving licence.",
        option3: "Registration certificate, Permit, Trip sheet.",
        ans: 1));
    insertQuestions(Questions(
        question:
            "While you are approaching an intersection where the yellow signal light is blinking, you should",
        option1: "As there is no restriction, proceed with same speed.",
        option2: "Stop the vehicle and wait for green to appear.",
        option3:
            "Slow down the vehicle and proceed only after ensuring that it is safe to move.",
        ans: 3));
    insertQuestions(Questions(
        question:
            "While turning to the left, the driver of a two wheeler shall",
        option1: "Extend his left hand toward left.",
        option2: "Not show hand signal.",
        option3:
            "Show left turn signal with his right hand or signal by indicator.",
        ans: 3));
    insertQuestions(Questions(
        question:
            "When the vehicle from behind has begun to overtake our vehicle",
        option1: "We shall not overtake another vehicle.",
        option2: "We can overtake another vehicle.",
        option3: "We can overtake another vehicle blowing horn.",
        ans: 1));
    insertQuestions(Questions(
        question:
            "While a vehicle entering a main road from a branch road, the driver shall give preference",
        option1: "To the vehicles coming from the left.",
        option2: "To the vehicles coming from the right.",
        option3: "To all the vehicles proceeding along the main road.",
        ans: 2));
    insertQuestions(Questions(
        question: " While you are driving on gradient road, you should",
        option1: "Give precedence to the vehicles coming down the hill.",
        option2: "Give precedence to the vehicles going uphill.",
        option3: "Give precedence to the vehicles carrying heavy load.",
        ans: 2));
    insertQuestions(Questions(
        question: " If the road is marked with broken white lines, you",
        option1: "Shall not change the track.",
        option2: "Can change the track if required.",
        option3: "Shall stop the vehicle.",
        ans: 2));
    insertQuestions(Questions(
        question: "Blinking yellow traffic light means",
        option1: "Stop the vehicle till green light glows.",
        option2: "Stop the vehicle and proceed if safe.",
        option3: "Reduce speed and proceed safely.",
        ans: 3));
    insertQuestions(Questions(
        question:
            "How does the stopping distance of a vehicle get affected while applying brake during rain?",
        option1: "Stopping distance increases.",
        option2: "Stopping distance decreases.",
        option3: "Does not effect.",
        ans: 1));
    insertQuestions(Questions(
        question:
            "In case of an accident, if the victim is bleeding under the helmet you should",
        option1: "Not try to remove the helmet but call the ambulance",
        option2: "Remove the helmet to check the injury",
        option3: "Remove the helmet and call ambulance.",
        ans: 1));
    insertQuestions(Questions(
        question: "Where it is not safe to reverse your car, you should",
        option1: "Go ahead to find suitable place to reverse the car.",
        option2: "Use all rear view mirrors properly.",
        option3: "Turn on the reverse horn and reverse.",
        ans: 1));
    insertQuestions(Questions(
        question: " When a vehicle is parked on the road side during night",
        option1: "The vehicle should be locked.",
        option2:
            "The person having licence to drive such a vehicle should be in the driver's seat.",
        option3: "The parking light shall remain l",
        ans: 3));
    insertQuestions(Questions(
        question: "You can overtake a vehicle through the left side, if",
        option1:
            "The driver of that vehicle indicated his intention to turn right and proceeds to the center of the road.",
        option2: "There is sufficient space on the left side.",
        option3: "The vehicle moves slowly.",
        ans: 1));
    insertQuestions(Questions(
        question: " If you hold a learners licence for motor cycle?",
        option1: "You will drive when the traffic is less.",
        option2:
            "You will drive the vehicle only when an instructor holding driving licence to drive motor cycle accompanies.",
        option3: "You will carry any other person on the motor cycle.",
        ans: 2));
    insertQuestions(Questions(
        question: "Overtaking is prohibited in following circumstances",
        option1:
            "When it is likely to cause inconveniences or danger to other traffic.",
        option2: "When the vehicle in front is reducing speed.",
        option3: "During night.",
        ans: 1));
    insertQuestions(Questions(
        question: "The color scheme of number plate for private vehicle is",
        option1: "Black background with yellow letters.",
        option2: "Yellow background with black letters.",
        option3: "White background with black letters.",
        ans: 3));
    insertQuestions(Questions(
        question:
            "Minimum age required to procure a commercial driving licence for LMV",
        option1: "18 years.",
        option2: "21 years.",
        option3: "20 years.",
        ans: 3));
    insertQuestions(Questions(
        question: " What does following sign represent?",
        option1: "Lane changing is permitted.",
        option2: "Change the lane with caution.",
        option3: "Lane changing is prohibited.",
        ans: 2,
        isImage: 1,
        img: 138));
    insertQuestions(Questions(
        question: "While parking the vehicle",
        option1: "Vehicle should be engaged in gear.",
        option2: "Parking brake should be applied.",
        option3: "Only hazard (parking) light should be applied.",
        ans: 2));
    insertQuestions(Questions(
        question: "Zebra lines are meant for",
        option1: "Stopping vehicle.",
        option2: "Pedestrian crossing.",
        option3: "For giving preferences to vehicles.",
        ans: 2));
    insertQuestions(Questions(
        question: "Fog lamps are used",
        option1: "During night.",
        option2: "When there is mist/fog in atmosphere.",
        option3:
            "When the vehicle in opposite direction is not using dim light.",
        ans: 2));
    insertQuestions(Questions(
        question: "Driver of a vehicle may overtake",
        option1: "While driving down the hill.",
        option2: "If the road is not sufficiently wide.",
        option3:
            "When the driver of the vehhicle ahead shows the signal to overtake.",
        ans: 3));
    insertQuestions(Questions(
        question:
            "Vehicles proceeding from opposite direction should be allowed to pass through",
        option1: "Your right side.",
        option2: "Your left side.",
        option3: "The convenient side.",
        ans: 1));
    insertQuestions(Questions(
        question:
            "The driver of a vehicle extends his right arm with the palm downwards and moves the palm upwards and downwards several times you will understand that",
        option1: "He is turning to the left.",
        option2: "He is slowing down the vehicle.",
        option3: "He is allowing to overtake.",
        ans: 2));
    insertQuestions(Questions(
        question: "Overtaking is prohibited",
        option1: "When the road ahead is not clearly visible.",
        option2: "In the night.",
        option3:
            "When the center of the road is marked with white broken lines.",
        ans: 1));
    insertQuestions(Questions(
        question:
            "How long driver can drive his vehicle after the expiry of his driving licence?",
        option1: "30 days.",
        option2: "Not a single day.",
        option3: "60 days.",
        ans: 1));
    insertQuestions(Questions(
        question:
            "Where the \"Slippery road sign\" is seen on the road, the driver shall",
        option1: "Reduce the speed by changing to lower gear.",
        option2: "Apply brakes.",
        option3: "Proceed at the same speed.",
        ans: 1));
    insertQuestions(Questions(
        question: "According to law, a person driving a motor car shall",
        option1: "Wear sunglasses.",
        option2: "Wear seat belt.",
        option3: "Wear cap.",
        ans: 2));
    insertQuestions(Questions(
        question:
            "Minimum age required to procure a driving licence for LMV is",
        option1: "16 years.",
        option2: "18 years.",
        option3: "20 years.",
        ans: 2));
    insertQuestions(Questions(
        question:
            " In case of an accident where driver was not holding a driving licence",
        option1: "Insurance company shall compensate fully.",
        option2: "Insurance company shall not compensate.",
        option3: "Insurance company shall compensate partly.",
        ans: 2));
    insertQuestions(Questions(
        question: "How driver can prevent fatigue while driving?",
        option1: "By drinking alcohol.",
        option2: "By resting during the journey at every two hours.",
        option3: "By listening to the music.",
        ans: 2));
    insertQuestions(Questions(
        question: "Using a mobile phone while driving",
        option1: "Increases the chances of an accident.",
        option2: "Saves time and effort for a task.",
        option3: "Permissible in case of an emergency.",
        ans: 1));
    insertQuestions(Questions(
        question: "While driving down the hill, you should",
        option1: "Keep the clutch pressed and roll the vehicle.",
        option2: "Switch off the engine and roll the vehicle to save fuel.",
        option3: "Avoid both.",
        ans: 3));
    insertQuestions(Questions(
        question: " While parking your vehicle at night, you should",
        option1: "Apply parking brake.",
        option2: "Turn parking lights on.",
        option3: "Apply both.",
        ans: 3));
    insertQuestions(Questions(
        question:
            "An area guarded with a ribbon in red and white color indicates",
        option1: "Road repairing work is going on.",
        option2: "Accident prone zone.",
        option3: "Check post ahead.",
        ans: 1));
    insertQuestions(Questions(
        question: " A driving licence issued by R.T.O is valid",
        option1: "Through out the country.",
        option2: "In that particular state only.",
        option3: "In that particular district only.",
        ans: 1));
    insertQuestions(Questions(
        question: "The color of stop-line used on road is",
        option1: "Yellow.",
        option2: "White.",
        option3: "Yellow and black.",
        ans: 2));
    insertQuestions(Questions(
        question: " Wearing a helmet by a woman while driving a two wheeler is",
        option1: "Compulsory by law.",
        option2: "Not compulsory by law.",
        option3: "It is up to their choice to wear.",
        ans: 1));
    insertQuestions(Questions(
        question:
            "The compulsory safety device in a car to protect passengers in case of accident is",
        option1: "Seat belt.",
        option2: "Brake pedal.",
        option3: "Air bag.",
        ans: 1));
    insertQuestions(Questions(
        question: "While driving behind a longer vehicle, you should",
        option1: "Maintain shorter distance from ",
        option2: "Can drive very close to it as it is not going to stop.",
        option3:
            "Maintain a very long distance to have a better view of the traffic ahead of ",
        ans: 3));
    insertQuestions(Questions(
        question:
            " In case of an accident, someone is suffering from a serious back injury, you should",
        option1: "Lift the victim and take to a safe place.",
        option2:
            "Not move the victim and try to warn other traffic about the accident.",
        option3: "Raise his legs to check the injury.",
        ans: 2));
    insertQuestions(Questions(
        question:
            "In case of an accident someone is suffering from skin burn, you should",
        option1:
            "Douse the burns thoroughly with cold water and take the victim under a shelter and call ambulance.",
        option2: "Burst blisters.",
        option3: "Remove his clothes stuck to the burns.",
        ans: 1));
    insertQuestions(Questions(
        question:
            "When any property of a third party is damaged due to an accident",
        option1:
            "The driver shall report to the nearest police station within 24 hours.",
        option2:
            "The driver shall report to the nearest police station within 7 days.",
        option3: "Need not report to any police station.",
        ans: 1));
    insertQuestions(Questions(
        question: "When a motor vehicle is involved in an accident, the driver",
        option1: "Shall report to the nearest police station within 24 hours.",
        option2: "Shall report to the nearest police station within 12 hours.",
        option3: "Shall report to the nearest police station within 48 hours.",
        ans: 1));
    insertQuestions(Questions(
        question:
            "When a vehicle approaches an unguarded railway level crossing, before crossing it, the driver shall",
        option1:
            "Stop the vehicle on the left side of the road, get down from the vehicle, go to the railway track and ensure that no train or trolley is coming from either side.",
        option2: "Sound horn and cross the track as fast as possible.",
        option3: "Wait till the train passes.",
        ans: 1));
    insertQuestions(Questions(
        question: " Incorrect gear shifting may lead to",
        option1: "Damage on gear box.",
        option2: "Higher fuel consumption.",
        option3: "Both.",
        ans: 3));
    insertQuestions(Questions(
        question: "While changing lanes you should",
        option1: "Blow horn and change lane.",
        option2: "Use indicator and change lanes.",
        option3:
            "No need to use indicator just look in the mirror and change lane.",
        ans: 2));
    insertQuestions(Questions(
        question: "While moving to the left lane to stop, you should",
        option1: "Lit the left side indicator.",
        option2: "Lit the right side indicator.",
        option3: "Lit parking light.",
        ans: 1));
    insertQuestions(Questions(
        question: "Why tyre rotation is advisable in a vehicle?",
        option1: "It maintains wheel balancing.",
        option2: "It maintains wheel alignment.",
        option3: "It avoids abnormal wear on the tyre.",
        ans: 3));
    insertQuestions(Questions(
        question: "Minor driving a car and meets an accident",
        option1: "SInce, he is a minor, he can not be punished.",
        option2: "Parents or guardian of a minor may also be held responsible.",
        option3:
            "Offence as per the law to be registered and penalties to be applied.",
        ans: 3));
    insertQuestions(Questions(
        question: "Validity of learners licence is",
        option1: "Till driving licence is obtained.",
        option2: "6 months.",
        option3: "30 days.",
        ans: 2));
    insertQuestions(Questions(
        question: " You can overtake a vehicle in front",
        option1: "From the right side of the vehicle.",
        option2: "Through the left side.",
        option3: "Through the left side if the road is wide.",
        ans: 1));
    insertQuestions(Questions(
        question: "ABC in first-aid means",
        option1: "Attentive, Breath, Contact.",
        option2: "Airway, Breathing, Circulation.",
        option3: "Accelerator, Brake, Clutch.",
        ans: 2));
    insertQuestions(Questions(
        question: "On a road designated as one way",
        option1: "Parking is prohibited.",
        option2: "Overtaking is prohibited.",
        option3: "Should not drive in reverse gear.",
        ans: 3));
    insertQuestions(Questions(
        question:
            "In case of an accident, which knowledge can be helpful to you to save human life?",
        option1: "Vehicle maintenance.",
        option2: "First-aid.",
        option3: "Legal.",
        ans: 2));
    insertQuestions(Questions(
        question: "Parking is prohibited in following case",
        option1: "Road side.",
        option2: "Where parking is permitted.",
        option3: "Near traffic light.",
        ans: 3));
    insertQuestions(Questions(
        question:
            "The temperature gauge in the dash board of a car indicates the temperature of",
        option1: "The weather outside of the car.",
        option2: "Inside the car.",
        option3: "The engine.",
        ans: 3));
    insertQuestions(Questions(
        question: "On a road without footpath the pedestrians",
        option1: "Should walk on the left side of the road.",
        option2: "Should walk on the right side of the road.",
        option3: "May walk on either side of the road.",
        ans: 2));
    insertQuestions(Questions(
        question: "Driving a vehicle without the brake light is",
        option1: "Valid for two wheeler.",
        option2: "An offense.",
        option3: "Valid for trucks only.",
        ans: 2));
    insertQuestions(Questions(
        question:
            "Free passage should be given to the following types of vehicles",
        option1: "Small vehicles.",
        option2: "Ambulance and fire service vehicles.",
        option3: "Express, super express buses.",
        ans: 2));
    insertQuestions(Questions(
        question:
            "Yellow continuous line marked at the middle of the road indicates",
        option1: "Overtaking permitted.",
        option2: "Crossing the yellow line is prohibited.",
        option3: "Drive can go on the other side of this lane.",
        ans: 2));
    insertQuestions(Questions(
        question:
            " You have fitted LPG/CNG fitment in your car from an approved fitment center. Is it compulsory to get it registered at R.T.O?",
        option1: "Yes.",
        option2: "No.",
        option3: "No need as it is done at an approved center.",
        ans: 1));
    insertQuestions(Questions(
        question: "Drinking alcohol and driving invites",
        option1: "Wrong judgement by driver.",
        option2: "Reduced vision of driver.",
        option3: "Both.",
        ans: 3));
    insertQuestions(Questions(
        question: "The average pulse rate of an adult is",
        option1: "60 per minute.",
        option2: "70 per minute.",
        option3: "100 per minute.",
        ans: 2));
    insertQuestions(Questions(
        question: "When child lock is applied in a car",
        option1: "Door can be opened from inside only.",
        option2: "Door can be opened from outside only.",
        option3: "Door can be opened from both sides.",
        ans: 2));
  }

  Future<List<Questions>> getQuestions(String language) async {
    var dbClient = await db;
    List<Map> maps = await dbClient.query(TABLE);
    List<Questions> questions = [];
    int length;
    int start;
    if (language == "English") {
      start = 200;
      length = 400;
    } else {
      start = 0;
      length =  200;
    }
    if (maps.isNotEmpty) {
      for (int i = start; i < length; i++) {
        questions.add(Questions(
            question: maps[i]['question'],
            option1: maps[i]['option1'],
            option2: maps[i]['option2'],
            option3: maps[i]['option3'],
            ans: maps[i]['ans'],
            isImage: maps[i]['isImage'],
            img: maps[i]['img']));
      }
    }
    await dbClient.close();
    return questions;
  }

  Future<void> insertQuestions(Questions question) async {
    final Database dbClient = await db;
    await dbClient.insert(DBHelper.TABLE, question.toMap());
  }

  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }
}
