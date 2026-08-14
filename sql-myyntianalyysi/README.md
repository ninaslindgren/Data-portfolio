# SQL-myyntianalyysi

SQL-analyysiprojekti kuvitteellisen yrityksen myyntitietokannasta.

Projektin tavoitteena on harjoitella SQL:n käyttöä liiketoiminnan kysymysten ratkaisemisessa.

## Liiketoimintakysymykset

Analyysissä selvitetään:

- Mitkä ovat 10 myydyintä tuotetta?
- Ketkä ovat parhaat asiakkaat?
- Miten myynti kehittyy kuukausittain?
- Mikä tuoteryhmä tuottaa eniten?

## Käytetyt työkalut

- SQL
- SQLite
- DB Browser for SQLite

## Tietokanta

Kuvitteellinen yrityksen tietokanta sisältää tiedot asiakkaista, tuotteista, tuoteryhmistä, tilauksista ja tilausriveistä.

Tietokannan taulut:

- customers
- products
- categories
- orders
- order_items

## Keskeisiä havaintoja

- Elektroniikka oli eniten katetta tuottava tuoteryhmä.
- Elektroniikan myynti oli 36 673,53 € ja kate 17 064,53 €.
- Parhaiden asiakkaiden myyntiä ja tilausten määrää voidaan vertailla SQL-kyselyillä.
- Kuukausittaista myynnin kehitystä voidaan tarkastella tilaustietojen perusteella.

## SQL-osaaminen

Projektissa hyödynnetään muun muassa:

- SELECT
- JOIN
- GROUP BY
- ORDER BY
- SUM
- COUNT
- ROUND
- LIMIT
- SQLite strftime -funktiota
