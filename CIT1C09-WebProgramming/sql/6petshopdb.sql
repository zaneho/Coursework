-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 06, 2016 at 08:18 AM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `petshopdb`
--
CREATE DATABASE IF NOT EXISTS `petshopdb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `petshopdb`;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE IF NOT EXISTS `items` (
  `itemid` int(11) NOT NULL,
  `userid` varchar(24) NOT NULL,
  `itembrand` varchar(30) NOT NULL,
  `itemname` varchar(80) NOT NULL,
  `description` mediumtext NOT NULL,
  `pettype` varchar(30) NOT NULL,
  `category` varchar(24) NOT NULL,
  `imagefile` varchar(80) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`itemid`, `userid`, `itembrand`, `itemname`, `description`, `pettype`, `category`, `imagefile`, `price`) VALUES
(1, 'mary', 'PEDIGREE', '5 Kinds Of Meat', 'Predigree home style recipe gives your dog an excellent meal everyday.\r\nProduced from quality meat and selected vegetables that are caerfully cooked to preserve the essential nutrients needed by your pet.\r\nEnriched with Vitamin E and omega 6 for healthy skin and shiny coat.\r\n										\r\nAlert eyes and reflexes. Energy and proper digestion. Healthy skin and shiny coat. Strong muscles, teeth and bones\r\n\r\nINGREDIENTS: \r\nMeats including chicken, lamb and beef, liver and veal, gelling agent,cereal protein, vitamins and minerals, vegetable fibers, sunflower seed oil, coloring agent and flavor.', 'dog', 'food', 'dogfood_predigree.png', '2.50'),
(2, 'pat', 'DIVINE', 'Beef & Veal', 'Divine Classic Gold Selection is an exquisite menu developed for your dog by our experts.\r\nThe menu was carefully formulated with the highest quality, sumptuous and tender meat ingredients - cooked to perfection in their own succulent juices.\r\nThis delicious recipe guarantees your dog a nutritionally complete meal, full of great taste.\r\nDivine Class Gold Selection will give your dog the ultimate satisfaction in every meal. Succulent Beef & Veal, fine flavours and tantalizing textures from the best ingredients, is a truly exquisite menu.\r\n\r\nINGREDIENTS:\r\nSelected meats (Beef, Chicken, Lamb, Turkey, Veal) and meat by-products, flour, gelling agents, food colouring, essential vitamins and minerals. \r\nNo Preservatives\r\n\r\n', 'dog', 'food', 'dogfood_divine.png', '3.25'),
(3, 'pat', 'PAMPERED', 'T-Shirt Pluto (Small)', '95% cotton and 5% elastance\r\nMachine washable\r\nPluto screen printing\r\n\r\nSIZE:\r\nSmall\r\n20 cm', 'dog', 'clothing', 'dogclothes_pampered.png', '14.90'),
(4, 'jack', 'DRESS A PET', 'Blue Penguin Costume', 'Made from super soft material tailored into a penguin. \r\nMachine washable. \r\nDetailed embroidery of a penguin and your pooch will be ready for a costume party!\r\n\r\nCOLOUR:\r\nBlue\r\n\r\nSIZE: Large \r\nNeck (cm)   Chest (cm)   Length (cm)\r\n31 - 35       49 - 55         34', 'dog', 'clothing', 'dogclothes_dressapet.png', '19.90'),
(5, 'jack', 'DoggyDolly', 'Polo Beige Shirt', 'Superior product. \r\nDoggydolly fashion products are worldwide famous for its fashionable design and quality of fabrics. \r\nOur excellent workmanship secures the comfortable fit, which each of our clothes provides for your beloved pets.\r\nThis attractive nicely crafted design is tailored into a gentle dog shirt. \r\nA perfect fit for everyday fashion wear.\r\n\r\nCOLOUR:\r\nBeige\r\n\r\nSIZE:\r\nLarge Ideal for Shih Tzu, Pekingese, Poodle, Miniature Schnauzer\r\nBack Length 31-33 cm\r\nChest 46-48 cm', 'dog', 'clothing', 'dogclothes_doggydollypolo.png', '12.90'),
(6, 'jack', 'DoggyMan', 'Slicker Brush', 'Gently brushes out the fur. Ideal for daily care.  \r\nComb hair gentle, helps massage and promotes blood circulation.\r\n\r\nMade from stainless steel metal parts, resistant to corrosion. Plastic has antibacterial properties.\r\n\r\nSIZE:\r\nApprox 7 inches long', 'dog', 'grooming', 'doggromming_doggyman.png', '15.90'),
(7, 'mary', 'KONG', 'Air Squeaker Bone', 'Heavy duty and it squeaks!\r\nErratic bounce\r\nNon abrasive and non toxic felt cover.\r\n\r\nSIZE:\r\nMedium\r\nLength approximately 15 cm', 'dog', 'toy', 'dogtoy_kong.png', '5.50'),
(8, 'mary', 'AFP', 'BBQ Ham Shank', 'Keep your dog entertained all day with this soft toy. \r\nThis toy is crafted into a delicious looking ham shank. \r\nSoft and perfect for daily play!\r\n\r\nSIZE:\r\nSmall\r\n1 piece', 'dog', 'toy', 'dogtoy_afp.png', '2.90'),
(9, 'pat', 'Kudi Pet', 'Nail Clipper For Dog', 'For dogs, safety quality comfort. \r\nThe best product, professional tool. \r\nExcellent manufacturing of the blades, comfortable hand feeling.\r\n\r\nLarge dog nail clipper, ideal for medium to large sized breeds.\r\n\r\nSIZE:\r\nSmall\r\n13.2 x 4.1 x 1.5 cm', 'dog', 'grooming', 'doggromming_kudipet.png', '9.90'),
(10, 'jelly', 'Loving Pets', 'Fishbone Cat Bowl', 'Award winning, patented Bella Bowls are the best selling pet bowls in the pet industry - and for good reason! \r\nFunctional and beautiful, Bella Bowls are truly the perfect pet dish!\r\n\r\nVet recommended bacteria resistant stainless steel interior\r\nRemovable rubber base prevents skids, spill and noise\r\nDishwasher safe (remove rubber ring)\r\nPatented -exclusively from Loving pets.\r\n\r\nCOLOR:\r\nMetallic Blue\r\n\r\nSIZE:\r\nExtra Small\r\nDiameter approx 12 cm\r\nDepth approx 3 cm', 'cat', 'bowl', 'cat_lovingpet-bowl.png', '3.90'),
(11, 'jelly', '1ST CHOICE', 'ADULT FINICKY (CHICKEN)', '-Finicky Chicken formula. With Opti flavor crunch\r\n-Intended for Finicky cats!\r\n-With added premium flavor and hairball control\r\n\r\nINGREDIENTS:\r\nChicken, chicken meal, rice, chicken fat naturally preserved with mixed tocopherols, pea protein, brown rice, herring meal, dried egg product, beet pulp, pearled barley, oat groats, natural flavor, pea fiber, whole flaxseed, dried tomato pomace, salmon oil, potassium chloride, lecithin, choline chloride, salt, calcium proprionate (as a preservative), sodium bisulfate, calcium carbonate, taurine, DL-methionine, L-lysine, yeast extract, ferrous sulfate, ascorbic acid (Vitamin C), chicory extract, zinc oxide, sodium selenite, alpha tocopherol acetate (a source of vitamin E), nicotinic acid, Yucca schidigera extract, calcium iodate, manganous oxide, D-calcium pantothenate, thiamine mononitrate, riboflavin, pyridoxine HCl, vitamin A supplement, cholecalciferol (a source of vitamin D3), biotin, dried spearmint, dried parsley, green tea extract, zinc proteinate, vitamin B12 supplement, cobalt carbonate, folic acid, manganese proteinate, copper proteinate.\r\n\r\nANALYSIS:\r\nCrude protein....30% min\r\nCrude fat.........20% min\r\nCrude fiber.......3% max\r\nMoisture.........10% max\r\nAsh...............9% max\r\n\r\n1st Choice- Cat Food- Adult- Finicky- Chicken Formula is formulated to meet the nutritional levels established by the AAFCO (Association of American Feed Control Officials) Cat Food nutrient profiles for maintenance.\r\n\r\nMADE IN CANADA!\r\n\r\nSIZE:\r\n350 grams\r\n\r\nFEEDING GUIDELINES:\r\nWeight of Cat Amount of food per day\r\nkg Grams\r\n2-3 40-50\r\n3-4 50-65\r\n4-5 65-75\r\n5-6 75-85\r\n6+ 85 + 15 grams per 1 kilogram cat''s body weight\r\n\r\nAlways ensure adequate amount of fresh and clean water accessible to your pet at all times', 'cat', 'food', 'catfood_1stchoice.png', '22.90'),
(12, 'jon', 'MEOWING HEADS', 'Looking Good (Chicken)', 'This chicken complete cat food contains a whopping 60% chicken & fish, making the protein a make up of animal and fish protein specifically for the feline obligate carnivore.\r\n-Chicken and Fish proteins both extremely digestible and gentle on the digestive system.\r\n-Cranberry extract to help support and maintain urinary health.\r\n-Optimal omega 6 and 3 ratio for a healthy, radiant skin and coat.\r\n\r\nINGREDIENTS:\r\nBoneless Chicken*, Dried Chicken*, Rice, Dried Fish*, Dried Egg, Oats, Chicken Fat, Natural Flavours, Salmon Oil,  Dried Tomato, Seaweed, Vegetable Fibre, Dried Carrot, Dried Cranberries\r\n*total 60% Chicken & Fish combined\r\n\r\nMade in Great Britain!\r\n\r\nANALSIS:\r\nCrude Protein 35%, Fat Content 18%, Inorganic Matter 9%, Crude Fibres 2.75%, Moisture 7%, Omega 6 (2%), Omega 3(.8%)\r\n\r\nNutritional Additives (per kg):\r\nVitamins: Vitamin A 24,700 IU, Vitamin D3 1,680 IU, Vitamin E 320 IU\r\nTaurine 1000mg, Ferrous Sulphate Monohydrate 592mg, Zinc Sulphate Monohydrate 411mg, Manganous Sulphate Monohydrate 81mg, Cupric Sulphate Pentahydrate 30mg, Calcium Iodate Anhydrous 3.64mg, Sodium Selenite 0.41mg\r\n\r\nSIZE:\r\n2 kg\r\n\r\nFEEDING GUIDELINES:\r\nDaily suggested feeding amount\r\nWeight of cat (kg)    Grams per day\r\n2-3                       30-50\r\n4-5                       50-80\r\n6-7 kg + (or more)   60-90 g+', 'cat', 'food', 'catfood_meowingheads.png', '8.50'),
(13, 'jon', 'Wild', 'Natural Wood Swing', 'Bird toys series made with natural and safe wood.\r\nMade with bells to enchant your bird for hours. \r\n\r\nSize:\r\nW 165 X D 80 X H 300 mm', 'bird', 'toy', 'birdtoy_wild.png', '20.00'),
(14, 'pat', 'Pet Home', 'Parakeet Cage Round', 'Parakeet round cage with plastic base, a comfortable habitat for your new found feathered friend.This kit is equipped with perches, feeder and waterer.\r\n \r\nSize:\r\nDiameter 47 x L 70 cm', 'bird', 'cage', 'birdcage_pethome.png', '50.00'),
(15, 'pat', 'Versele Laga', 'Budgies', 'Multicoloured mixture for budgies and other small parakeets. \r\n\r\nVersele-Laga supports the Loro Parque FundaciÃ³n in its aim to preserve endangered bird species and their environment.\r\n\r\nIngredients:\r\nYellow millet 52%, Red millet 16%, White millet 12%, Peeled oats 9%, Canary seeds 5%, Linseed 3%, Safflower 2.5%, Niger Seeds 0.5%\r\n\r\nAnalysis: (approximate)\r\nCrude protein 15 % \r\nCrude fat 6 % \r\nCrude ash 6,5 % \r\nCrude fibre 6 % \r\n\r\nSize:\r\n1 kg\r\n\r\nFeeding Guideline:\r\nDepending on the type and age of the bird the daily ration of seeds may differ greatly. For that reason give a generous portion in the beginning and you can then define the ideal daily ration after a while. Refresh the food and drinking water daily.', 'bird', 'food', 'birdfood_verselelaga.png', '29.90'),
(16, 'jon', 'Supreem', 'Smart Selects Cockatiel', 'Smart Selects Premium Daily Nutrition for Cockatiels and Lovebirds provides healthy and balanced food for Cockatiels, Quaker Parakeets, Ringneck Parakeets, Lovebirds, Meyerâ€™s Parrots and other medium birds.\r\n\r\nIngredients:\r\nDehulled millet, Canary grass seeds, Oat groats, Ground corn, Safflower seeds, Soybean meal, Dried papaya, Dried pineapple, Dried coconut, Shelled squash seeds, Dried cranberries, Sugar, Dried cane molasses, Corn gluten meal, Flaxseeds, Calcium carbonate, Dicalcium phosphate, Ground wheat, Salt, Fructooligosaccharides, L-Lysine monohydrochloride, Wheat germ meal, Vegetable oil (preserved with mixed tocopherols), Choline chloride, DL-Methionine, Vitamins (Vitamin E supplement, Niacin, Calcium pantothenate, Vitamin A supplement, Biotin, Riboflavin, Pyridoxine hydrochloride, Thiamine mononitrate, Menadione sodium bisulfite complex (source of Vitamin K activity), Vitamin B12 supplement, Vitamin D3 supplement, Folic acid), Potassium chloride, Natural flavors, preserved with Citric acid and Mixed tocopherols, Minerals (Manganous oxide, Zinc oxide, Copper sulfate, Sodium selenite, Calcium iodate), L-ascorbyl-2-polyphosphate (a source of Vitamin C), Dried bananas, Dried oranges, Dried apples, Dried grapes, Yellow 6, Yellow 5, Blue 1, Red 40, Color added, Sulfur dioxide (preservative), Dried Bacillus licheniformis fermentation product, Dried Bacillus subtilis fermentation product, Rosemary extract\r\n\r\nAnalysis:\r\nCrude Protein (min.)	12.0%\r\nCrude Fat (min.)	8.0%\r\nCrude Fat (max.)	11.5%\r\nCrude Fiber (max.)	9.0%\r\nMoisture (max.)	12.0%\r\nSodium (min.)	0.12%\r\nSodium (max.)	0.22%\r\nZinc (min.)	50 mg/kg\r\nVitamin E (min.)	60 IU/kg\r\nPyridoxine (min.)	7.0 mg/kg\r\nTotal Omega 3 Fatty Acids (min.)	0.25%\r\nFructooligosaccharides (min.)	0.30%\r\n\r\n\r\nSize:\r\n2 lbs\r\n\r\nFeeding Guidelines:\r\n1. Shake bag before each feeding to thoroughly mix ingredients\r\n2. Feed free choice and assure your bird always has fresh food and water\r\n3. Adjust amounts to ensure your birdâ€™s optimum body condition â€“ most birds consume 20% of their weight daily\r\n4. Make this diet at least 80% of what your bird eats every day\r\n5. Vitamin and mineral supplements are not required and could be harmful\r\n6. Do not leave moistened food in the cup for more than 2 hours.', 'bird', 'food', 'birdfood_zupreem.png', '15.80'),
(17, 'jon', 'Four Paws', 'Bird Claws Clipper', 'Bird claw clipper, sharpened to cut gently your pet''s nail.\r\nEasy-to-use clipper features stainless steel cutting edge for effortless clipping. \r\nComfortable rubber grip for easy, hassle free nail clipping.', 'bird', 'grooming', 'birdgrooming_fourpaws.png', '19.90'),
(18, 'jon', 'Everyday', 'Turtle Pellets', 'Complete and balanced feed for turtles and terrapins.\r\n- Nutri''s pellets is easily digested.\r\n- Special formulated feed do not create foul smell in water.\r\n- Rich in vitamins complex and minerals to improve health and immune system in turtles and terrapins.\r\n- Improve shell structure in turtles and terrapins.\r\nIngredients:\r\nPremium fish meal, krill meal, soybean meal, wheat flour, yeast powder, fish oil, lecithin, Ca (H2PO4)2, vitamin A, vitamin D3, vitamin E, Vitamin K3, Vitamin B1, vitamin B2, Vitamin B6, Vitamin B12, Niacin, Calcium D panthotenate, folic acid, D-biotin, inositol. vitamin C, choline chloride, Cu SO4, MnSO4, ZnSO4, Fe SO4, Ca (IO3)2, CoCl2.\r\n\r\nAnalysis:\r\nCrude protein......>38%\r\nCrude Ash..........<12%\r\nCrude fiber.......<6%\r\nMoisture..........<10%\r\nLysine............>1.5%\r\nSalt..............0.5-3.5%\r\nCalcium...........1-3%\r\nVitamin A.........3,000 IU/kg\r\n\r\nSize:\r\n35 grams\r\nFeeding Guidelines:\r\nFeed 2-3 times per day\r\nFeeding amount depends on turtles and terrapins consumption within 5 minutes\r\nRemove all uneaten food, if any after after 30 minutes.', 'turtle', 'food', 'turtlefood_everday.png', '20.00'),
(19, 'mary', 'Hagen', ' Turtle Cliff (filter and rock)', 'The Exo Terra Turtle Cliff is a waterfall, basking area and filter in one.\r\n-Waterfall, basking area and filter in one \r\n-Integrates easily into any aquatic terrarium setup \r\n-Optimal hidden water filtration system \r\n-Provides the necessary water circulation and aeration \r\n-Ideal basking or terrestrial area for semi-aquatic animals \r\n\r\nIts state-of-the-art filtering system instantly transforms an aquatic terrarium setup into the ideal habitat while providing turtles and other semi-aquatic terrarium animals with the ideal basking or terrestrial area. The hidden filter provides clear, healthy water while the waterfall features creates the necessary water circulation and aeration, and its natural rock texture and colour allows it to integrate easily into any aquatic terrarium setup.\r\nThe Exo Terra Turtle Cliff is equiped with a Repti Clear Terrarium Filter, an optimal water filtration system with large filter volume and effective flow control.\r\n\r\nThe 3-stage filtration system allows alternate replacement for continuous biological filter activity, guaranteeing optimal mechanical, chemical and biological filtration.\r\n\r\nSize:\r\nMedium 23 X 17 X 19.5 cm', 'turtle', 'filter', 'turtlefilter_hagen.png', '39.90'),
(20, 'mary', 'MPS Italian', 'Comma', 'A comma shaped plastic swimming pond. A perfect amenity for turtles and other reptiles and semi aquatic pets. Made from top quality and durable materials.\r\n\r\nColor:\r\nBlue\r\n\r\nSize:\r\n40 x 27 x 10 cm', 'turtle', 'cage', 'turtlecage_mps.png', '12.00'),
(21, 'jelly', 'Chomper', 'Two-toned mouse', 'Cats enjoy it\r\n\r\n', 'cat', 'toy', 'cattoy_chomper.png', '3.90'),
(22, 'mary', 'TOM', 'Mangroove Swamp', 'Made from sturdy and durable material. \r\n-Ideal form tadpoles, crawfish, hermit crabs, small turtles and crabs.\r\n-With plastic and pet-safe decorations (coconut tree and pre-casted log) and elevated central platform.\r\n\r\nSize:\r\nApprox Length 48 cm X Depth 15 cm', 'turtle', 'cage', 'turtlecage_tom.png', '22.00');

-- --------------------------------------------------------

--
-- Table structure for table `pets`
--

CREATE TABLE IF NOT EXISTS `pets` (
  `pets` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pets`
