-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 22, 2022 at 01:16 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dpmg_langsa`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2022_01_15_094453_create_news_table', 2),
(6, '2022_01_15_121321_create_posts_table', 3),
(7, '2022_01_17_161542_create_company_profiles_table', 4),
(8, '2022_01_17_161542_create_profiles_table', 5),
(9, '2022_01_18_132611_create_villages_table', 6),
(10, '2022_01_18_135351_create_villages_table', 7),
(11, '2022_01_18_135636_create_villages_table', 8);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('farhan@email.com', '$2y$10$zjV/bXKPpI67il6SxNEdWO5gt4634XrmrJsQ1EdkhUuC/azwc9dDu', '2022-01-13 03:42:37');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `slug`, `image`, `excerpt`, `body`, `created_at`, `updated_at`) VALUES
(5, 'Judul Berita Pertama', 'judul-berita-pertama', 'post-images/mNxF3eIZDtL7FeTSYdXi4zBPDnDQnfMj00ldhOSE.png', 'Quisque eget ligula sit amet sapien faucibus sodales. Proin at mauris orci. Morbi maximus lectus vitae enim commodo rutrum. Curabitur dignissim mauris a massa viverra, sit amet pretium arcu congue. Al...', '<div>Quisque eget ligula sit amet sapien faucibus sodales. Proin at mauris orci. Morbi maximus lectus vitae enim commodo rutrum. Curabitur dignissim mauris a massa viverra, sit amet pretium arcu congue. Aliquam erat volutpat. Curabitur rhoncus quam eget condimentum efficitur. Nunc tincidunt a ante in vestibulum. Proin eu pulvinar est. Praesent lectus nisi, tincidunt vel est vel, dignissim vulputate ipsum. Mauris eu quam leo. Donec at lacinia libero. Nullam feugiat dapibus nisl, sed tempor ligula volutpat non. Vivamus ac erat dignissim, dapibus orci sit amet, hendrerit augue. Donec sit amet tellus id erat vulputate pretium. Integer neque metus, tincidunt quis quam eget, ullamcorper venenatis metus. Quisque dignissim nunc egestas, cursus ex viverra, semper ipsum.<br><br></div><div>Duis nec tristique ligula. In hac habitasse platea dictumst. Nunc nisi nulla, vehicula vel interdum nec, auctor sodales sem. Nullam quam nibh, laoreet eu velit sed, sodales maximus leo. Duis accumsan a arcu quis consectetur. Ut eu neque libero. Nunc leo tortor, condimentum ac euismod id, convallis et quam. Pellentesque volutpat scelerisque nunc, ac ornare lacus. Suspendisse potenti. Phasellus posuere dignissim aliquet. Praesent arcu nisi, sollicitudin sit amet sollicitudin in, cursus non ante. Mauris tincidunt ultricies eros, ac sagittis risus convallis quis. Quisque pharetra maximus consequat. Ut id elit non leo convallis vehicula at porta est. Suspendisse risus augue, molestie tempus erat vestibulum, ornare venenatis lorem. Praesent congue interdum justo, sit amet ultrices ipsum efficitur a.<br><br></div><div>Integer congue at odio non tempor. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nam fermentum est sit amet convallis vulputate. Nunc sed eleifend orci. Etiam ac nulla at erat eleifend sodales quis eget nibh. Suspendisse commodo mauris in molestie feugiat. Integer ultricies dui velit, sit amet fermentum mauris vestibulum ut. Nunc vitae urna ac nisl pretium pretium. Etiam tempus commodo tortor ac convallis. Sed interdum, orci ut varius tincidunt, orci nibh consequat leo, in varius lorem velit in arcu. Etiam mollis nulla ac mi mollis aliquet. Nam venenatis pretium augue sit amet auctor.<br><br></div><div>Donec fermentum sem at egestas sodales. Praesent eu tempor neque. In ullamcorper dui lorem, vitae accumsan sapien sagittis at. Donec eget arcu vulputate, finibus mi at, pellentesque urna. Donec nec ex malesuada felis convallis volutpat quis at lectus. Nunc id lectus congue, laoreet felis vel, interdum diam. Aenean vel velit enim. Proin id nisl vitae lorem interdum viverra. Donec dolor urna, lacinia in nulla in, consequat mattis dui. Praesent sit amet nunc imperdiet elit gravida pellentesque.<br><br></div><div>Cras laoreet tortor nec orci mattis, in euismod nisi interdum. Aliquam vel maximus massa. Cras porttitor faucibus massa et fermentum. Morbi mauris ante, vehicula sed ultrices ut, aliquam iaculis justo. Sed mauris nulla, tempus sed elit ut, dapibus placerat nulla. Suspendisse at orci posuere, ornare ligula at, pharetra nibh. Nulla consectetur, mauris eu consectetur porttitor, elit neque semper urna, nec pretium arcu elit a nisl. Nullam lectus ante, consectetur eu consectetur eu, volutpat eget lacus. Etiam rutrum, turpis non volutpat vulputate, libero quam efficitur est, id fringilla ante mauris vel lectus. Pellentesque faucibus sed lectus a elementum. Aliquam cursus laoreet leo, eget consequat diam vehicula sit amet. Proin id arcu commodo, rhoncus nulla id, faucibus mauris. Curabitur ut maximus nisi.<br><br></div>', '2022-01-16 09:20:15', '2022-01-16 09:20:15'),
(6, 'Judul Berita Kedua', 'judul-berita-kedua', 'post-images/9Qa3McAdn5ORtT0F1S8c7fo2z7EKBSZk1OUsOXTB.png', 'Nam congue, orci sit amet elementum interdum, leo urna posuere metus, nec bibendum velit erat ac ex. Pellentesque finibus diam eget massa suscipit, sed sodales lectus porta. Cras non ullamcorper leo....', '<div>Nam congue, orci sit amet elementum interdum, leo urna posuere metus, nec bibendum velit erat ac ex. Pellentesque finibus diam eget massa suscipit, sed sodales lectus porta. Cras non ullamcorper leo. Donec eget orci gravida, dictum est a, pulvinar elit. Etiam lobortis velit dui, vitae hendrerit ligula placerat sit amet. Maecenas in orci sit amet nunc facilisis tincidunt. Curabitur ultrices euismod ex et fermentum. Nunc maximus ipsum orci, nec condimentum nulla scelerisque eget. In molestie est bibendum dolor facilisis, eu bibendum orci fringilla. Suspendisse viverra sem sed mauris convallis, non bibendum justo condimentum. Cras facilisis dictum lectus, fringilla sollicitudin orci laoreet vel. Ut neque nisl, molestie id metus sit amet, vehicula viverra ligula. Nunc sodales ligula quis tellus eleifend congue. Nunc sed cursus leo.<br><br></div><div>Nunc sagittis turpis mollis maximus congue. Aenean gravida dui et velit egestas accumsan. Maecenas nec metus malesuada, convallis elit et, posuere ante. Morbi libero neque, tincidunt vitae tortor eu, venenatis condimentum ligula. Curabitur enim tellus, malesuada eu leo vel, molestie ornare neque. Nunc molestie tortor eget tellus laoreet lobortis. Curabitur ornare, neque eget vestibulum semper, nibh augue convallis nunc, at pulvinar massa magna vel libero. Suspendisse potenti. Proin eget massa vel odio eleifend fringilla. Pellentesque eu sapien ut arcu convallis sodales. Nunc risus quam, sollicitudin eu ipsum non, finibus pulvinar magna. Suspendisse mattis ultricies odio, eu pharetra magna. Nulla convallis tempus mauris, sit amet aliquam purus vestibulum vel. Cras auctor eleifend massa quis molestie.<br><br></div><div>Fusce nec vulputate mauris. Aliquam eget leo sit amet nisl vehicula facilisis. Etiam ut eros nisl. In sed faucibus nisi. Cras libero ex, rutrum ut gravida eget, gravida ut massa. Sed consequat turpis at tempus bibendum. Suspendisse vel purus ex. Aenean nulla justo, aliquam ut tempus nec, vulputate et eros. Cras at maximus mauris, convallis pharetra risus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Duis venenatis dui sed ligula laoreet fringilla.<br><br></div><div>Mauris congue velit nec convallis blandit. Duis vitae bibendum nunc. Curabitur scelerisque lorem a dapibus feugiat. Sed bibendum eget arcu eu tempor. Duis finibus iaculis nibh, sit amet rhoncus massa iaculis varius. Nunc commodo ornare nulla ut porta. Donec tincidunt pharetra commodo. Cras vel eleifend risus, ac vulputate sem. Pellentesque viverra lobortis leo, rutrum sagittis nisi placerat congue.<br><br></div><div>Proin eu ligula vitae urna pharetra pharetra at vitae purus. Ut vestibulum libero orci, et blandit risus tincidunt eu. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec eget blandit turpis. Cras convallis, orci at iaculis fermentum, dolor mauris malesuada lorem, a interdum odio nisl et urna. Proin pellentesque ligula mollis pharetra vulputate. Pellentesque vel odio tempor, tempus orci eu, faucibus nisi. Nullam volutpat orci elementum metus pellentesque, et tincidunt augue hendrerit. Suspendisse fermentum lacus leo, vel sodales leo lobortis nec. Etiam tempus leo nisl, vel hendrerit tellus posuere eget. Integer molestie tempus libero a facilisis. Aliquam risus massa, sollicitudin et ante ac, tristique mattis lectus. Duis vitae consectetur dui. Sed pulvinar tristique nibh sed porta. Integer nisl augue, vestibulum vel pretium non, sollicitudin nec justo. Quisque lacinia enim a purus vulputate sollicitudin.<br><br></div>', '2022-01-16 09:20:55', '2022-01-16 09:20:55'),
(7, 'Judul Berita Ketiga', 'judul-berita-ketiga', 'post-images/uwoPkKcEtuAQaZh6Twl7O8m4kXHTsFwmdVNeuNIn.png', 'Nullam arcu est, vestibulum non dictum vel, convallis eu nulla. In urna risus, laoreet at laoreet non, feugiat quis erat. In tincidunt fermentum sem vel tincidunt. Mauris maximus facilisis feugiat. In...', '<div>Nullam arcu est, vestibulum non dictum vel, convallis eu nulla. In urna risus, laoreet at laoreet non, feugiat quis erat. In tincidunt fermentum sem vel tincidunt. Mauris maximus facilisis feugiat. In arcu felis, volutpat fermentum convallis porttitor, dapibus id purus. Ut viverra quis metus eu feugiat. Mauris mollis lorem sit amet venenatis tincidunt. Nam et pharetra odio. Cras mattis mauris id metus ultrices, quis tristique velit euismod. Integer tincidunt justo quis gravida hendrerit. Aenean cursus est sit amet libero mattis maximus. Sed sed purus ac odio condimentum fermentum. Vestibulum vulputate justo id eleifend molestie.<br><br></div><div>Ut nec volutpat leo, ac auctor ante. Donec et cursus ante, ut sodales felis. Maecenas accumsan nunc id vehicula tincidunt. In hac habitasse platea dictumst. Etiam mollis porta nibh. Integer a blandit augue. Proin eu nunc laoreet, rhoncus lorem et, rhoncus est.<br><br></div><div>In purus tellus, egestas sed ornare finibus, sollicitudin a augue. Mauris congue massa a est mollis, sit amet suscipit orci consequat. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Aliquam erat volutpat. Sed nec risus luctus, euismod felis id, blandit justo. Quisque ac sollicitudin nunc. Suspendisse potenti. Donec leo neque, commodo vel diam dapibus, pretium porta tellus. Aenean in arcu sit amet turpis porttitor molestie nec eget est. Nunc convallis nisl vel est facilisis porttitor. Quisque nibh leo, egestas id interdum id, fringilla at quam. Praesent faucibus vestibulum aliquam. In pretium felis quis dolor maximus, id sagittis lorem suscipit. Proin in dui in dolor tristique porttitor et at elit. Nam placerat augue ex, convallis volutpat dui fermentum a.<br><br></div><div>Mauris viverra sollicitudin nulla elementum vehicula. Maecenas dignissim dui nec mauris placerat porttitor. Phasellus eget malesuada ante. Sed vestibulum bibendum ipsum, pharetra ultricies velit rhoncus ac. Maecenas ultrices nunc vel risus bibendum, nec pulvinar nisl blandit. Vestibulum aliquet sed augue vel sagittis. Proin rhoncus rhoncus dolor vitae accumsan. Maecenas dictum erat sit amet condimentum facilisis. Sed ornare aliquam varius. Suspendisse nisl metus, imperdiet et commodo vel, vehicula mollis ante. Sed accumsan consectetur egestas. Nulla id felis ligula. Phasellus sem mauris, ultricies ut rhoncus in, consequat eget lacus.<br><br></div><div>Ut sagittis eros vel ante consequat vehicula et et ligula. In eu augue eget ante luctus viverra. Nulla venenatis nulla a nisi pellentesque rutrum. Aliquam semper lectus ullamcorper, cursus libero ut, lacinia sapien. Vivamus sit amet massa consectetur, fermentum ex mollis, vestibulum nulla. Morbi auctor purus accumsan feugiat viverra. Aenean ac rhoncus ex. Vivamus convallis convallis tincidunt. In vel venenatis diam. Fusce blandit diam non erat volutpat mattis. Ut tincidunt sapien in massa maximus pellentesque ac at lectus. Nam eu massa at lectus aliquam rutrum ac sit amet neque. Maecenas at viverra magna. Aliquam erat volutpat. Fusce id sem suscipit metus porta egestas in iaculis nulla.<br><br></div>', '2022-01-16 09:21:26', '2022-01-16 09:21:26'),
(8, 'Judul Berita Keempat', 'judul-berita-keempat', 'post-images/Z95DbFZ84xSwwlbIUMwiLXvunycMGwxU5wMhMFcp.png', 'Ut non iaculis magna, eget lacinia arcu. Donec et mauris non felis tristique gravida a ac sapien. Phasellus faucibus, tellus eu interdum lobortis, nibh sapien ultrices nisi, in posuere erat ipsum in a...', '<div>Ut non iaculis magna, eget lacinia arcu. Donec et mauris non felis tristique gravida a ac sapien. Phasellus faucibus, tellus eu interdum lobortis, nibh sapien ultrices nisi, in posuere erat ipsum in augue. Cras aliquet non ex eu luctus. Sed semper nibh mauris, ac viverra tellus auctor sit amet. Aliquam eget luctus sapien. Vestibulum luctus ex in libero varius, nec dictum ante accumsan.<br><br></div><div>Donec at mi in elit eleifend feugiat. Nulla a diam elit. In et nulla ac mi suscipit cursus. In maximus viverra commodo. Proin gravida pulvinar ligula, sed mollis mi ultrices eu. Praesent at nibh quis ante ornare aliquet id at justo. Etiam fringilla eros orci, vitae pretium diam sodales sit amet.<br><br></div><div>Maecenas dapibus felis sit amet maximus maximus. Integer aliquet tincidunt viverra. Nullam varius dui id ante tincidunt, et interdum est venenatis. Aenean luctus tincidunt nisl quis luctus. Vestibulum vel rhoncus ligula. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Sed eleifend lectus eget mauris aliquam tristique. Sed viverra et massa et ornare. Suspendisse nec convallis urna, ac sagittis ipsum. Nam et luctus orci. Nulla magna tortor, gravida non feugiat vitae, dictum eu nisi.<br><br></div><div>Curabitur cursus ullamcorper ligula, nec elementum massa porta nec. Etiam iaculis ante vel scelerisque consequat. Vestibulum non dapibus dolor. Nullam venenatis sagittis arcu, in accumsan ipsum fringilla nec. Pellentesque commodo vestibulum dui ut dictum. Sed pellentesque arcu sit amet metus aliquet, non placerat massa placerat. Quisque blandit, diam ac aliquam fermentum, lacus turpis auctor leo, sed molestie nunc est ac est. Nulla facilisi. Pellentesque turpis felis, luctus sed elementum a, hendrerit vel ipsum. Vivamus velit nibh, dignissim nec fringilla et, scelerisque nec lectus. Maecenas vehicula ultricies felis, efficitur sodales orci bibendum auctor. Nam sit amet ipsum urna. Quisque eu odio felis.<br><br></div><div>Pellentesque non tellus sed metus viverra dapibus. Duis volutpat nunc est, vestibulum pulvinar turpis euismod id. Sed vestibulum sit amet purus eget pretium. Praesent semper ut justo vitae porttitor. Integer sem lacus, tristique eget venenatis at, commodo eu lacus. Pellentesque scelerisque porta sem, id aliquam dui ultrices nec. Proin laoreet, orci a gravida malesuada, lorem turpis ullamcorper erat, sit amet elementum felis felis hendrerit diam. In eget ligula non ipsum fermentum tristique sed sit amet lacus. Mauris est libero, venenatis eget sollicitudin at, viverra a est. Vivamus a eleifend ligula. Maecenas ex dolor, feugiat at gravida at, mollis sed felis. In augue elit, fringilla vitae nisl eu, scelerisque pretium purus. Etiam ornare nibh mi, sed laoreet dolor molestie et. Praesent maximus mauris malesuada mattis tempor. Aenean non pharetra urna. Curabitur purus ante, placerat in elementum vitae, tristique ac sem.<br><br></div>', '2022-01-16 10:11:56', '2022-01-16 10:11:56'),
(9, 'Judul Berita Kelima', 'judul-berita-kelima', 'post-images/rLWYW74xsp6ZPH9Dbex0ZkLqhbMfgwbUZnPqhXQY.png', 'Ut tincidunt pretium volutpat. Morbi faucibus cursus lectus, pulvinar molestie risus rhoncus quis. Vivamus finibus lacus et leo bibendum commodo. In euismod mi est, non tempus elit auctor quis. Donec...', '<div>Ut tincidunt pretium volutpat. Morbi faucibus cursus lectus, pulvinar molestie risus rhoncus quis. Vivamus finibus lacus et leo bibendum commodo. In euismod mi est, non tempus elit auctor quis. Donec congue gravida erat, sit amet tincidunt nibh interdum ac. Nunc blandit neque non risus fringilla pharetra ac sit amet arcu. In sagittis, mi in ultrices commodo, libero lorem tincidunt eros, sed rhoncus augue felis id quam. Duis ligula neque, placerat eget metus et, pharetra molestie nunc. Pellentesque vitae tellus risus. Maecenas efficitur mauris eget risus convallis posuere. Cras tincidunt elementum orci vel semper. Phasellus auctor dui suscipit sem facilisis luctus quis vel ipsum. Donec eu arcu purus. Suspendisse augue est, auctor in tempor at, lobortis et lorem.<br><br></div><div>Suspendisse fringilla bibendum nisi, sit amet ornare leo volutpat eu. Nunc ullamcorper libero dapibus, maximus massa eget, egestas dui. Nam vitae tortor ut lacus semper accumsan in eget turpis. Nunc egestas aliquam massa nec vestibulum. Duis sodales turpis et lectus rhoncus egestas. Aenean cursus semper pharetra. Phasellus sit amet metus et justo tristique luctus in et eros. Sed ornare efficitur purus, at accumsan justo tincidunt at. Interdum et malesuada fames ac ante ipsum primis in faucibus.<br><br></div><div>Ut vel dui consectetur mauris auctor tempus non eu nisi. Integer id turpis leo. Aenean sit amet dignissim diam. Vestibulum eleifend tellus eu leo ultrices rhoncus. In at fringilla sapien. Mauris sodales cursus molestie. Aliquam in nibh bibendum, suscipit metus id, varius est. Sed quis felis tellus. Nulla facilisi. Donec nec sem sit amet tellus sollicitudin luctus. Suspendisse dolor ante, dapibus in libero ut, tincidunt ultricies enim. Maecenas nec bibendum justo, ut maximus lorem. Ut eros felis, placerat nec molestie vel, sollicitudin eu sem.<br><br></div><div>Nam euismod ut neque id mattis. Cras vestibulum auctor consectetur. Duis ut lacus leo. Suspendisse dignissim fringilla nulla at rutrum. Vivamus vitae congue enim. Praesent diam enim, vehicula vel ante ut, imperdiet fermentum sapien. Proin euismod nunc ut nulla imperdiet pretium. Sed sed commodo nisi. Integer lacus mauris, tincidunt in leo vitae, congue elementum ante. Quisque efficitur aliquet dolor sit amet vulputate. Donec interdum enim volutpat, convallis nulla eget, commodo neque. Cras fermentum nibh nec diam fermentum, a faucibus leo laoreet. Duis est lectus, semper ac magna a, facilisis ultrices tellus.<br><br></div><div>Donec varius dignissim nunc. Aenean ultricies mi ac enim condimentum semper. Aliquam eget luctus massa. Nulla consectetur, tellus a eleifend sagittis, nulla mauris mollis nulla, id rhoncus sapien odio sed lectus. Donec eget urna turpis. Ut sit amet ligula odio. Aenean ac feugiat erat, non rhoncus lorem. Maecenas vitae turpis tellus. Vestibulum sodales risus a massa congue aliquet a ut libero. Integer pulvinar urna id eros facilisis bibendum. Proin dictum cursus justo, a feugiat dolor pellentesque ac. Aliquam elementum nibh sed venenatis interdum. Nulla iaculis, leo aliquet aliquam interdum, risus tellus lobortis lorem, eget porta mi erat pharetra enim. Nullam mattis eu nunc eget sollicitudin.<br><br></div>', '2022-01-16 10:12:29', '2022-01-16 10:12:29'),
(10, 'Judul Berita Keenam', 'judul-berita-keenam', 'post-images/Eps2jxSshK9ffD1C1keATILWwIjn9Ui7LW15AQmv.png', 'Praesent eget semper tortor, vel porta magna. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Curabitur placerat dolor mi, id facilisis odio iaculis sed. Phasel...', '<div>Praesent eget semper tortor, vel porta magna. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Curabitur placerat dolor mi, id facilisis odio iaculis sed. Phasellus imperdiet fringilla viverra. Duis efficitur libero id rutrum elementum. Ut at tristique mauris, ac eleifend enim. Suspendisse potenti. Praesent eu justo elit. Phasellus auctor sed odio ut vulputate. Nullam vestibulum et dui id dictum. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nam sagittis laoreet diam, lobortis tempus enim placerat eget. Fusce nec lacinia dolor, eget volutpat lectus. Donec blandit et tellus ac euismod.<br><br></div><div>Suspendisse ut massa vitae elit maximus volutpat eget sed turpis. Donec cursus venenatis massa vitae fringilla. Vivamus eu enim faucibus, malesuada ligula eget, dapibus mi. Suspendisse eleifend quam vel sodales bibendum. Pellentesque sit amet eros sem. Donec ut fermentum magna. Proin diam neque, sollicitudin id bibendum et, vestibulum ut metus. Nullam ut fringilla elit. Quisque turpis turpis, congue sed imperdiet in, condimentum quis arcu. Nunc volutpat elit magna, id facilisis mauris gravida sit amet. Donec vel ultrices nulla, vel mollis justo. Nullam quis dui sit amet nulla pulvinar varius volutpat sit amet urna.<br><br></div><div>Vivamus in commodo dui. Vivamus ornare nisi ac orci cursus, quis dapibus massa aliquam. Suspendisse vitae nisi ac purus convallis maximus. Cras faucibus at lectus at tempor. Aliquam lobortis rhoncus magna at aliquet. In enim nisl, facilisis vel lacinia non, efficitur vel sapien. Integer nibh est, aliquam eget gravida nec, gravida sed libero. Nulla commodo pharetra lorem quis finibus. Nullam est quam, tempus dapibus fringilla vitae, dignissim quis enim. Quisque eget lacinia nisi, facilisis sodales metus. Sed metus elit, maximus maximus viverra quis, dapibus et purus.<br><br></div><div>Donec sagittis urna in velit fermentum consectetur. Sed vulputate lacus odio, at porta justo hendrerit id. Phasellus ac urna porta, faucibus ex nec, mollis orci. Proin tincidunt justo vitae augue dignissim lobortis. Integer dapibus porta magna, ut consectetur enim gravida a. Nunc dapibus faucibus condimentum. Etiam imperdiet arcu vitae lobortis consectetur. Cras pellentesque ac erat nec pulvinar. Sed et nibh non elit commodo vestibulum. Ut iaculis dui nec nibh ullamcorper semper. Sed vestibulum imperdiet ipsum, vel dictum quam tincidunt id. Sed imperdiet sagittis ligula, vel malesuada arcu auctor in. Nullam aliquet massa in placerat pretium. Phasellus pretium nibh sed nisl malesuada pulvinar.<br><br></div><div>Suspendisse potenti. Aliquam sodales, enim in ultrices gravida, dui dolor porttitor arcu, et tincidunt lacus arcu eu nulla. Ut bibendum tempor massa vel bibendum. Praesent eleifend ligula non risus sagittis mollis. Vivamus interdum eros fermentum mauris posuere, nec tristique dui accumsan. Aliquam porta purus a erat mattis, sed interdum arcu tincidunt. Nam vestibulum imperdiet lorem, bibendum consectetur enim bibendum in. Donec consectetur sem ac venenatis venenatis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. In mollis auctor lacinia. Vestibulum suscipit lectus metus, id malesuada augue pretium in.<br><br></div>', '2022-01-16 10:13:04', '2022-01-16 10:13:04'),
(11, 'Judul Berita Ketujuh', 'judul-berita-ketujuh', 'post-images/rfmIqOqsQA2nLG6znf2x0wgcFSQzVoiuUBN0LBrr.png', 'Vestibulum dictum est eget lectus tincidunt suscipit. Pellentesque sit amet posuere urna, at mollis quam. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Vi...', '<div>Vestibulum dictum est eget lectus tincidunt suscipit. Pellentesque sit amet posuere urna, at mollis quam. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Vivamus congue nulla a sem tincidunt volutpat. Aliquam massa dolor, pharetra eget ex eu, blandit scelerisque justo. Aliquam non felis vitae tortor auctor maximus. Vestibulum eget urna vel odio pellentesque accumsan nec cursus dolor. Curabitur iaculis faucibus sapien non fringilla. Ut ullamcorper auctor erat, in porta augue finibus sit amet. Nunc ultricies libero id eros convallis, a aliquet dui sagittis. Nulla ac nulla quam. Etiam enim nibh, cursus et felis id, consectetur fermentum libero.<br><br></div><div>Duis at sem tincidunt, porta massa in, fringilla augue. Donec non purus ut purus imperdiet dignissim. Ut semper pellentesque nisi a lobortis. Mauris molestie nisi vel diam finibus accumsan eget et nunc. Etiam lacinia finibus nunc in fringilla. Curabitur ullamcorper ex ut aliquet eleifend. Ut eget ultricies ipsum, at vestibulum turpis. Aenean dignissim dolor sed risus sagittis, quis tempus tellus tempus. Fusce arcu lacus, ultrices sit amet convallis ullamcorper, egestas nec ex. Morbi euismod sem eu massa sollicitudin fringilla. Aliquam consectetur massa ligula, vitae luctus nibh rhoncus eu. Maecenas ultrices venenatis dui vel rutrum. Nam a elit nulla. Mauris posuere pellentesque dolor, ac ornare justo congue vitae. Sed malesuada mollis ante, at pretium arcu placerat eget. Ut vel iaculis ex.<br><br></div><div>Etiam dignissim luctus consectetur. Duis scelerisque erat eu ipsum placerat, vel luctus nunc tempus. Etiam scelerisque libero ut ultricies ullamcorper. Mauris posuere augue in nisl malesuada, in rhoncus elit imperdiet. Praesent semper rutrum elit, eget lacinia nisi. Maecenas nec odio tincidunt, laoreet metus vitae, fermentum libero. Fusce viverra lobortis neque, id rhoncus nibh ultricies id. Pellentesque fringilla fringilla augue a egestas. Cras ac leo eget erat ultricies egestas eget ac lectus. Maecenas a porta felis.<br><br></div><div>Duis a scelerisque est, eu porta enim. In vehicula dolor efficitur scelerisque gravida. Curabitur fermentum sodales commodo. Nulla facilisi. Maecenas a justo eros. Etiam eget tortor et felis dapibus ornare. Aliquam egestas ipsum ipsum, vel pretium neque efficitur at. Sed ultrices massa in est porttitor maximus. Quisque felis purus, pellentesque ut porttitor sit amet, imperdiet sit amet est. Ut ut hendrerit massa. Sed nulla quam, molestie in sodales non, suscipit sed metus. Sed hendrerit semper orci non faucibus.<br><br></div><div>Quisque nec ligula quis nisl malesuada cursus eu at ante. Morbi egestas rhoncus urna vitae dignissim. Etiam gravida ultricies libero quis porttitor. Morbi fringilla ante nulla, finibus finibus velit dignissim eu. Donec dignissim vestibulum purus dapibus aliquam. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aliquam at quam maximus, porta risus vitae, volutpat massa. Mauris tempus justo at hendrerit faucibus. Curabitur tincidunt sagittis porta. Nulla pretium urna at sem rhoncus commodo. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nulla nisi eros, convallis a dui a, aliquet egestas nulla. Cras molestie iaculis tempus.<br><br></div>', '2022-01-16 10:13:36', '2022-01-16 10:13:36'),
(12, 'Judul Berita Kedelapan', 'judul-berita-kedelapan', 'post-images/LfFcgYgyMXuMWAOPYx0JmnNYVvViameRmUA9QXCF.png', 'Proin rhoncus metus porttitor orci interdum gravida. Praesent porttitor ante sem, bibendum fermentum turpis aliquam vitae. Nunc gravida quis leo nec interdum. Morbi ut erat et quam placerat efficitur...', '<div>Proin rhoncus metus porttitor orci interdum gravida. Praesent porttitor ante sem, bibendum fermentum turpis aliquam vitae. Nunc gravida quis leo nec interdum. Morbi ut erat et quam placerat efficitur sed a justo. Nulla scelerisque volutpat erat quis sagittis. Etiam tristique nisi in lectus finibus aliquet. Fusce lobortis ut quam id hendrerit. Donec imperdiet non tellus sit amet malesuada. Integer vestibulum dolor lorem, vel venenatis mi pretium efficitur. Suspendisse potenti. Duis posuere sodales maximus. Donec bibendum urna eu dui fringilla dictum. Mauris venenatis augue sit amet quam mattis, vel dapibus ligula faucibus. Vestibulum condimentum urna commodo erat lobortis convallis vitae sagittis libero. Aliquam mattis sit amet tellus at aliquam.<br><br></div><div>Pellentesque sit amet orci in nibh pellentesque congue vitae nec purus. Mauris efficitur est non nisi posuere pretium. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut eu erat et lorem blandit suscipit. Aliquam consectetur malesuada erat congue efficitur. Suspendisse potenti. Cras convallis nulla ac dui pulvinar, eu varius ante auctor. Morbi mollis accumsan pharetra. Donec ut orci et est pretium tempor. Morbi consectetur orci augue, ornare sagittis diam porttitor sit amet. Cras nec sem et nisl mollis luctus eget sed mi. Sed vel egestas felis. Nam pulvinar porta faucibus.<br><br></div><div>Pellentesque non mattis dui. Integer eu consectetur est. Aenean convallis et nunc eu tempus. Maecenas sit amet arcu bibendum, ullamcorper sem ac, gravida ligula. Nulla at sagittis diam, sit amet sodales tortor. Fusce tincidunt pulvinar tristique. Donec ex augue, tempus ac tellus lobortis, venenatis finibus erat. Integer quis felis non nisi fermentum hendrerit. Morbi pretium purus tincidunt eros vehicula, id aliquet velit maximus. Praesent sit amet nisi sed sem rhoncus dignissim vel vitae turpis. Nulla dapibus libero at sollicitudin ultricies.<br><br></div><div>Nulla aliquet quis neque consectetur mattis. Donec vel varius libero. Vestibulum scelerisque enim vulputate suscipit consectetur. Pellentesque aliquam accumsan arcu, sed rutrum tellus. Sed porttitor id dolor vel faucibus. Aenean vulputate dapibus erat, ac tristique ipsum. Mauris pretium varius leo ac blandit. Quisque commodo lacus at tellus accumsan lacinia. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. In non ultricies sapien. Phasellus pharetra egestas augue, eget condimentum leo accumsan a.<br><br></div><div>Morbi dapibus est sit amet accumsan gravida. Fusce eget orci consequat est mattis ullamcorper. Cras nisi elit, blandit vel enim eu, lacinia ultricies dolor. Sed molestie tortor non ipsum dapibus placerat. Nulla libero metus, aliquam quis orci eget, fermentum tincidunt lacus. Pellentesque tellus nulla, pretium faucibus ullamcorper ut, elementum vitae augue. Integer sed tristique ligula, eget pharetra purus.<br><br></div>', '2022-01-16 10:14:07', '2022-01-16 10:14:07'),
(13, 'DPMG Sosialisasi SIG', 'dpmg-sosialisasi-sig', 'post-images/SlwxdD7UI8CHJk5Ar6RpGcZCiU6zPj91GULgWqou.jpg', 'Langsa – Dinas Pemberdayaan Masyarakat Gampong (DPMG) Provinsi Aceh bekerjasama dengan DPMG Langsa, gelar sosialisasi pengelolaan sistem informasi gampong (SIG) di Aula Setdako Langsa, Kamis (6/9).Sos...', '<div>Langsa – Dinas Pemberdayaan Masyarakat Gampong (DPMG) Provinsi Aceh bekerjasama dengan DPMG Langsa, gelar sosialisasi pengelolaan sistem informasi gampong (SIG) di Aula Setdako Langsa, Kamis (6/9).<br><br></div><div>Sosialisasi ini dihadiri oleh aparatur pemerintah gampong (desa) yakni keuchik dalam wilayah Pemko Langsa dan dinas terkait.<br><br></div><div>Walikota Langsa, Usman Abdullah, SE dalam sambutannya yang dibacakan oleh Plt Kepala DPMG Langsa, Azmi, mengatakan, kemampuan desa untuk mengelola pembangunan lebih mandiri yang didukung oleh semua unsur dan sumber daya desa yang sangat penting bagi perbaikan kesejahteraan masyarakat miskin di desa.<br><br></div><div>Karena desa yang dapat menjalankan pengelolaan pembangunan secara mandiri bukan hanya mampu menggerakkan seluruh aset sumber daya yang dimiliki desa, tapi juga akan mampu memperbaiki kebutuhan dasar warga kebutuhan kehidupan memperjuangkan hak warga dan menata kehidupan secara berkelanjutan.<br><br>Langsa – Dinas Pemberdayaan Masyarakat Gampong (DPMG) Provinsi Aceh bekerjasama dengan DPMG Langsa, gelar sosialisasi pengelolaan sistem informasi gampong (SIG) di Aula Setdako Langsa, Kamis (6/9).<br><br></div><div>Sosialisasi ini dihadiri oleh aparatur pemerintah gampong (desa) yakni keuchik dalam wilayah Pemko Langsa dan dinas terkait.<br><br></div><div>Walikota Langsa, Usman Abdullah, SE dalam sambutannya yang dibacakan oleh Plt Kepala DPMG Langsa, Azmi, mengatakan, kemampuan desa untuk mengelola pembangunan lebih mandiri yang didukung oleh semua unsur dan sumber daya desa yang sangat penting bagi perbaikan kesejahteraan masyarakat miskin di desa.<br><br></div><div>Karena desa yang dapat menjalankan pengelolaan pembangunan secara mandiri bukan hanya mampu menggerakkan seluruh aset sumber daya yang dimiliki desa, tapi juga akan mampu memperbaiki kebutuhan dasar warga kebutuhan kehidupan memperjuangkan hak warga dan menata kehidupan secara berkelanjutan.<br><br></div>', '2022-01-20 19:30:28', '2022-01-20 19:30:28'),
(14, 'DPMG Langsa Percepat Penyaluran Dana Desa Tahap III', 'dpmg-langsa-percepat-penyaluran-dana-desa-tahap-iii', 'post-images/Fh5kTQI0PVakOLDq7HmT52urgLT66LIIbRf40P9r.jpg', '“Kami melaksanakan proses percepatan penyaluran Dana Desa (DD) tahap III dan adanya pelaksanaan rekonsilidasi data komulatif sisa dana desa tahun 2015 s/d 2019 yang sudah berjalan dari bulan Oktober s...', '<div><br>“Kami melaksanakan proses percepatan penyaluran Dana Desa (DD) tahap III dan adanya pelaksanaan rekonsilidasi data komulatif sisa dana desa tahun 2015 s/d 2019 yang sudah berjalan dari bulan Oktober sampai dengan saat ini,” ungkap Al-Azmi.<br><br></div><div><br>Menurutnya, hal ini dilakukan sesuai dengan Peraturan Menteri Keuangan 110.101/PMK 07/2020 tentang penyaluran dana desa dan penggunaan transfer ke daerah dari dana desa tahun 2020 dan Surat Gubernur Aceh No. 414.25/15847 tentang percepatan rekonsilidasi dan penyetoran sisa dana desa tahun 2015 s/d 2019 dan percepatan penyaluran dana desa tahun 2020.<br><br></div><div><br>Perlu diketahui, Al-Azmi katakan, bahwa untuk menghindari pemotongan Dana Alokasi Umum (DAU) dan Dana Bagi Hasil (DBH) tahun 2021 sebagai bentuk sangsi pemerintah terhadap Pemko Langsa yang tidak melakukan penyetoran sisa dana desa tahun 2015 s/d 2019 pada akhir bulan Desember 2020, maka untuk mengetahui sisa penggunaan dana desa dari tahun 2015 s/d 2019 di setiap gampong di Kota Langsa dapat diketahui dari hasil rekonsilidasi sisa dana desa yang sedang dilaksanakan sampai dengan akhir bulan November 2020.<br><br></div><div><br>Serta untuk diketahui bersama bahwa Dana Desa dan APBK, dana yang bersumber dari APBK berasal dari Dana Alokasi Umum (DAU) dan Dana Bagi Hasil( DBH) Pemko Langsa yang diterima dari Pemerintah Pusat yang selanjutnya dialokasikan untuk dana desa bersumber APBK sesuai persentase yang telah ditetapkan dalam Peraturan Menteri Keuangan RI.<br><br></div><div><br>Sehingga sangat berpengaruh terhadap pelaksanaan hasil rekonsilidasi sisa dana desa tersebut yang berpengaruh terhadap jumlah Penerimaan Dana Alokasi Umum (DAU) dan Dana Bagi Hasil (DBH) Kota Langsa tahun 2021 dan juga penerimaan dana desa sumber APBK tahun 2021 di setiap gampong dalam wilayah Kota Langsa.<br><br></div><div><br>“Rekonsilidasi sisa dana desa ini juga mempengaruhi terhadap proses percepatan sisa penyaluran Dana Desa Tahap III (20%) tahun 2020 bagi setiap gampong karena didalam persyaratan dan petunjuk teknis penyaluran dana desa secara aplikasi OMSPAN dan SISKEUDES tertuang permintaan database terkait sisa Dana Desa tahun 2015 s/d 2019 yang harus diinput dalam aplikasi tersebut,” tegas Al-Azmi, Kadis DPMG Langsa.<br><br></div><div><br>Selanjutnya akan disampaikan oleh Wali Kota Langsa ke Kantor KPPN untuk disalurkan sisa Dana Desa Tahap III (20%) di setiap gampong dalam wilayah Kota Langsa.<br><br></div><div><br>Wali Kota Langsa melalui Dinas DPMG, BPKD, Camat dan P3MD Kota Langsa (Pendamping Desa) Kota Langsa, telah melaksanakan langkah-langkah percepatan Rekonsilidasi sisa Dana Desa tahun 2015 s/d 2019 dan penyaluran Dana Desa Tahap III (20 %) di Kota Langsa dan berdasarakan data DPMG Provinsi Aceh, Kota Langsa termasuk 10 Kabupaten/Kota dari 23 Kabupaten/Kota se-Aceh yang sudah pencairan Dana Desa Tahap III tahun 2020 sebanyak 21 Gampong di Kota Langsa.<br><br></div><div><br>“Per tanggal 13 November 2020, dari gampong yang sudah selesai melaksanakan Rekonsilidasi Dana Desa tahun 2015 s/d 2019 sebanyak 56 Gampong dan sudah dilanjutkan Proses Pencairan ke kantor KPPN Langsa,” ucapnya.<br><br></div><div><br>Sejauh ini masih ada gampong yang belum selesai rekonsilidasi sisa dana desa sebanyak 10 gampong yaitu, Gp. PB. Beuramoe, GP. Sungai Pauh Tanjong, Gp. Serambi Indah, Gp. Lhokbanie, Gp. Blang Pase, Gp. Blang Seunibong, Gp. Peukan Langsa, Gp. Jawa, Gp. Batee Puteh dan Gp.Sungai Lueng sedang dalam proses rekonsilidasi.<br><br></div><div><br>Adapun kendala gampong dalam penyelesaian rekonsilidasi ini karena proses pengumpulan data realisasi terkait pengelolaan dana desa dari tahun 2015 s/d 2019 yang bersumber dari APBN maupun APBK Kota Langsa, sehingga membutuhkan waktu dan ketelitian dalam penginputan data tersebut, dan gampong yang sudah menerima pencairan Dana Desa Tahap III (20 %) tahun 2020 untuk dapat menyegerakan penyaluran BLT DD kepada keluarga penerima manfaat.<br><br></div><div><br>“Wali Kota Langsa melalui Kadis DPMG Kota Langsa mengapresiasikan dan terimakasih kepada 56 gampong yang telah menyelesaikan rekonsilidasi sisa dana desa tahun 2015 s/d 2019, dan kepada 10 gampong yang sedang melaksanakan rekonsilidasi sisa dana desa dan diharapkan kepada pemerintah gampong untuk terus berupaya menyelesaikannya, agar dana desa tahap III tahun 2020 dapat segera disalurkan dan dimanfaatkan sesuai program gampong masing-masing dalam wilayah Kota Langsa,” pungkasnya.<br><br></div>', '2022-01-20 19:32:38', '2022-01-20 19:32:38'),
(15, 'Dana Desa Mulai Dicarirkan', 'dana-desa-mulai-dicarirkan', 'post-images/Pqc2cMY5bHSqAltpGa7Wi7YGp9uV2JZp3JK4KbNl.jpg', 'Target pencairan dana desa taha I pada Januari 2020 akhirnya berhasil di capai, meskipun belum terlalu signifikan. Kementrian Keuangan (Kemenkeu) melelui Kantor Wilayah Direktorat Jendral Perbendahara...', '<div>Target pencairan dana desa taha I pada Januari 2020 akhirnya berhasil di capai, meskipun belum terlalu signifikan. Kementrian Keuangan (Kemenkeu) melelui Kantor Wilayah Direktorat Jendral Perbendaharaan (DJPBN) Provinsi Aceh, hingga kamis (30/1/2020) telah mentransfer dana desa kepada 20 gampong dari tiga Kabupaten/Kota di Aceh.<br><br>“Alhamdulillah meski belum terlalu signifikan, tetapi sudah 20 gampong yang telah mencairkan dana desa tahap I. Sembilan gampong di Kabupaten Aceh Tamiang,sembilan gampong di Kabupaten Bener Meriah dan dua gampong di Kota Langsa” sebut Kepala Kantor Wilayah DJPBN Provinsi Aceh, Zaid Burhan Ibrahim, kepada serambi kemarin.<br><br>Disamping 20 gampong tersebut, banyak gampong gampong yang lainnya yang sedang alam proses pencairan dan sedang dalam proses pengajuan pencairan. Karena itu ia optimis pada jumat (30/1/2020) hari ini, jumlah gampong yang akan menerima transfer dana desa akan kembali bertambah. Pihaknya bersama Dinas Pemberdayaan masyarakat dan Gampong (DPMG) Acehakan terus memonitor proses pencairan dana desa ini.<br><br>“Saya ucapkan terima kasih kepada Pemerintah Provinsi, Kabupaten/Kota, kepada Plt Gubernur dan Kepala DPMG Aceh yang terus menerus melakukan koordinasi, juga kepada Bupati/Walikota sehingga pencairan dana desa bisa dilakukan pada bulan Januari” uajr Burhan.<br>Disaamping itu, mengingat di Aceh terdapat 6497 gampong yang harus dikejar pencairannya, maka pihknya berharap Bupati/Walikota terus mendorong gampong agar menyelesaikan syarat-syarat pencairan dana desa, seperti Peraturan Bupati/Walikota tentang Tata Cara Pembagian dan Penetapan Rincian Dana Desa Per&nbsp;<br>Gampong, Surat Kuasa Bupati/Walikota tentang pemindahbukuan dana desa, dan Qanun Gampong tentang APBG.<br><br>Secara tepisah, Plt Gubernur Aceh, Nova Iriansyah, saat dikonfirmasi serambi juga menyambut positif atas tercapainya target pencairan dana tahapI pada Januari 2020. Hal ini menunjukkan bahwa pencairan dana desa memang bisa di percepat. “Per hari ini sudah 20 desa yang sudah menerima dana desa tahap I. Memang belum signifikan, tetapi belum pernah kejadian dana desa di Januari sudah mulai cair”. Ujar Nova.<br><br>“Nah dari sini terbukti bahwa ternyata pencairan dana desa bisa cepat. Saya imbau kepada Bupati/Walikota hingga ke keuchik untuk melengkapi semua syarat syaratnya, sehingga pencairan bisa lebih cepat,” imbau Nova lagi.<br><br>Percepatan penyaluran dana desa ini, kata Plt Gubernur Aceh, merupakan perintah Presiden RI untuk memperkuat program pemberdayaan ekonomi rakyat mulai 2020. “Pemberdayaan ekonomi rakyat ini tidak terlalu terukur sepertu pembangunan infrastruktur, sehingga kegiatan harus dilakukan lebih awal agar kelihatan hasilnya di akhir tahun. Dengan pencairan dana desa di awal tahun, maka kegiatan di gampong-gampong bisa langsung dilaksanakan,” demikian Nova Iriansyah.</div>', '2022-01-20 19:34:33', '2022-01-20 19:34:33'),
(16, 'DPMG Langsa Diduga Suap Oknum Wartawan Dengan Kue Bolu dan Kasih Amplop Usai Bimtek Di Medan', 'dpmg-langsa-diduga-suap-oknum-wartawan-dengan-kue-bolu-dan-kasih-amplop-usai-bimtek-di-medan', 'post-images/GFomneXdGpkXSQ142hjXD2sfboMBramWqeLEr1Ix.jpg', 'Berawal dari terkait dengan pelaksanaan Bimtek aparatur Gampong di Pemko Langsa yang dilaksanakan di Banda Aceh oleh pihak ketiga, dan menjadi sorotan oleh sejumlah elemen masyarakat.Ketika salah satu...', '<div>Berawal dari terkait dengan pelaksanaan Bimtek aparatur Gampong di Pemko Langsa yang dilaksanakan di Banda Aceh oleh pihak ketiga, dan menjadi sorotan oleh sejumlah elemen masyarakat.<br><br></div><div>Ketika salah satu oknum wartawan media online inisial ( R ) meminta tanggapan kepada kepala DPMG melalui pesan Watshapp nya terhadap pemberitaan sebelumnya terkait dengan permintaan Ketua YARA Kota Langsa kepada Kejati dan Kejari untuk memeriksa LSM yang mengadakan pelanggaran Bintek.<br><br></div><div>Selanjutnya Rizal yang mengaku dari Dinas Pemberdayaan Masyarakat Gampong ( DPMG ) Kota Langsa menghubungi, ia mengaku masih di Medan mengadakan kegiatan Bimtek bersama aparatur Gampong, dan mengatakan nanti kalau sudah pulang kita ketemu dan cukup kita kita saja, ini semua kita rahasiakan.<br><br>“Kemudian pada hari Senin (08/03/2021) pagi sekitar pukul 09.00 Wib Rizal mempertanyakan dimana posisi, oknum wartawan (R) dirinya jawab sedang di Gampong Blang Pase, kita ketemu di depan SMA Negri 3 ya.? tapi sendiri katanya, selang beberapa menit kami ketemu didepan SMA 3.Rizal membawa sebuah kotak yang diduga roti bolu, selanjutnya kotak tersebut diserahkan kepada dirinya dan juga satu buah amplop, sambil mengatakan, ini ada titipan dan amanah dari bapak Azmi Kepala DPMG,” kata Rizal kepada oknum wartawan tersebut.<br><br></div><div>Oknum wartawan (R) mengucapkan terimakasih kepada pak Rizal atas bingkisannya.<br><br></div><div>Namun inisial ( R ) meminta tolong kepada Rizal untuk mengembalikan titipan bingkisan ini beserta Amplop kepada Azmi selaku Kepala DPMG.<br><br>“Karena Rizal tidak mau dimintai tolong untuk di kembalikan bingkisan beserta Amplop tersebut, wartawan inisial ( R ) keesokan harinya mengembalikan dengan mendatangi Kantor DPMG bermaksud untuk mengembalikan kepada Azmi namun dirinya tidak berada di Kantor. Dan menitipkan kepada ibu – ibu didepan meja piket, yang kebetulan pada saat itu ada dua orang wartawan yang melihat saat bingkisan tersebut dikembalikan,” ucap R oknum wartawan.<br><br></div><div>Untuk mencari tanggapan atas titipan bingkisan kue bolu dan Amplop berisi sejumlah uang yang diserahkan Rizal kepada Oknum Wartawan ( R ) yang katanya titipan Kepala DPMG bernama Azmi. Usai menggelar Bimtek di Sumatra Utara (Medan) bebrapa hari yang lalu apa maksudnya.<br><br>Awak media ini, mendatangi Kantor Dinas Pemberdayaan Masyarakat Gampong yang beralamat Jalan. T. Chik Thaib Gampong Jawa Kecamatan. Langsa Kota Pemko Langsa. Untuk bertemu Rizal namun tidak berada di tempat begitu juga dihubungi dengan seluler berkali – kali dengan dana masuk yang bersangkutan tidak mengangkat.<br><br></div><div>Hal yang sama juga terjadi terhadap Kepala DPMG Kota Langsa bernama Azmi.<br><br></div><div>Sampai berita ini di terbitkan media ini belum memperoleh tanggapan terkait bingkisan dan Amplop yang berisikan sejumlah uang yang diserahkan kepada oknum wartawan online inisial ( R ), usai menggelar Bimtek di Sumatra Utara (Medan). Yang di kembalikan dengan di antar langsung ke Kantor DPMG.<br><br></div>', '2022-01-20 19:36:14', '2022-01-20 19:36:14'),
(17, 'Kadis DPMG Provinsi Aceh Kunjungi Gampong Binaan Kuala Langsa', 'kadis-dpmg-provinsi-aceh-kunjungi-gampong-binaan-kuala-langsa', 'post-images/bT40WoN5rCMBAMn2W1bflmN0gewO1qmGpUMksClf.jpg', 'Menjadi salah satu Gampong/Desa binaan, Kepala Dinas Pemberdayaan Masyarakat Gampong Provinsi Aceh (DPMG) Provinsi Aceh, Dr. Ir. Zulkifli M.SI., dan rombongan mengunjungi Gampong Kuala Langsa, Kecamat...', '<div>Menjadi salah satu Gampong/Desa binaan, Kepala Dinas Pemberdayaan Masyarakat Gampong Provinsi Aceh (DPMG) Provinsi Aceh, Dr. Ir. Zulkifli M.SI., dan rombongan mengunjungi Gampong Kuala Langsa, Kecamatan Langsa Barat, Kota Langsa.<br><br></div><div>Selain melihat langsung produk dari bahan Manggrove, Kadis DPMG Provinsi Aceh, juga menyerahkan bantuan satu unit mesin pengolah tepung yang dipusatkan di Kantor Geuchik setempat, Sabtu (18/09/2021).<br><br></div><div>Geuchik Kuala Langsa, Rusmadi mengucapkan terima kasih kepada DPMG Provinsi Aceh yang telah memberikan perhatian ke gampong yang dipimpinnya.<br><br></div><div>\"Terimakasih kepada Kepala Dinas DPMG Provinsi Aceh dan rombongan yang telah mengunjungi dan melihat juga menikmati produk Manggrove di Gampong kami,\" ujar Rusmadi saat memberikan kata sambutan.<br><br></div><div>Pada kesempatan itu, Kadis DPMG Provinsi Aceh, mengatakan kunjungan tersebut merupakan bentuk perhatian DPMG Provinsi Aceh, terhadap kegiatan UMKM di di Gampong Kuala Langsa yang menjadi gampong binaan.<br><br></div><div>\"Ini merupakan bentuk perhatian dari Pemerintah Provinsi Aceh. Diharapkan dimasa yang akan datang dapat meningkatkan hasil produksi Manggrove,\" ujar Zulkifli.<br><br></div><div>Pada kesempatan itu, secara simbolis satu unit mesin pengolah tepung diserah oleh Kadis DPMG provinsi Aceh Kepada Geuchik yang juga&nbsp; memperkenalkan sejumlah produk seperti, Sirup, Kerupuk, dan dodol dengan bahan baku Manggrove.<br><br></div><div>Kegiatan tersebut digelar dengan memperhatikan prosedur kesehatan. Turut hadir Tim TP PKK Provinsi Aceh, sekretaris DPMG Kota Langsa, Camat Langsa Barat dan sejumlah unsur terkait.<br><br></div>', '2022-01-20 19:37:24', '2022-01-20 19:37:24');

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE `profiles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `general` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `visi_misi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `org_struct` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`id`, `company_name`, `general`, `visi_misi`, `org_struct`, `created_at`, `updated_at`) VALUES
(1, 'Dinas Pemberdayaan Masyarakat dan Gampong Kota Langsa', '<div>Badan Pemberdayaan Masyarakat kota Langsa dibentuk berdasarkan Qanun Nomor 04 Tahun 2008 Tentang susunan Organisasi dan tata Kerja Perangkat Daerah Kota Langsa. Berdasarkan Qanun tersebut Badan Pemberdayaan Masyarakat Kota Langsa dibentuk untuk melaksanakan pemberdayaan masyarakat pemukiman dan gampong.<br><br>Badan Pemberdayaan Masyarakat Kota Langsa mempunyai tugas membantu Walikota dalam pelaksanaan tugas umum pemerintahan dan pembangunan dibidang pemberdayaan masyarakat pemukiman dan gampong sesuai dengan peraturan perundang-undangan.</div>', '<div>Visi Badan Pemberdayaan Masyarakat Kota Langsa adalah “Terwujudnya Kemandirian Masyarakat Kota Langsa Yang Sejahtera Dan Bermartabat” yang artinya adalah kemandirian masyarakat merupakan suatu kondisi dinamis yang memungkinkan masyarakat mampu membangun diri dan lingkungannya berdasarkan potensi, kebutuhan, aspirasi dan kewengan yang ada pada masyarakat sendiri, dengan difasilitasi oleh pemerintah dan seluruh stakeholders pemberdayaan masyarakat.<br><br>Misi merupakan sesuatu yang harus diemban atau dilaksanakan agar visi organisasi dapat terwujud. Gambaran yang akan dilaksanakan selama 5 tahun dalam rangka membangun dan mewujudkan Visi Badan Pemberdayaan Masyarakat Kota Langsa adalah sebagai berikut:</div><ol><li>Mengoptimalkan kelembagaan serta pengembangan partisipasi dan ke swadayaan masyarakat;</li><li>Mewujudkan kehidupan sosial budaya masyarakat dan pemberdayaan sosial budaya yang islami;</li><li>Mengoptimalkan penyelenggaraan pemerintahan mukim dan gampong;</li><li>Mengembangkan kegiatan-kegiatan pemberdayaan usaha bidang ekonomi masyarakat;</li><li>Meningkatkan pemanfaatan sumberdaya alam berwawasan lingkungan dan pemberdayaan Teknologi Tepat Guna sesuai potensi dan kebutuhan masyarakat.</li></ol>', '<div>Dinas Pemberdayaan Masyarakat dan Gampong Kota Langsa merupakan salah satu SKPK yang dibentuk dengan keputusan Walikota Kota Langsa Nomor 55 tahun 2016 Tanggal 14 Desember 2016, Tentang Kedudukan, Susunan Organisasi dan Tugas Fungsi Serta Tata Kerja Dinas Pemberdayaan Masyarakat dan Gampong Kota Langsa mengemban tugas pokok dan fungsi membantu walikota dalam pelaksanaan tugas umum pemerintahan dan pembangunan dibidang Pemberdayaan Masyarakat dan gampong sesuai dengan perundang-undangan.</div>', '2022-01-17 10:26:34', '2022-01-18 18:33:11');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `last_name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'DPMG Langsa', 'admin@dpmglangsa.com', NULL, '$2y$10$8hXcuTZccIMdxgc28QXNfOfPhCKgeqVmv0xN1gXq2zg5hemZFsR0i', NULL, NULL, NULL, '2022-01-13 01:35:49', '2022-01-18 18:47:53');

