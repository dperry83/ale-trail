BEGIN TRANSACTION;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS brewery;
DROP TABLE IF EXISTS beers;
DROP TABLE IF EXISTS reviews;

CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    role VARCHAR(50) NOT NULL,
    username varchar(50) NOT NULL UNIQUE,
    password_hash varchar(200) NOT NULL,
    name VARCHAR(255) ,
    city VARCHAR(255),
    state VARCHAR(2),
    zip VARCHAR(10)
);


CREATE TABLE brewery (
    brewery_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    image TEXT,
    history TEXT,
	website TEXT,
    hours_days_operation VARCHAR(255),
    address VARCHAR(255) NOT NULL,
    phone VARCHAR(20)

);


CREATE TABLE beers (
    beer_id SERIAL PRIMARY KEY,
	brewery_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    abv DOUBLE PRECISION NOT NULL,
    beer_type VARCHAR(255) NOT NULL,
	FOREIGN KEY (brewery_id) REFERENCES brewery (brewery_id)

);


CREATE TABLE reviews (
    review_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    brewery_id INT NOT NULL,
    beer_id INT NOT NULL,
    review_text TEXT,
    date DATE NOT NULL,
    rating INT NOT NULL,
	is_for_beers BOOLEAN NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (user_id),
    FOREIGN KEY (brewery_id) REFERENCES brewery (brewery_id),
    FOREIGN KEY (beer_id) REFERENCES beers (beer_id)
);

