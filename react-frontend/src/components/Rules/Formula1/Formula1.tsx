import styles from "../../../styles/Rules_singular.module.css";
import { Button, Card, CardContent, Divider } from "@mui/material";

function Formula1() {
  const bookmarks = [
    { id: 1, szoveg: "általános" },
    { id: 2, szoveg: "időmérő" },
    { id: 3, szoveg: "verseny" },
    { id: 4, szoveg: "sprint" },
    { id: 5, szoveg: "gumiabroncsok" },
    { id: 6, szoveg: "boxutca" },
    { id: 7, szoveg: "pontozás" },
    { id: 8, szoveg: "zászlók" },
    { id: 9, szoveg: "autókról" },
  ];
  return (
    <div className={styles.Rules_singularMainDiv}>
      <div className="rulesTitle">Formula 1 Szabályzat</div>
      <Divider variant="middle" className={styles.rulesDivider} />
      <div className={styles.bookmarks}>
        {bookmarks.map((bookmark) => (
          <a href={`#${bookmark.szoveg}`} key={bookmark.id}>
            <Button className="bookmarkButton">{bookmark.szoveg}</Button>
          </a>
        ))}
      </div>
      <div className={styles.seriesCardContainer}>
        <Card className={styles.seriesRulesCard} id="általános">
          <CardContent className={styles.cardTitle}>Általános</CardContent>
          <CardContent className={styles.cardContent}>
            Nemzetközi helyszínek adnak otthont a nagydíjaknak, nincs
            meghatározott minimális vagy maximális szezonhossz, bár az
            szezononkénti versenyek száma határozottan emelkedő tendenciát mutat
            az évek múlásával. Minden helyszínnek, ami egy Nagydíjnak ad
            otthont, meg kell felelnie az FIA és az Forma-1 irányító testülete
            által meghatározott legszigorúbb biztonsági szabályoknak, a
            versenyzők és a jelenlévő szurkolók védelme érdekében. Egy nagydíj
            lehet egy direkt erre a célra épített pályán, vagy egy, az adott
            város utcáiból összerakott, elkerített &apos;pálya&apos;.
            <Divider variant="middle" className={styles.divider} /> Versenyek:
            Az egyes pályák hossza eltérő lehet, de egy F1-es futam során a
            versenyzők annyi kört mennek a pályát, amíg nem teljesítik a 305
            km-t. Amikor elérik ezt a pontot, a következő alkalommal, amikor
            áthaladnak a célvonalon, a verseny véget ér. Ez alól az egyetlen
            kivétel Monaco rendkívül szűk és kanyargós utcai pályája, amely
            305km helyett csak 260 km-en keresztül fut. Minden verseny egy
            felvezető körrel kezdődik, ahol lehetőség van a gumik
            felmelegítésére, és egy utolsó ellenőrzésre, hogy minden megfelelően
            működik-e.
            <Divider variant="middle" className={styles.divider} />
            Hétvégi formátum: Minden Forma-1-es hétvége három napos és 5
            szakaszból áll: Pénteken két szabadedzés, szombaton egy szabadedzés
            és az időmérő, vasárnap pedig a verseny. A szabadedzéseken a
            versenyzőknek lehetőségük van a pályával való ismerkedésre, a
            beállítások tesztelésére és az autók finomhangolására. Ezek a
            szabadedzések 1 órásak.
          </CardContent>
        </Card>
        <Card className={styles.seriesRulesCard} id="időmérő">
          <CardContent className={styles.cardTitle}>Időmérő</CardContent>
          <CardContent className={styles.cardContent}>
            Az első meghatározó szakasz az időmérő, ami a vasárnapi verseny
            rajtsorrendjét határozza meg. A kvalifikációnak három szakasza van:
            Q1, Q2 és Q3. A Q1 18 percig tart, a Q2 15 percig, a Q3 pedig 12
            perces, és mindegyik között hét-nyolc perces szünetet tartanak, ami
            így egy órát tesz ki. A Q1 végén kiesik az öt leglassabb pilóta,
            akik köridejük sorrendjében indulnak a versenyen. A leglassabb
            pilóta a 20., a második leglassabb a 19. helyről indul, és így
            tovább. A Q2-ben, a Q1-es időket törlik, és a folyamat megismétlődik
            a fennmaradó 15 versenyzővel. Végül a Q3-ban a fennmaradó 10
            versenyző méri össze magát a leggyorsabb körért. A leggyorsabb
            pilóta az első helyről kezdheti meg a versenyt, közismert nevén pole
            pozíció-ról.
            <Divider variant="middle" className={styles.divider} />
            Parc Fermé: A Parc Fermé feltételei akkor kezdődnek, amikor a
            kvalifikáció elkezdődik, ami azt jelenti, hogy az autó
            alapbeállítása ugyanaz marad az időmérőn és a versenyen is. Ezek
            után már csak kisebb változtatások történhetnek az első szárnyon, és
            nyilván tankolni ezek után is bárhogy lehet az autóba. Azt, hogy a
            csapatok betartják-e a Parc Fermé-t, az FIA ellenőrzi.
          </CardContent>
        </Card>
        <Card className={styles.seriesRulesCard} id="verseny">
          <CardContent className={styles.cardTitle}>Verseny</CardContent>
          <CardContent className={styles.cardContent}>
            A szabályok előírják, hogy a versenyzőknek hogyan kell viselkedniük
            verseny közben. Például az F1 egy non-contact sport, és a pilóták
            nem lökhetik le a riválisukat a versenypályáról. Minden versenyzőnek
            legalább egy kereket a fehérre festett vonalon belül kell tartania,
            amely meghatározza a pálya határait. A többi szabályok inkább
            eljárási szabály, mint például, hogy minimum két szett különböző
            keverékű gumiabroncsot kell használni verseny alatt, és elegendő
            üzemanyagot kell fenntartani ahhoz, hogy az FIA a Nagydíj befejezése
            után teszteljen egy mintát.
            <Divider variant="middle" className={styles.divider} />
            Annak érdekében, hogy a versenyek izgalmasabbak legyenek, az FIA
            bevezette a következőt: A DRS-t. A 2011-ben bevezetett
            légellenállás-csökkentő rendszer, amelyet általában DRS néven
            ismernek a rajongók, a hátsó szárny egy nyílására utal, amely
            csökkenti a légellenállást. A DRS bevezetésének célja, hogy több
            előzést és izgalmat biztosítsanak a verseny során. A légellenállás
            csökkentésével az F1-es autó nagyobb végsebességre képes, mint
            egyébként, így könnyebben közelíthet minden olyan versenyzőhöz,
            akinek az autója nem használ DRS-t. A DRS csak a kijelölt
            „zónákban”, általában a pálya egyenes szakaszain használható, a
            pilótának egy gombot kell megnyomnia a kormányon, hogy aktiválja a
            rendszert. A szabadedzés és a kvalifikáció ideje alatt a DRS
            bármikor elérhető a versenyzők számára, amikor belépnek a DRS
            zónába. Ahhoz azonban, hogy a versenyen a rendszer előnyeit
            élvezhessék, a zóna kezdete előtt, egy adott érzékelési ponton, egy
            másodpercen belül kell lenniük az előttük haladó autótól. Az elöl
            haladó autó lehet az általuk üldözött rivális vagy egy körrel
            lekörözött pilóta.
          </CardContent>
        </Card>
        <Card className={styles.seriesRulesCard} id="sprint">
          <CardContent className={styles.cardTitle}>Sprint</CardContent>
          <CardContent className={styles.cardContent}>
            A 2021-ben bevezetett Sprintverseny egy 100 km-es, rövid formátumú
            verseny, amely egyes versenyhétvégéken a harmadik szabadedzést
            váltja fel. 2024-ben hat Sprintversenyt rendeznek Kínában, Miamiban,
            Ausztriában, az Egyesült Államokban (Austin, Texas), Brazíliában és
            Katarban. <Divider variant="middle" className={styles.divider} />
            2023-ban az volt a menetrend ezeken a hétvégéken hogy pénteken az
            első szabadedzést követte az időmérő, ami szokásos volt(ez határozta
            meg a rajtsorrendet a vasárnapi futamra), szombaton volt egy
            második, már rövidebb időmérő, ami a sprintverseny rajtsorrendjét
            határozta meg, majd szintén szombaton lezajlott a sprintverseny,
            vasárnap pedig a szokásos menetrend volt a főfutammal.
          </CardContent>
        </Card>
        <Card className={styles.seriesRulesCard} id="gumiabroncsok">
          <CardContent className={styles.cardTitle}>Gumiabroncsok</CardContent>
          <CardContent className={styles.cardContent}>
            Az F1-es autók négy gumijának összesen öt változata létezik,
            amelyeket keverékként ismerünk, bár ezek mind egyszerű abroncsok. A
            pilóták futófelület nélküli gumikon, úgynevezett
            &apos;slick&apos;gumikon versenyeznek száraz körülmények között.
            Lágy(piros oldalfalú), közepes(sárga oldalfalú) és kemény(fehér
            oldalfalú) keverékekben találhatóak meg, a lágy keverék nyújtja a
            legnagyobb tapadást, de ez kopik el a leggyorsabban, és ez fordítva
            is igaz, a kemény keverék nem ad akkora tapadást, ami a köridőkön is
            meglátszik, ellenben sokkal tartósabb mint a lágy keverék. Léteznek
            nedves és köztes gumiabroncsok is, de ezeket a barázdás abroncsokat
            csak akkor használják, ha esik az eső, vagy ha a pálya még vizes a
            korábbi esőzés miatt.
            <Divider variant="middle" className={styles.divider} />
            Száraz versenyen minden versenyzőnek legalább kétféle slick
            keveréket kell használnia a Nagydíj befejezése előtt, különben az
            FIA kizárja őket. A Forma-1 egyik hanem a legfontosabb része a
            gumistratégia, hiszen ennek hatalmas szerepe van a verseny
            végeredményében. A gumikat a Pirelli szolgáltatja a versenyzőknek
            szerződés alapján.
          </CardContent>
        </Card>
        <Card className={styles.seriesRulesCard} id="boxutca">
          <CardContent className={styles.cardTitle}>Boxutca</CardContent>
          <CardContent className={styles.cardContent}>
            A boxutca ad otthont a csapatok számára, itt találhatóak ugyanakkor
            a csapatok garázsai, ahol a verseynzök autóit készítik fel a
            versenyre, verseny közben itt cserélnek kereket az autón,
            finomítanak a beállításokon. Egy pilóta annyi boxkiállást hajthat
            végre, amennyit csak akar egy verseny alatt, de időigényes jellegük
            miatt nyilván arra törekszenek, hogy minimalizálják a kiállások
            számát. Egy ilyen kiállás bármeddig tarthat, mivel nincs maximális
            időkorlát, de a versenyző a lehető legrövidebb ideig szeretne a
            boxutcában maradni, hogy gyorsabban fejezze be a versenyt.
            <Divider variant="middle" className={styles.divider} />
            Mindazonáltal biztonsági okokból minimális időkorlátok vannak, hogy
            csökkentsék a hibák valószínűségét, mivel a boxban dolgozók a lehető
            leggyorsabb boxkiállások elérése érdekében rohannak. Legalább 0,15
            másodpercnek kell eltelnie a kerekeket rögzítő szerelők és az autó
            földre zuhanása között, majd további 0,2 másodpercnek, mielőtt a
            pilóta elhagyja a boxkiállási területet. A pilóta nem hagyhatja el a
            boxutcát úgy, hogy akadályozza a többi versenyzőt, különben
            büntetést kap. A boxutcában a versenyzőknek 80 km/órás sebességgel
            mehetnek maximum, különben szintén büntetést kapnak.
          </CardContent>
        </Card>
        <Card className={styles.seriesRulesCard} id="pontozás">
          <CardContent className={styles.cardTitle}>Pontozás</CardContent>
          <CardContent className={styles.cardContent}>
            Egy pontozási rendszer működik minden nagydíjon az első 10 helyezett
            számára(a többi nem kap pontot), azért, hogy rangsorolni tudják a
            versenyzőket és a csapatokat a szezon során. Ha egy pilóta nyer egy
            futamot, 25 pontot szerez magának és a csapatának. A második helyért
            18, a harmadikért 15, a negyedikért 12, az ötödikért 10, a
            hatodikért 8, a hetedikért 6, a nyolcadikért 4, a kilencedikért 2, a
            tizedikért 1 pont jár. További 1 pontot kap az a pilóta, aki a
            leggyorsabb kört futja meg egy nagydíjon, de csak akkor, ha a
            legjobb 10-ben végez. Az egyetlen további pontszerzési lehetőség a
            fent említett Sprint hétvégéken adható, ahol 2023-ban az első nyolc
            helyezett szerzett pontot, az első helyezett 8 pontot, a második 7
            pontot és így tovább a nyolcadik helyezettig, ahol 1 pont járt. A
            csapatok megosztoznak a versenyen szerzett pontokon, ami azt
            jelenti, hogy egy normál versenyhétvégén 44 pont jár, ha az első és
            a második helyen végeznek, és az egyik autójuk szerzi a leggyorsabb
            körért járó pontot.
          </CardContent>
        </Card>
        <Card className={styles.seriesRulesCard} id="autókról">
          <CardContent className={styles.cardTitle}>Az autókról</CardContent>
          <CardContent className={styles.cardContent}>
            Minden F1-es csapat úgy tervezi meg autóját, hogy megfeleljen az FIA
            által előre meghatározott előírásoknak, amelyek a fejlesztés szinte
            minden aspektusát lefedik a motor teljesítményétől a gumiabroncsok
            nyomásáig. Az F1 zsenialitása abban rejlik, ahogy a mérnökök
            értelmezik a szabályokat, olyan járművet alkotnak, amely betartja az
            előírásokat, továbbá innovatív módszereket talál a teljesítmény
            maximalizálására, amelyek reményeik szerint a rivális csapatoknál
            hiányozhatnak. A Forma-1 szabályzata mindent leír, beleértve az autó
            minimális tömegét (796 kg), a visszapillantó tükrök méretét (150x50
            mm), mennyi üzemanyagot kell rendelkezésre bocsátani a verseny után
            mintavételhez (1 liter), valamint, hogy a mérnököknek mennyi
            tervezési szabadsága lehet az aerodinamikai tervezés terén. Ha van
            egy kis szabadidőd olvasni és érdekelne az összes szabály az
            autókkal kapcsolatban, akkor az FIA hivatalos oldalán megtalálod a
            csupán 177 oldalas kis olvasmányt, amiben töviről hegyire le van
            írva minden.
          </CardContent>
        </Card>
        <Card className={styles.seriesRulesCard} id="zászlók">
          <CardContent className={styles.cardTitle}>Zászlók</CardContent>
          <CardContent className={styles.cardContent}>
            Bár az összes autóban van rádió és rengeteg információt kapnak a
            pilóták miközben autóznak a pályán, a zászlórendszer, amelyet a
            modern korban LED-táblák egészítenek ki, biztos módja annak, hogy
            minden versenyző tudatában legyen a pálya állapotának. Számos
            színvariációban léteznek a zászlók, ezek a kövezkezők:
            <br />
            Sárga zászló: A sárga zászló azt jelzi, hogy a versenyzőnek
            figyelnie kell az előtte lévő eseményre, ahol esetleg ki kell
            kerülnie egy baleset helyszínét. Ilyenkor tilos az előzés. Ha a
            marsall egyetlen sárga zászlót int, a pilótának le kell lassítania a
            közelgő veszély miatt, de ha két sárga zászlót int, az komolyabb
            incidenst jelent, amikor a vezetőnek fel kell készülnie a
            megállásra.
            <br />
            Zöld zászló: A zöld zászló a sárga zászló ellentéte, és azt jelzi a
            versenyzőnek, hogy az előtte lévő pálya incidensmentes, és teljes
            sebességgel hajthat vagy versenyezhet. A sárga zászlót általában
            zöld zászló követi, jelezve a vezetőnek, hogy az incidens terület
            mögöttük van, és szabadon száguldhatnak onnan, ahol a marsall a zöld
            zászlót lengeti.
            <br />
            Piros zászló: Ha a pályán a körülmények elérik azt a szintet, hogy a
            vezetés nem biztonságos, akár az időjárás, akár egy ütközés vagy
            valami más miatt, a piros zászlók minden pályabírónál lengenek, hogy
            tájékoztassák a versenyzőket, hogy óvatosan kell haladniuk és vissza
            kell térniük a boxutcába, mert a verseny felfüggesztésre került.
            <br />
            Kék zászló: Ha egy versenyző kék zászlót lát, az arrra
            figyelmezteti, hogy egy gyorsabb versenyző közeledik feléjük, aki
            már lekörözte őket, és el kell őt engednie szabályosan. A
            szabadedzéseken és a kvalifikáción előfordulhat, hogy egy rivális
            gyors kört fut, míg egy másik pilóta egy lassabb kört megy éppen.
            Ilyenkor is igazán hasznos tud lenne a kék zászló. A
            versenyfelügyelet megbünteti a versenyzőket, ha akadályozzák
            riválisukat, ha figyelmen kívül hagyják a három egymást követő kék
            zászlót a futam során.
            <br />
            Fekete fehér zászló(nem a kockás): Ha egy pilóta sportszerűtlenül
            vezet, például levág egy kanyart, vagy túl agresszív a többi
            versenyzővel szemben, fekete-fehér zászló figyelmezteti, hogy
            moderálja magát, különben vagy büntetést kap, vagy kizárják a
            versenyből.
            <br />
            Fekete zászló: Röviden és tömören a kizárást jelenti a versenyből. A
            versenyzőnek vissza kell térnie a boxutcába, amikor meglátja ezt a
            zászlót az autója számával együtt.
            <br />
            Fekete zászló narancssárga körrel: Szeretettel hívják húsgombóc
            zászlónak, mert a narancssárga kör hasonlít az ételhez, a
            narancssárga koronggal ellátott fekete zászló azt jelzi, hogy a
            sofőrnek mechanikai problémája van az autójával, és azonnal ki kell
            állnia a box-ba a javításhoz.
            <br />
            Kockás zászló: A kockás zászlót az edzések végén lobogtatják,
            jelezve a pilótáknak, hogy a szabadedzés, a kvalifikáció vagy a
            nagydíj véget ért.
          </CardContent>
        </Card>
      </div>
    </div>
  );
}

export default Formula1;