--

INSERT INTO `pets` (`pets`) VALUES
('bird'),
('cat'),
('dog'),
('turtle');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `userid` varchar(50) NOT NULL,
  `password` varchar(12) NOT NULL,
  `name` varchar(80) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `dateofbirth` varchar(20) NOT NULL,
  `address` varchar(80) NOT NULL,
  `email` varchar(50) NOT NULL,
  `typesofpetsown` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userid`, `password`, `name`, `gender`, `dateofbirth`, `address`, `email`, `typesofpetsown`) VALUES
('jack', 'beanstalk', 'Jack Lee', 'Male', '12/12/1999', '1 Tampines Ave 2', 'jack@hotmail.com', 'dog'),
('jelly', 'bean', 'Jelly Bean', 'Male', '19/10/1987', '65 Bedok', 'jelly@hotmail.com', 'cat'),
('jon', 'sad', 'Jon Jerry', 'Male', '01/10/1997', 'Tampines Street 11 Block 110', 'jon@hotmail.com', 'bird, cat, turtle'),
('mary', 'lamb', 'Mary Tan', 'Female', '03/06/1989', '3 Bedok North Ave 10', 'mary@yahoo.com', 'dog, turtle'),
('pat', 'happy', 'Pat Lim', 'Male', '02/03/1995', '10 Simei Street 2', 'pat@gmail.com', 'bird, dog');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `items`
--
ALTER TABLE `items`
 ADD PRIMARY KEY (`itemid`);

--
-- Indexes for table `pets`
--
ALTER TABLE `pets`
 ADD PRIMARY KEY (`pets`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`userid`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