INSERT INTO brewery (name, image, history, website, hours_days_operation, address, phone)
VALUES ('Surly Brewing Co', 'https://surlybrewing.com/wp-content/uploads/2021/06/2019-09-14-Surly-Beer-Hall-Darin-Kamnetz-150-1.jpg', 'n/a', 'https://surlybrewing.com/', 'Tuesday	3–9 PM
Wednesday	3–9 PM
Thursday	3–9 PM
Friday	3–11 PM
Saturday	11 AM–11 PM
Sunday	10 AM–4 PM
Monday	Closed', '520 Malcolm Ave SE', '7635353330');
INSERT INTO brewery (name, image, history, website, hours_days_operation, address, phone)
VALUES ('Uteplis Brewing', 'https://utepilsbrewing.com/wp-content/uploads/2017/12/utp-map-web-1024x414.jpg', 'n/a', 'https://utepilsbrewing.com/', 'Tuesday	3–10 PM
Wednesday	3–10 PM
Thursday	3–10 PM
Friday	12–10 PM
Saturday	11 AM–10 PM
Sunday	11 AM–8 PM
Monday	3–10 PM', '225 Thomas Ave N #700', '6122497800');
INSERT INTO brewery (name, image, history, website, hours_days_operation, address, phone)
VALUES ('Modist Brewing Co', 'https://modistbrewing.com/wp-content/uploads/2016/04/DanicaDonnellyPhotography_160330_5w.jpg', 'n/a', 'https://modistbrewing.com/', 'Tuesday	4–10 PM
Wednesday	4–10 PM
Thursday	4–10 PM
Friday	12 PM–12 AM
Saturday	12 PM–12 AM
Sunday	12–8 PM
Monday	4–10 PM', '505 N 3rd S', '6124540258');
INSERT INTO brewery (name, image, history, website, hours_days_operation, address, phone)
VALUES ('Dangerous Man Brewing Company', 'https://dangerousmanbrewing.com/', 'n/a', 'https://dangerousmanbrewing.com/', 'Tuesday	4–10 PM
Wednesday	4–10 PM
Thursday	4–10 PM
Friday	12–11 PM
Saturday	12–11 PM
Sunday	1–7 PM
Monday	Closed', '1300 NE 2nd St', '6122597283');
INSERT INTO brewery (name, image, history, website, hours_days_operation, address, phone)
VALUES ('Pryes Brewing', 'https://images.squarespace-cdn.com/content/v1/593d53f75016e1368cc27242/936342dc-275e-4715-990d-2a6ef0d98fe9/Pryes-Coin-Black-Gold.png?format=1500w', 'n/a', 'https://www.pryesbrewing.com/', 'Tuesday	11 AM–11 PM
Wednesday	11 AM–11 PM
Thursday	11 AM–12 AM
Friday	11 AM–12 AM
Saturday	11 AM–12 AM
Sunday	11 AM–10 PM
Monday	11 AM–11 PM', '1401 West River Rd N', '6123548041');
INSERT INTO brewery (name, image, history, website, hours_days_operation, address, phone)
VALUES ('The Freehouse', 'https://images.squarespace-cdn.com/content/v1/5f58dcab66bbca192c9f937f/1610134429744-RRX6LW47TK57ECQVV2F6/DSC_3939+%281%29.JPG?format=500w', 'n/a', 'https://www.freehousempls.com/', 'Tuesday	11 AM–10 PM
Wednesday	11 AM–10 PM
Thursday	11 AM–12 AM
Friday	11 AM–12 AM
Saturday	8 AM–12 AM
Sunday	8 AM–10 PM
Monday	11 AM–11 PM', '701 N Washington Ave #101', '6123397011');
INSERT INTO brewery (name, image, history, website, hours_days_operation, address, phone)
VALUES ('Eastlake Craft Brewery', 'https://images.squarespace-cdn.com/content/v1/532ca6dfe4b0f59c2979a1c2/26bfc548-3230-40c9-983f-9f3d8c9f318c/Eastlake+Labels+2023+Cream.png?format=1500w', 'n/a', 'https://eastlakemgm.com/', 'Tuesday	11:30 AM–10 PM
Wednesday	11:30 AM–10 PM
Thursday	11:30 AM–10 PM
Friday	11:30 AM–10 AM
Saturday	11:30 AM–10 PM
Sunday	11:30 AM–10 PM
Monday	11:30 AM–10 PM', '920 E Lake St #123', '6126660422');
INSERT INTO brewery (name, image, history, website, hours_days_operation, address, phone)
VALUES ('Day Block Brewing Company', 'https://dbbc-tickets-22041300-production.s3.us-east-1.amazonaws.com/wp-content/uploads/2023/03/21222353/DayBlockBrewingLogo-3.png', 'n/a', 'https://www.dayblockbrewing.com/', 'Tuesday	4 PM–10 PM
Wednesday	4 PM–10 PM
Thursday	4 PM–10 PM
Friday	12:00 PM–11 PM
Saturday	12 AM–11 PM
Sunday	11 AM–8 PM
Monday	6 PM–11 PM', '1105 S Washington Ave', '6126177793');
INSERT INTO brewery (name, image, history, website, hours_days_operation, address, phone)
VALUES ('Finnegans', 'https://finnegans.org/wp-content/uploads/2021/11/Group-37.png', 'n/a', 'https://finnegans.org/', 'Tuesday	4 PM–9 PM
Wednesday	4 PM–9 PM
Thursday	3 PM–9 PM
Friday	3 PM–9 PM
Saturday	2 PM–9 PM
Sunday	Closed
Monday	Closed', '817 S 5th Ave', '6122083374');
INSERT INTO brewery (name, image, history, website, hours_days_operation, address, phone)
VALUES ('Fulton Beer', 'https://upload.wikimedia.org/wikipedia/en/1/1f/Fulton_Beer_Logo.png', 'n/a', 'https://www.fultonbeer.com/', 'Tuesday	3 PM–10 PM
Wednesday	11 AM–10 PM
Thursday	3 PM–10 PM
Friday	3 PM–11 PM
Saturday	12 PM–11 PM
Sunday	12 PM–8 PM
Monday	11 AM–1O PM', '414 N 6th Ave', '6123333208');
INSERT INTO brewery (name, image, history, website, hours_days_operation, address, phone)
VALUES ('Headflyer Brewing', 'https://www.headflyerbrewing.com/img/logo/logo.svg', 'n/a', 'https://www.headflyerbrewing.com/', 'Tuesday	4 PM–10 PM
Wednesday	4 PM–10 PM
Thursday	4 PM–10 PM
Friday	2 PM–12 AM
Saturday	12 PM–12 AM
Sunday	12 PM–8 PM
Monday	4 PM–10 PM', '861 E Hennepin Ave #200', '6125676345');
INSERT INTO brewery (name, image, history, website, hours_days_operation, address, phone)
VALUES ('Inbound Brew Co', 'https://images.squarespace-cdn.com/content/v1/56f4b7fc171107751285357c/1571670901612-93IQFQONP03IXH8RY6Y0/Inbound+BrewCo+Wordmark+White.png?format=1500w', 'n/a', 'https://inboundbrew.co/', 'Tuesday	12 PM–11 PM
Wednesday	11 AM–11 PM
Thursday	12 PM–11 PM
Friday	12 PM–12 AM
Saturday	11 AM–12 AM
Sunday	11 AM–11 PM
Monday	12 PM–11 PM', '701 N 5th St, Minneapolis', '6122940375');
INSERT INTO brewery (name, image, history, website, hours_days_operation, address, phone)
VALUES ('Indeed Brewing Company', 'https://www.indeedbrewing.com/assets/images/indeed-logo.png', 'n/a', 'https://www.indeedbrewing.com/', 'Tuesday	3 PM–11 PM
Wednesday	3 PM–11 PM
Thursday	3 PM–11 PM
Friday	11 AM–12 AM
Saturday	11 AM–12 AM
Sunday	11 AM–9 PM
Monday	3 PM–11 PM', '711 NE 15th Ave', '6128435090');
INSERT INTO brewery (name, image, history, website, hours_days_operation, address, phone)
VALUES ('Insight Brewing', 'https://static.wixstatic.com/media/c3925a_4c455c40f8d74e56ab98a26e8c2cb741~mv2.jpg/v1/fill/w_978,h_518,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/c3925a_4c455c40f8d74e56ab98a26e8c2cb741~mv2.jpg', 'n/a', 'https://www.insightbrewing.com/', 'Tuesday	3 PM–11 PM
Wednesday	3 PM–11 PM
Thursday	3 PM–11 PM
Friday	3 PM–12 AM
Saturday	1 PM–12 AM
Sunday	1 PM–11 PM
Monday	3 PM–11 PM', '2821 E Hennepin Ave', '6127227222');
INSERT INTO brewery (name, image, history, website, hours_days_operation, address, phone)
VALUES ('La Dona Cerveceria', 'https://dbbc-tickets-22041300-production.s3.us-east-1.amazonaws.com/wp-content/uploads/2023/03/21222353/DayBlockBrewingLogo-3.png', 'n/a', 'https://dameladona.com/', 'Tuesday	4 PM–11 PM
Wednesday	4 PM–11 PM
Thursday	4 PM–11 PM
Friday	3 PM–11 PM
Saturday	12 PM–2 AM
Sunday	12 PM–8 PM
Monday	Closed', '241 Fremont Ave N', '6123154613');
INSERT INTO brewery (name, image, history, website, hours_days_operation, address, phone)
VALUES ('Lakes & Legends Brewing Co', 'https://static.wixstatic.com/media/351255_1271603fc1a0481187013127ade9466c~mv2.png/v1/fill/w_117,h_59,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/raptor-w.png', 'n/a', 'https://www.lakesandlegends.com/', 'Tuesday	3 PM–10 PM
Wednesday	Closed
Thursday	3 PM–10 PM
Friday	2 PM–11 PM
Saturday	12 AM–11 PM
Sunday	11 AM–10 PM
Monday	3 PM–10 PM', '1368 Lasalle Ave', '6129996020');
INSERT INTO brewery (name, image, history, website, hours_days_operation, address, phone)
VALUES ('LynLake Brewery', 'https://images.squarespace-cdn.com/content/v1/53518407e4b0a1a3d8a5d31a/1399912971353-Q9PSPZGABXTISLCNY21B/LL_Brew_New.png?format=1500w', 'n/a', 'https://www.lynlakebrewery.com/', 'Tuesday	5 PM–10 PM
Wednesday	5 PM–10 PM
Thursday	5 PM–10 PM
Friday	4 PM–12 AM
Saturday	12 PM–12 AM
Sunday	12 AM–10 PM
Monday	5 PM–10 PM', '2934 Lyndale Ave S', '6122249682');
INSERT INTO brewery (name, image, history, website, hours_days_operation, address, phone)
VALUES ('Town Hall Brewery', 'https://static.spotapps.co/web/townhallbrewery--com/custom/logo.png', 'n/a', 'https://townhallbrewery.com/', 'Tuesday	12 PM–9 PM
Wednesday	12 PM–9 PM
Thursday	12 PM–10 PM
Friday	12 PM–10 PM
Saturday	12 AM–10 PM
Sunday	12 AM–9 PM
Monday	12 PM–9 PM', '1430 S Washington Ave', '6123398696');
INSERT INTO brewery (name, image, history, website, hours_days_operation, address, phone)
VALUES ('Venn Brewing', 'https://www.vennbrewing.com/wp-content/uploads/2021/10/venn_web_logo-01-1-980x980.png', 'n/a', 'https://www.vennbrewing.com/', 'Tuesday	8 AM–10 PM
Wednesday	8 AM–10 PM
Thursday	8 AM–10 PM
Friday	8 AM–11 PM
Saturday	8 AM–11 PM
Sunday	8 AM–9 PM
Monday	4 PM–10 PM', '3550 E 46th St Suite 140', '6128878366');
INSERT INTO brewery (name, image, history, website, hours_days_operation, address, phone)
VALUES ('Wild Mind Ales', 'https://images.squarespace-cdn.com/content/v1/583d8d0ee3df281220ae3a4c/1594826065891-A7CCCMIY2B401OL5DZYV/WMA_HOME_1.png?format=2500w', 'n/a', 'https://www.wildmindales.com/', 'Tuesday	4 PM–9 PM
Wednesday	4 PM–9 PM
Thursday	4 PM–9 PM
Friday	2 PM–10 PM
Saturday	12 PM–10 PM
Sunday	12 PM–8 PM
Monday	Closed', '6031 Pillsbury Ave', '6122861777');

INSERT INTO beers (brewery_id, name, description, abv, beer_type)
VALUES
((SELECT brewery_id FROM brewery WHERE name = 'Dangerous Man Brewing Company'), 'Boysenberry Milkshake IPA', 'Smooth and fruity milkshake IPA with vanilla and berry flavor notes.', 7.2, 'Milkshake IPA'),
((SELECT brewery_id FROM brewery WHERE name = 'Dangerous Man Brewing Company'), 'Cascadian Dark Ale', 'Dark, roasty and hoppy with Cascade and Styrian Eagle hops.', 7.5, 'Black IPA'),
((SELECT brewery_id FROM brewery WHERE name = 'Dangerous Man Brewing Company'), 'Chocolate Milk Stout', 'Rich, chocolate milk scent paired with a slight, almost invisible, nose of hop and roast bitterness.', 5.1, 'Milk Stout'),
((SELECT brewery_id FROM brewery WHERE name = 'Dangerous Man Brewing Company'), 'Biere de Garde', 'A balance between malt sweetness, hop bitterness, and yeast produced esters and phenols.', 7.5, 'Belgian'),
((SELECT brewery_id FROM brewery WHERE name = 'Dangerous Man Brewing Company'), 'Double Cream Coffee Dream', 'A smooth, dreamy, coffee-forward cream ale with a little kick of sweetness, reminiscent of a white stout.', 8.0, 'Cream Ale'),
((SELECT brewery_id FROM brewery WHERE name = 'Modist Brewing Co'), 'Oak-Aged Pilsner', 'Bohemian Pilsner malt and MN North Star Pils malt. Hopped with Huell Melon, Triple Pearl and Cryo Citra.', 5.5, 'Pilsner'),
((SELECT brewery_id FROM brewery WHERE name = 'Modist Brewing Co'), 'Citra Pilsner', 'Bohemian Pilsner barley malt, kettle and whirlpool hopped with our hand-selected Citra and Czech Saaz.', 5.2, 'Pilsner'),
((SELECT brewery_id FROM brewery WHERE name = 'Modist Brewing Co'), 'Cold IPA', 'Pilsner malt, flaked corn, hopped and dry hopped with Citra, Mosaic, Simcoe, HBC 586 and cryo columbus, fermented and lagered with our house lager yeast.', 5.3, 'IPA'),
((SELECT brewery_id FROM brewery WHERE name = 'Modist Brewing Co'), 'Doppelbock', 'Brewed with decoction mashed pilsner, Vienna and Munich malts. Kettle hopped with German Hersbrucker then fermented and lagered with German lager yeast.', 8.5, 'Doppelbock'),
((SELECT brewery_id FROM brewery WHERE name = 'Modist Brewing Co'), 'Barrel Aged Imperial Stout', 'Barrel aged in a blend of Willett Rye and Rittenhouse Rye barrels for 29 months then conditioned on toasted pecan, toasted coconut, and Tahitian vanilla beans.', 13, 'Imperial Stout'),
((SELECT brewery_id FROM brewery WHERE name = 'Surly Brewing Co'), 'One Man Mosh Pit', 'Amarillo, Citra, Simcoe, and Mosaic dry-hopping hoists this IPA above the fray.', 7.2, 'Hazy IPA'),
((SELECT brewery_id FROM brewery WHERE name = 'Surly Brewing Co'), 'Sydney Loves Kevin', 'Cacao, vanilla, lactose, and hazelnut give this stout a roasty, nutty sweetness.', 10.2, 'Stout'),
((SELECT brewery_id FROM brewery WHERE name = 'Surly Brewing Co'), 'Hell', 'A pale, gold lager with bready malt aromas and flavors, floral hops, and a balanced finish.', 5.0, 'Lager'),
((SELECT brewery_id FROM brewery WHERE name = 'Surly Brewing Co'), 'Furious IPA', 'Aggressively hopped and citrusy, but with a chewy, caramel backbone.', 6.7, 'IPA'),
((SELECT brewery_id FROM brewery WHERE name = 'Surly Brewing Co'), 'Double Bladed Axe Man', 'Double Bladed Axe Man guides your journey to IPA Valhalla with a mighty swing of Citra and Mosaic hops.', 10.8, 'Double IPA'),
((SELECT brewery_id FROM brewery WHERE name = 'Pryes Brewing'), 'Miraculum', 'Signature dry-hopped and citrus-forward IPA with a smooth, malty finish.', 6.4, 'Midwest IPA'),
((SELECT brewery_id FROM brewery WHERE name = 'Pryes Brewing'), 'Dublin Dry Stout', 'A blend of six different malts and oats crafted to create our interpretation of a Dry Irish Stout.', 4.5, 'Stout'),
((SELECT brewery_id FROM brewery WHERE name = 'Pryes Brewing'), 'Pragmatic Pils', 'A clean, crisp, easy-drinking Czech-style pilsner that is a practical choice in almost any setting.', 4.2, 'Pilsner'),
((SELECT brewery_id FROM brewery WHERE name = 'Pryes Brewing'), 'Bohemian Blonde', 'One of our longest standing, taproom-exclusive releases, and one of the easiest drinking recipes on offer.', 4.6, 'Blonde Ale'),
((SELECT brewery_id FROM brewery WHERE name = 'Pryes Brewing'), 'Stone Skipper', 'Made with Amarilla and HS17704 hops, giving it aromas of citrus, black currant, passion fruit and papaya.', 6.0, 'Red IPA'),
((SELECT brewery_id FROM brewery WHERE name = 'Uteplis Brewing'), 'Plaid Bikini', 'A classic base of malted wheat and barley, our own spring water, then callista, a new German hop variety with aromas of berries and dark fruit along with subdued notes of bananas and clove.', 5.2, 'Summer Wheat'),
((SELECT brewery_id FROM brewery WHERE name = 'Uteplis Brewing'), 'Alt 1848', 'A deliciously drinkable German Alt, brewed in the tradition of a Dusseldorf brewery founded in 1848.', 5.4, 'Altbier'),
((SELECT brewery_id FROM brewery WHERE name = 'Uteplis Brewing'), 'Pils', 'Brewed with Czech-grown barley and hops, fermented with a Czech lager yeast strain.', 5.0, 'Pilsner'),
((SELECT brewery_id FROM brewery WHERE name = 'Uteplis Brewing'), 'Tall Tails', 'Malted barley, big hop flavor and aroma from the Pacific Northwest. Generous additions of Zeus, Cascade, and Centennial hops bring the flavor and aroma you crave.', 6.8, 'American IPA'),
((SELECT brewery_id FROM brewery WHERE name = 'Uteplis Brewing'), 'Minnator', 'This style -- described by some as "liquid bread" -- comes packed with toasty, malt flavor and hints of butter biscuits.', 7.8, 'Doppelbock'),
((SELECT brewery_id FROM brewery WHERE name = 'The Freehouse'), 'No. 1 Kölsch', 'Golden-colored ale, sweet yet crisp, light apple/pear fruitiness, mild hop flavor/aroma and medium bitterness, light body.', 4.9, 'Kolsch'),
((SELECT brewery_id FROM brewery WHERE name = 'The Freehouse'), 'No. 2 IPA', 'Copper-colored ale, high hop flavor/aroma and bitterness, medium malt sweetness to balance, crisp medium body.', 6.3, 'IPA'),
((SELECT brewery_id FROM brewery WHERE name = 'The Freehouse'), 'No. 3 Brown', 'Mahogany-colored ale, medium caramel sweetness, toasted malt character, mild hop bitterness balances malt profile, medium body.', 5.2, 'American Brown Ale'),
((SELECT brewery_id FROM brewery WHERE name = 'The Freehouse'), 'No. 60 Cedar Wood Rice Lager', 'Crisp, refreshing lager made with rice and sorachi ace hops. Aged on cedar to add a layer of complexity.', 4.3, 'Japanese Rice Lager'),
((SELECT brewery_id FROM brewery WHERE name = 'The Freehouse'), 'No. 61 Chocolate Peanut Butter Stout', 'Chocolatey peanut butter beer', 6.3, 'Stout'),
((SELECT brewery_id FROM brewery WHERE name = 'Eastlake Craft Brewery'), 'Blueliner', 'Fresh and peachy', 5.6, 'American Pale Ale'),
((SELECT brewery_id FROM brewery WHERE name = 'Eastlake Craft Brewery'), 'Got Dang', 'Dank pineapple and pine', 10.6, 'DDH Juicy Double IPA'),
((SELECT brewery_id FROM brewery WHERE name = 'Eastlake Craft Brewery'), 'Mendoza Line', 'Yellow and beer-flavored', 3.6, 'American Light Lager'),
((SELECT brewery_id FROM brewery WHERE name = 'Eastlake Craft Brewery'), 'Dank Aaron', 'Dank Aaron rounds the bases of flavor and aroma -- citrus, pine, earthy, and resin', 9.2, 'Thiolized Double IPA'),
((SELECT brewery_id FROM brewery WHERE name = 'Eastlake Craft Brewery'), 'Kirby Pucker 26', 'Açai berry and peach sour gose', 4.0, 'Fruited Gose'),
((SELECT brewery_id FROM brewery WHERE name = 'Day Block Brewing Company'), 'Yakudoshi', 'Crisp and dry on the finish with slight floral umami notes, and just the right amount of hops.', 5.4, 'Japanese Dry Hopped Pale Ale'),
((SELECT brewery_id FROM brewery WHERE name = 'Day Block Brewing Company'), 'Minnesota Weiss', 'Light and tart aromatics and a balanced wheat body to carry it all.', 4.4, 'Berliner Weiss'),
((SELECT brewery_id FROM brewery WHERE name = 'Day Block Brewing Company'), 'Pils of a Feather', 'A light golden pilsner brewed with imported malt from the South of France and aggressively dry hopped with Saaz, Tettnang, and Hallertauer Mittlefruher hops.', 5.1, 'Italian Style Pilsner'),
((SELECT brewery_id FROM brewery WHERE name = 'Day Block Brewing Company'), 'Tangerine White', 'Hopped with Mandarina Bavaria hops and complemented with a generous addition of fresh tangerine.', 4.6, 'Wheat Ale'),
((SELECT brewery_id FROM brewery WHERE name = 'Day Block Brewing Company'), 'Stadium Blonde', 'Pilsner malt, some American Munich malt, flaked yellow corn, flaked barley, and a little bit of cara-pilsner malt.', 4.4, 'Blonde Ale'),
((SELECT brewery_id FROM brewery WHERE name = 'Finnegans'), 'Finnegans Irish Amber', 'A 23-year-old Minneapolis classic red ale. The beer that has been giving back ever since the first pint was poured.', 4.75, 'Amber Ale'),
((SELECT brewery_id FROM brewery WHERE name = 'Finnegans'), 'Blood Orange Pilsner', 'A dry pilsner with pleasant orange and grapefruit flavors melding into the brew. Completely crushable.', 6.0, 'Pilsner'),
((SELECT brewery_id FROM brewery WHERE name = 'Finnegans'), 'Clover Honey', 'Lemon and biscuit notes balanced by sweet locally-sourced clover honey.', 6.0, 'Ale'),
((SELECT brewery_id FROM brewery WHERE name = 'Finnegans'), 'Dead Irish Poet', 'Dry smooth roasted quality with dark chocolate and stone fruit notes.', 7.0, 'Stout'),
((SELECT brewery_id FROM brewery WHERE name = 'Finnegans'), 'Rock of Cashel', 'A double red ale with regal malt notes, in honor of an incredible landmark in Ireland.', 8.5, 'Red Ale'),
((SELECT brewery_id FROM brewery WHERE name = 'Fulton Beer'), 'Lonely Blonde', 'German hops, American malt. Sit back and enjoy Minnesota’s favorite Blonde Ale. Cheers!', 4.8, 'American Blonde Ale'),
((SELECT brewery_id FROM brewery WHERE name = 'Fulton Beer'), 'Sweet Child of Vine', 'A rich, sweet, caramel malt nose shares the aroma with a complex blend of earthy, citrusy and piney hop characteristics.', 6.4, 'IPA'),
((SELECT brewery_id FROM brewery WHERE name = 'Fulton Beer'), 'Chill City Chugger', 'A beer that tastes like...wait for it...beer.', 4.0, 'Golden Lager'),
((SELECT brewery_id FROM brewery WHERE name = 'Fulton Beer'), 'Northern Standard', 'A genuine all-malt beer, made from 2-row barley malt, American hops, and pilsner yeast.', 4.5, 'Amber Lager'),
((SELECT brewery_id FROM brewery WHERE name = 'Fulton Beer'), '300', 'Built on a base of pilsner malt and heavily hopped with Mosaic, this West Coast IPA was so well received, we had to make it available year-round.', 7.0, 'Mosaic IPA'),
((SELECT brewery_id FROM brewery WHERE name = 'Headflyer Brewing'), 'Crunch Time', 'This Citrus Wheat Ale is bursting with orange citrus flavor, so no garnish is required.', 5.2, 'Citrus Wheat Ale'),
((SELECT brewery_id FROM brewery WHERE name = 'Headflyer Brewing'), 'Prolific', 'Prolific amounts of Centennial, Columbus, and Chinook hops to get your chill on.', 6.0, 'West Coast IPA'),
((SELECT brewery_id FROM brewery WHERE name = 'Headflyer Brewing'), 'Wicked Jump Shot', 'This Hazy Pale Ale features Mosaic and Amarillo hops to impart a mix of berry and citrus fruit flavors.', 5.4, 'Pale Ale'),
((SELECT brewery_id FROM brewery WHERE name = 'Headflyer Brewing'), 'Candy Paint', 'Vic Secret and Citra hops give it sweet, candy-like hop flavors.', 5.9, 'DDH Hazy IPA'),
((SELECT brewery_id FROM brewery WHERE name = 'Headflyer Brewing'), 'It Was All A Dream', 'We kicked up the hop flavor of our flagship hazy IPA by doing a double dry hop of Citra and El Dorado.', 7.2, 'Juicy IPA'),
((SELECT brewery_id FROM brewery WHERE name = 'Inbound Brew Co'), 'Contains Bees: Peanut Butter Honey Blonde', 'A refreshing blonde ale with creamy peanut butter and sweet Minnesota honey.', 5.2, 'Blonde Ale'),
((SELECT brewery_id FROM brewery WHERE name = 'Inbound Brew Co'), 'Raspberry Jam Bam', 'A bright and smooth blonde ale that is perfectly complemented by the addition of bold raspberry.', 5.4, 'Raspberry Blonde Ale'),
((SELECT brewery_id FROM brewery WHERE name = 'Inbound Brew Co'), 'Fruit of the Loop', 'Dry hopped with more Citra and Mosaic than your tastebuds can handle to dial up the flavor and bring in the pleasant sweetness of tropical fruit.', 6.4, 'West Coast IPA'),
((SELECT brewery_id FROM brewery WHERE name = 'Inbound Brew Co'), 'Conifer Crush', 'This dank hop blend is riper and stickier than pine sap and more refreshing than chopped firewood. Inspired by weekends among the conifer trees, brewed for drinking anywhere.', 7.0, 'IPA'),
((SELECT brewery_id FROM brewery WHERE name = 'Inbound Brew Co'), 'Laser Loon', 'Light and easy flavors with a crisp hop balance.', 4.3, 'Pilsner'),
((SELECT brewery_id FROM brewery WHERE name = 'Indeed Brewing Company'), 'Pistachio Cream Ale', 'This pistachio-forward beer does not disappoint with a subtly nutty and malty flavor that leaves a spritzy mouthfeel.', 5.5, 'Cream Ale'),
((SELECT brewery_id FROM brewery WHERE name = 'Indeed Brewing Company'), 'Day Tripper Pale Ale', 'Four pounds of hops per barrel give this West Coast-style pale ale a heady, dank, and citrus-laced aroma supported by a complex and subtly sweet malt backbone.', 5.4, 'Pale Ale'),
((SELECT brewery_id FROM brewery WHERE name = 'Indeed Brewing Company'), 'Pils', 'Crisp, clean and always on point, Pils takes you off the clock and on to whatever makes you tick.', 5.1, 'Pilsner'),
((SELECT brewery_id FROM brewery WHERE name = 'Indeed Brewing Company'), 'Flavorwave IPA', 'Bright golden and lit with a gentle haze, Flavorwave IPA delivers with pineapple, citrus and stone fruit aromas and a rush of fruity, tropical hop flavor.', 6.2, 'IPA'),
((SELECT brewery_id FROM brewery WHERE name = 'Indeed Brewing Company'), 'Mexican Honey Imperial Lager', 'Humming with a citrus and floral fiesta for the senses.', 8.0, 'Imperial Lager'),
((SELECT brewery_id FROM brewery WHERE name = 'Insight Brewing'), 'Troll Way', 'A sturdy malt backbone provides a rich, full flavor to support a Citra-forward hop bill, while a fruity and piney aroma gives way to flavors of grapefruit and lemon.', 7.0, 'American IPA'),
((SELECT brewery_id FROM brewery WHERE name = 'Insight Brewing'), 'Banshee Cutter', 'Smooth, light roast coffee.', 5.5, 'Coffee Golden Ale'),
((SELECT brewery_id FROM brewery WHERE name = 'Insight Brewing'), 'Vibe', 'A smooth, medium-body mouthfeel easily transitions to bright flavors of tropical fruit and aromas of peach, lemon, and pear.', 6.6, 'New England IPA'),
((SELECT brewery_id FROM brewery WHERE name = 'Insight Brewing'), 'Ctrl+Alt+Beer', 'Brewed with Talus, Strata, Mosaic and Amarillo hops.', 8.8, 'DDH Double Hazy IPA'),
((SELECT brewery_id FROM brewery WHERE name = 'Insight Brewing'), 'Drift', 'Simcoe, El Dorado, Mosaic and Citra', 6.6, 'West Coast IPA'),
((SELECT brewery_id FROM brewery WHERE name = 'Wild Mind Ales'), 'Daylight', 'Hopped and dry-hopped for an earth, full taste.', 5.5, 'Farmhouse Ale'),
((SELECT brewery_id FROM brewery WHERE name = 'Wild Mind Ales'), 'Mimetic Architecture', 'Base hopped with Hallertau and Saaz, fermented with Thiolized Lager yeast for an explosion of Passion fruit and guava aromatics', 6.2, 'Lager'),
((SELECT brewery_id FROM brewery WHERE name = 'Wild Mind Ales'), 'Deep Unreal', 'Quadruple mashed, boiled for over 28 hours for maximum viscosity. Loaded with nutmeg, Vietnamese cinnamon and Wild Grind dark roast coffee for a bold and sweet flavor.', 12.6, 'Imperial Stout'),
((SELECT brewery_id FROM brewery WHERE name = 'Wild Mind Ales'), 'Such Wonders', 'Dry and lively with pleasing minimality and refreshing herbal notes.', 13.8, 'Farmhouse Ale'),
((SELECT brewery_id FROM brewery WHERE name = 'Venn Brewing'), 'Creamium', 'Classic American cream ale.', 5.2, 'Cream Ale'),
((SELECT brewery_id FROM brewery WHERE name = 'Venn Brewing'), 'Northodox', 'Citrus-Forward New England IPA.', 6.5, 'IPA'),
((SELECT brewery_id FROM brewery WHERE name = 'Venn Brewing'), 'Basic Decency', 'House Pale Ale with Citra Hops.', 5.0, 'Pale Ale'),
((SELECT brewery_id FROM brewery WHERE name = 'Venn Brewing'), 'Death By Limes', 'Mexican Amber Lager with Lime.', 5.0, 'Amber Lager'),
((SELECT brewery_id FROM brewery WHERE name = 'Town Hall Brewery'), 'West Bank Pale Ale', 'Light-bodied, smooth; citrus and pine hop character.', 4.8, 'Pale Ale'),
((SELECT brewery_id FROM brewery WHERE name = 'Town Hall Brewery'), 'Pitstop Fruited Lager', 'Smooth lager beer made with Michigan-grown cherries.', 5.0, 'Lager'),
((SELECT brewery_id FROM brewery WHERE name = 'Town Hall Brewery'), 'Super Strike Light Lager', 'American influenced light German-style lager. Brewed to be refreshing while still true to pure lager flavor.', 4.2, 'Lager'),
((SELECT brewery_id FROM brewery WHERE name = 'Town Hall Brewery'), 'Hope and King Scotch Ale', 'Exceptionally smooth, malt-forward; caramel, toffee.', 5.8, 'Ale'),
((SELECT brewery_id FROM brewery WHERE name = 'LynLake Brewery'), 'Bibendum', 'This Barrel Aged Russian Imperial Stout was aged in Willett Rye Barrels for 18 months giving a roasty, fudgy, decadent, and luxurious character with every sip.', 12.6, 'Imperial Stout'),
((SELECT brewery_id FROM brewery WHERE name = 'LynLake Brewery'), 'Take 6', 'This IPA pours a rich, orange-copper color and is balanced with a toasted malt backbone to keep your palate from succumbing to the full-on hop assault.', 6.0, 'American IPA'),
((SELECT brewery_id FROM brewery WHERE name = 'LynLake Brewery'), 'Rubbish', ' A nice little zing or spiciness noted with a well rounded malt complexity.', 5.8, 'Amber Lager'),
((SELECT brewery_id FROM brewery WHERE name = 'LynLake Brewery'), 'Shadows In The Dark', 'This beer is dark, sweet, creamy, and smooth, just like the song', 15.0, 'Imperial Stout'),
((SELECT brewery_id FROM brewery WHERE name = 'Lakes & Legends Brewing Co'), 'Minnesota', 'A light, crisp ale with a clean malt character and subtle fruitiness.', 5.0, 'Cream Ale'),
((SELECT brewery_id FROM brewery WHERE name = 'Lakes & Legends Brewing Co'), 'St. Gail', 'Sweet up front with immediate notes of raspberry and honey flavors, and finishing dry for a spritzy, tart ale.', 7.2, 'Raspberry Honey Ale'),
((SELECT brewery_id FROM brewery WHERE name = 'Lakes & Legends Brewing Co'), 'Marigold', 'Boozy and fruity with banana, vanilla, and clove.', 8.2, 'Golden Strong Ale'),
((SELECT brewery_id FROM brewery WHERE name = 'Lakes & Legends Brewing Co'), 'Vibe Czech', 'Light, crisp, and flavor that doesn''t stick around. Your classic light pilsner.', 5.2, 'Czech Pilsner'),
((SELECT brewery_id FROM brewery WHERE name = 'Lakes & Legends Brewing Co'), 'Alpenglow', 'A deliciously juicy, pillowy-soft IPA that serves you an abundance of pineapple with bright notes of tangerine and a tiny bit of berry.', 5.6, 'DDH Hazy IPA');

COMMIT TRANSACTION;