-- --------------------------------------------------------

--
-- Table structure for table `villages`
--

CREATE TABLE `villages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `district` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `long` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `villages`
--

INSERT INTO `villages` (`id`, `name`, `district`, `site`, `long`, `lat`, `created_at`, `updated_at`) VALUES
(2, 'Baro', 'Langsa Lama', 'http://baro-lgs.gampong.id/', '97.98082678459497', '4.4604221439014395', '2022-01-18 16:27:51', '2022-01-18 16:27:51'),
(3, 'Baroh Langsa Lama', 'Langsa Lama', 'http://barohlangsalama.gampong.id/', '97.98580379106448', '4.459133621261245', '2022-01-18 16:28:20', '2022-01-18 16:28:20'),
(4, 'Meurandeh', 'Langsa Lama', 'http://meurandeh-lgs.gampong.id/', '97.98063533735626', '4.458329270081109', '2022-01-18 16:28:57', '2022-01-18 16:28:57'),
(5, 'Buket Medang Ara', 'Langsa Timur', 'buketmedangara.gampong.id', '97.9822537', '4.4385924', '2022-01-20 19:42:00', '2022-01-20 19:42:33'),
(6, 'Matang Seutui', 'Langsa Timur', 'matangseutui.gampong.id', '98.0014677', '4.4406702', '2022-01-20 19:44:00', '2022-01-20 19:44:00'),
(7, 'Lhok Banie', 'Langsa Barat', 'Langsa Barat', '97.9682762', '4.4955643', '2022-01-20 19:44:52', '2022-01-20 19:44:52'),
(8, 'PB. Teungoh', 'Langsa Barat', 'pbteungoh.gampong.id', '97.9401908', '4.4755973', '2022-01-20 19:47:00', '2022-01-20 19:47:00'),
(9, 'Teungoh', 'Langsa Kota', 'Langsa Kota', '97.9725891', '4.4647747', '2022-01-20 19:48:08', '2022-01-20 19:48:08'),
(10, 'Peukan Langsa', 'Peukan Langsa', 'peukanlangsa.gampong.id', '97.9682908', '4.4714043', '2022-01-20 19:49:09', '2022-01-20 19:49:09'),
(11, 'Timbang Langsa', 'Langsa Baro', 'timbanglangsa.gampong.id', '97.9006024', '4.515307', '2022-01-20 19:50:12', '2022-01-20 19:50:12'),
(12, 'Alue Dua', 'Langsa Baro', 'aluedua-lgs.gampong.id', '97.9347623', '4.5188765', '2022-01-20 19:50:59', '2022-01-20 19:50:59');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `villages`
--
ALTER TABLE `villages`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `villages`
--
ALTER TABLE `villages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
