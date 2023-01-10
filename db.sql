-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.24-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.0.0.6468
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para micartafacil
CREATE DATABASE IF NOT EXISTS `micartafacil` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `micartafacil`;

-- Volcando estructura para tabla micartafacil.auth_group
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla micartafacil.auth_group: ~0 rows (aproximadamente)

-- Volcando estructura para tabla micartafacil.auth_group_permissions
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla micartafacil.auth_group_permissions: ~0 rows (aproximadamente)

-- Volcando estructura para tabla micartafacil.auth_permission
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla micartafacil.auth_permission: ~44 rows (aproximadamente)
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
	(1, 'Can add log entry', 1, 'add_logentry'),
	(2, 'Can change log entry', 1, 'change_logentry'),
	(3, 'Can delete log entry', 1, 'delete_logentry'),
	(4, 'Can view log entry', 1, 'view_logentry'),
	(5, 'Can add permission', 2, 'add_permission'),
	(6, 'Can change permission', 2, 'change_permission'),
	(7, 'Can delete permission', 2, 'delete_permission'),
	(8, 'Can view permission', 2, 'view_permission'),
	(9, 'Can add group', 3, 'add_group'),
	(10, 'Can change group', 3, 'change_group'),
	(11, 'Can delete group', 3, 'delete_group'),
	(12, 'Can view group', 3, 'view_group'),
	(13, 'Can add user', 4, 'add_user'),
	(14, 'Can change user', 4, 'change_user'),
	(15, 'Can delete user', 4, 'delete_user'),
	(16, 'Can view user', 4, 'view_user'),
	(17, 'Can add content type', 5, 'add_contenttype'),
	(18, 'Can change content type', 5, 'change_contenttype'),
	(19, 'Can delete content type', 5, 'delete_contenttype'),
	(20, 'Can view content type', 5, 'view_contenttype'),
	(21, 'Can add session', 6, 'add_session'),
	(22, 'Can change session', 6, 'change_session'),
	(23, 'Can delete session', 6, 'delete_session'),
	(24, 'Can view session', 6, 'view_session'),
	(25, 'Can add Alérgenos', 7, 'add_alergenos'),
	(26, 'Can change Alérgenos', 7, 'change_alergenos'),
	(27, 'Can delete Alérgenos', 7, 'delete_alergenos'),
	(28, 'Can view Alérgenos', 7, 'view_alergenos'),
	(29, 'Can add Categoría', 8, 'add_category'),
	(30, 'Can change Categoría', 8, 'change_category'),
	(31, 'Can delete Categoría', 8, 'delete_category'),
	(32, 'Can view Categoría', 8, 'view_category'),
	(33, 'Can add Restaurante', 9, 'add_restaurant'),
	(34, 'Can change Restaurante', 9, 'change_restaurant'),
	(35, 'Can delete Restaurante', 9, 'delete_restaurant'),
	(36, 'Can view Restaurante', 9, 'view_restaurant'),
	(37, 'Can add Menú', 10, 'add_menu'),
	(38, 'Can change Menú', 10, 'change_menu'),
	(39, 'Can delete Menú', 10, 'delete_menu'),
	(40, 'Can view Menú', 10, 'view_menu'),
	(41, 'Can add Banner', 11, 'add_banner'),
	(42, 'Can change Banner', 11, 'change_banner'),
	(43, 'Can delete Banner', 11, 'delete_banner'),
	(44, 'Can view Banner', 11, 'view_banner');

-- Volcando estructura para tabla micartafacil.auth_user
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla micartafacil.auth_user: ~1 rows (aproximadamente)
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
	(1, 'pbkdf2_sha256$390000$Y7wDEp0K6vruhrCFrgRe8R$Gfz4LTPdOLjk3OH0x49EOTkPlxKCb8k85p/ImDGD+Ik=', '2022-09-07 19:52:45.284406', 1, 'admin', '', '', '', 1, 1, '2022-09-07 16:49:06.123101');

-- Volcando estructura para tabla micartafacil.auth_user_groups
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla micartafacil.auth_user_groups: ~0 rows (aproximadamente)

-- Volcando estructura para tabla micartafacil.auth_user_user_permissions
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla micartafacil.auth_user_user_permissions: ~0 rows (aproximadamente)

-- Volcando estructura para tabla micartafacil.django_admin_log
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla micartafacil.django_admin_log: ~0 rows (aproximadamente)

-- Volcando estructura para tabla micartafacil.django_content_type
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla micartafacil.django_content_type: ~11 rows (aproximadamente)
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(1, 'admin', 'logentry'),
	(3, 'auth', 'group'),
	(2, 'auth', 'permission'),
	(4, 'auth', 'user'),
	(5, 'contenttypes', 'contenttype'),
	(7, 'menu', 'alergenos'),
	(11, 'menu', 'banner'),
	(8, 'menu', 'category'),
	(10, 'menu', 'menu'),
	(9, 'menu', 'restaurant'),
	(6, 'sessions', 'session');

-- Volcando estructura para tabla micartafacil.django_migrations
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla micartafacil.django_migrations: ~42 rows (aproximadamente)
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'contenttypes', '0001_initial', '2022-09-07 16:47:32.278664'),
	(2, 'auth', '0001_initial', '2022-09-07 16:47:32.870825'),
	(3, 'admin', '0001_initial', '2022-09-07 16:47:33.024824'),
	(4, 'admin', '0002_logentry_remove_auto_add', '2022-09-07 16:47:33.037822'),
	(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-09-07 16:47:33.048824'),
	(6, 'contenttypes', '0002_remove_content_type_name', '2022-09-07 16:47:33.130824'),
	(7, 'auth', '0002_alter_permission_name_max_length', '2022-09-07 16:47:33.183825'),
	(8, 'auth', '0003_alter_user_email_max_length', '2022-09-07 16:47:33.215830'),
	(9, 'auth', '0004_alter_user_username_opts', '2022-09-07 16:47:33.226822'),
	(10, 'auth', '0005_alter_user_last_login_null', '2022-09-07 16:47:33.291822'),
	(11, 'auth', '0006_require_contenttypes_0002', '2022-09-07 16:47:33.296826'),
	(12, 'auth', '0007_alter_validators_add_error_messages', '2022-09-07 16:47:33.307823'),
	(13, 'auth', '0008_alter_user_username_max_length', '2022-09-07 16:47:33.336825'),
	(14, 'auth', '0009_alter_user_last_name_max_length', '2022-09-07 16:47:33.363823'),
	(15, 'auth', '0010_alter_group_name_max_length', '2022-09-07 16:47:33.390825'),
	(16, 'auth', '0011_update_proxy_permissions', '2022-09-07 16:47:33.400829'),
	(17, 'auth', '0012_alter_user_first_name_max_length', '2022-09-07 16:47:33.421822'),
	(18, 'menu', '0001_initial', '2022-09-07 16:47:33.666375'),
	(19, 'menu', '0002_alter_menu_alergenos_alter_menu_category', '2022-09-07 16:47:33.677377'),
	(20, 'menu', '0003_restaurant_status', '2022-09-07 16:47:33.705377'),
	(21, 'menu', '0004_alter_alergenos_options_alter_category_options_and_more', '2022-09-07 16:47:33.734111'),
	(22, 'menu', '0005_alter_menu_alergenos', '2022-09-07 16:47:34.006105'),
	(23, 'menu', '0006_alter_menu_description', '2022-09-07 16:47:34.049107'),
	(24, 'menu', '0007_alergenos_created_at_alergenos_updated_at_and_more', '2022-09-07 16:47:34.258106'),
	(25, 'menu', '0008_alter_alergenos_image', '2022-09-07 16:47:34.264104'),
	(26, 'menu', '0009_remove_menu_alergenos_menu_alergenos', '2022-09-07 16:47:34.631819'),
	(27, 'menu', '0010_alter_menu_alergenos_remove_menu_category_and_more', '2022-09-07 16:47:34.867427'),
	(28, 'menu', '0011_restaurant_logo', '2022-09-07 16:47:34.885425'),
	(29, 'menu', '0012_alter_menu_alergenos_alter_menu_category', '2022-09-07 16:47:34.898424'),
	(30, 'menu', '0013_alter_restaurant_logo', '2022-09-07 16:47:34.906426'),
	(31, 'menu', '0014_alter_restaurant_logo', '2022-09-07 16:47:34.913439'),
	(32, 'menu', '0015_restaurant_favicon', '2022-09-07 16:47:34.941428'),
	(33, 'menu', '0016_restaurant_name_url', '2022-09-07 16:47:34.966426'),
	(34, 'menu', '0017_alter_restaurant_name_url', '2022-09-07 16:47:34.985425'),
	(35, 'menu', '0018_restaurant_time_restaurant_whatsaap_and_more', '2022-09-07 16:47:35.112431'),
	(36, 'menu', '0019_rename_whatsaap_restaurant_whatsapp', '2022-09-07 16:47:35.135426'),
	(37, 'menu', '0020_restaurant_facebook_restaurant_instagram_and_more', '2022-09-07 16:47:35.194425'),
	(38, 'menu', '0021_banner', '2022-09-07 16:47:35.308426'),
	(39, 'menu', '0022_rename_button_text1_banner_button_code1_and_more', '2022-09-07 16:47:35.352426'),
	(40, 'menu', '0023_remove_banner_button_code1_and_more', '2022-09-07 16:47:35.425429'),
	(41, 'menu', '0024_banner_banner_number', '2022-09-07 16:47:35.461427'),
	(42, 'sessions', '0001_initial', '2022-09-07 16:47:35.510428');

-- Volcando estructura para tabla micartafacil.django_session
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla micartafacil.django_session: ~0 rows (aproximadamente)
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
	('m5s315mdp79t3ejvpdv7agynziat9s2g', '.eJxVjDsOwjAQRO_iGln-BW8o6TmD5d21cQDZUpxUiLuTSCmgGmnem3mLENelhLWnOUwsLkKL02-HkZ6p7oAfsd6bpFaXeUK5K_KgXd4ap9f1cP8OSuxlW6eo7EiYPbEegdB7NShG7a12kDJFzQA2KeuAGDKSM4aGLc5kDBgUny_60DhX:1oW16L:bcNvJXU2pbbtnVWjajpfNI2oaYLie_VfT5O0vuBMpno', '2022-09-21 19:52:45.288407');

-- Volcando estructura para tabla micartafacil.menu_alergenos
CREATE TABLE IF NOT EXISTS `menu_alergenos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla micartafacil.menu_alergenos: ~0 rows (aproximadamente)
INSERT INTO `menu_alergenos` (`id`, `name`, `image`, `created_at`, `updated_at`) VALUES
	(1, 'altramuces', 'static/alergenos_images/allergens_altramuces.png', '2022-08-04 13:38:10.105323', '2022-08-04 13:40:00.281444'),
	(2, 'apio', 'static/alergenos_images/allergens_apio.png', '2022-08-04 13:38:10.105323', '2022-08-04 13:40:00.281444'),
	(3, 'cacahuetes', 'static/alergenos_images/allergens_cacahuetes.png', '2022-08-04 13:38:10.105323', '2022-08-04 13:40:00.281444'),
	(5, 'gluten', 'static/alergenos_images/allergens_gluten.png', '2022-08-04 13:38:10.105323', '2022-08-04 13:40:00.281444'),
	(6, 'lacteos', 'static/alergenos_images/allergens_lacteos.png', '2022-08-04 13:38:10.105323', '2022-08-04 13:40:00.281444'),
	(7, 'leche', 'static/alergenos_images/allergens_leche.png', '2022-08-04 13:38:10.105323', '2022-08-04 13:40:00.281444'),
	(8, 'molusco', 'static/alergenos_images/allergens_molusco.png', '2022-08-04 13:38:10.105323', '2022-08-04 13:40:00.281444'),
	(9, 'mostaza', 'static/alergenos_images/allergens_mostaza.png', '2022-08-04 13:38:10.105323', '2022-08-04 13:40:00.281444'),
	(10, 'nuez', 'static/alergenos_images/allergens_nuez.png', '2022-08-04 13:38:10.105323', '2022-08-04 13:40:00.281444'),
	(11, 'pescado', 'static/alergenos_images/allergens_pescado.png', '2022-08-04 13:38:10.105323', '2022-08-04 13:40:00.281444'),
	(12, 'sesamo', 'static/alergenos_images/allergens_sesamo.png', '2022-08-04 13:38:10.105323', '2022-08-04 13:40:00.281444'),
	(13, 'so2', 'static/alergenos_images/allergens_so2.png', '2022-08-04 13:38:10.105323', '2022-08-04 13:40:00.281444'),
	(14, 'soja', 'static/alergenos_images/allergens_soja.png', '2022-08-04 13:38:10.105323', '2022-08-04 13:40:00.281444'),
	(20, 'boot', 'static/alergenos_images/apple-touch-icon.png', '2022-09-06 19:46:06.842589', '2022-09-06 20:06:00.190989');

-- Volcando estructura para tabla micartafacil.menu_banner
CREATE TABLE IF NOT EXISTS `menu_banner` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `restaurant_id` bigint(20) NOT NULL,
  `button` varchar(100) DEFAULT NULL,
  `banner_number` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_banner_restaurant_id_481966b4_fk_menu_restaurant_id` (`restaurant_id`),
  CONSTRAINT `menu_banner_restaurant_id_481966b4_fk_menu_restaurant_id` FOREIGN KEY (`restaurant_id`) REFERENCES `menu_restaurant` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla micartafacil.menu_banner: ~0 rows (aproximadamente)
INSERT INTO `menu_banner` (`id`, `name`, `title`, `description`, `image`, `status`, `created_at`, `updated_at`, `restaurant_id`, `button`, `banner_number`) VALUES
	(1, 'Helados Palma - Slider 1', 'Helados Palma', 'Una gran tradición en la elaboración propia de helados, siguiendo métodos artesanales.', 'static/banners_images/slide-1.jpg', 1, '2022-08-08 02:40:28.581277', '2022-08-08 03:16:59.886966', 1, 'Phone', 1),
	(2, 'Helados Palma - Slider 2', 'Para la gente que AMA el Helado', 'El helado se elabora sin aditivos químicos. Es la alternativa perfecta a las novedades industriales congeladas y una excelente opción para quienes prefieren ingredientes naturales para su salud.', 'static/banners_images/slide-2.jpg', 1, '2022-08-08 03:01:08.624016', '2022-08-08 03:17:04.030946', 1, 'Whatsapp', 2),
	(3, 'LOLa', 'LOALOA', 'asfhasfiohlaslkfhas', 'static/banners_images/about.jpg', 1, '2022-09-07 00:21:41.332868', '2022-09-07 01:47:26.919518', 2, 'Whatsapp', 1);

-- Volcando estructura para tabla micartafacil.menu_category
CREATE TABLE IF NOT EXISTS `menu_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menu_category_name_3df82881_uniq` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla micartafacil.menu_category: ~0 rows (aproximadamente)
INSERT INTO `menu_category` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(2, 'Repostería', '2022-08-04 13:40:00.289431', '2022-08-04 13:40:00.314353'),
	(3, 'Crepes', '2022-08-04 13:40:00.289431', '2022-08-04 13:40:00.314353'),
	(4, 'Comidas', '2022-08-04 13:40:00.289431', '2022-08-04 13:40:00.314353'),
	(5, 'Helados', '2022-08-04 13:40:00.289431', '2022-08-04 13:40:00.314353'),
	(6, 'Snacks', '2022-08-04 13:40:00.289431', '2022-08-04 13:40:00.314353'),
	(8, 'Batidos', '2022-08-04 13:40:00.289431', '2022-08-04 13:40:00.314353'),
	(9, 'Infusiones', '2022-08-04 13:40:00.289431', '2022-08-04 13:40:00.314353'),
	(10, 'Desayunos', '2022-08-04 13:40:00.289431', '2022-08-04 13:40:00.314353'),
	(11, 'tratra', '2022-09-01 01:27:24.724590', '2022-09-01 01:27:24.724590'),
	(12, 'Mia', '2022-09-06 16:03:42.425103', '2022-09-06 16:03:42.425103'),
	(13, 'kb', '2022-09-06 16:14:19.194137', '2022-09-06 16:14:19.200997'),
	(14, 'kbj', '2022-09-06 16:16:21.878428', '2022-09-06 16:16:21.885525');

-- Volcando estructura para tabla micartafacil.menu_menu
CREATE TABLE IF NOT EXISTS `menu_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` longtext DEFAULT NULL,
  `price` decimal(6,2) NOT NULL,
  `restaurant_id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_menu_restaurant_id_36945c03_fk_menu_restaurant_id` (`restaurant_id`),
  CONSTRAINT `menu_menu_restaurant_id_36945c03_fk_menu_restaurant_id` FOREIGN KEY (`restaurant_id`) REFERENCES `menu_restaurant` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla micartafacil.menu_menu: ~0 rows (aproximadamente)
INSERT INTO `menu_menu` (`id`, `name`, `description`, `price`, `restaurant_id`, `created_at`, `updated_at`) VALUES
	(1, 'Croissant', '', 1.60, 1, '2022-08-04 13:40:00.322328', '2022-08-05 09:30:34.491411'),
	(2, 'Crepes a Elegir', 'Nutella, Nutella Blanca, Dulce de Leche, Leche Condensada, Crema Lotus', 4.00, 1, '2022-08-04 13:40:00.322328', '2022-08-18 18:27:31.844630'),
	(3, 'Tostadas', 'Mantequilla y Mermelada', 1.90, 1, '2022-08-05 09:29:01.661565', '2022-08-05 09:29:01.661565'),
	(4, 'Ensalada Verde', 'Tomate, Lechuga Iceberg, Cebolla, Zanahora y Remolacha', 4.50, 1, '2022-08-05 09:29:33.082946', '2022-08-05 09:29:33.082946'),
	(19, 'Nuevo', 'La mejor', 10.00, 1, '2022-09-01 21:54:56.764444', '2022-09-01 21:54:56.836351'),
	(29, 'asdasda', 'dfqwfw', 54.00, 2, '2022-09-05 16:03:31.805603', '2022-09-05 18:48:01.200038'),
	(30, 'asfas', 'la loca\r\n', 5.00, 2, '2022-09-05 16:10:16.027547', '2022-09-05 18:55:31.903955'),
	(31, 'Blanqueta', 'lkgkjgkjh', 100.00, 1, '2022-09-05 18:32:49.897666', '2022-09-05 18:43:52.141673');

-- Volcando estructura para tabla micartafacil.menu_menu_alergenos
CREATE TABLE IF NOT EXISTS `menu_menu_alergenos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `menu_id` bigint(20) NOT NULL,
  `alergenos_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menu_menu_alergenos_menu_id_alergenos_id_6866a9a2_uniq` (`menu_id`,`alergenos_id`),
  KEY `menu_menu_alergenos_alergenos_id_2444fde4_fk_menu_alergenos_id` (`alergenos_id`),
  CONSTRAINT `menu_menu_alergenos_alergenos_id_2444fde4_fk_menu_alergenos_id` FOREIGN KEY (`alergenos_id`) REFERENCES `menu_alergenos` (`id`),
  CONSTRAINT `menu_menu_alergenos_menu_id_930b5f0b_fk_menu_menu_id` FOREIGN KEY (`menu_id`) REFERENCES `menu_menu` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla micartafacil.menu_menu_alergenos: ~0 rows (aproximadamente)
INSERT INTO `menu_menu_alergenos` (`id`, `menu_id`, `alergenos_id`) VALUES
	(9, 1, 1),
	(10, 1, 7),
	(1, 2, 1),
	(4, 2, 6),
	(3, 2, 7),
	(5, 3, 2),
	(6, 3, 3),
	(7, 4, 2),
	(8, 4, 3),
	(22, 19, 2),
	(37, 29, 1),
	(38, 30, 1),
	(39, 30, 2),
	(40, 30, 3);

-- Volcando estructura para tabla micartafacil.menu_menu_category
CREATE TABLE IF NOT EXISTS `menu_menu_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `menu_id` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menu_menu_category_menu_id_category_id_42ef1d3a_uniq` (`menu_id`,`category_id`),
  KEY `menu_menu_category_category_id_c4770e38_fk_menu_category_id` (`category_id`),
  CONSTRAINT `menu_menu_category_category_id_c4770e38_fk_menu_category_id` FOREIGN KEY (`category_id`) REFERENCES `menu_category` (`id`),
  CONSTRAINT `menu_menu_category_menu_id_fa0d42c4_fk_menu_menu_id` FOREIGN KEY (`menu_id`) REFERENCES `menu_menu` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla micartafacil.menu_menu_category: ~0 rows (aproximadamente)
INSERT INTO `menu_menu_category` (`id`, `menu_id`, `category_id`) VALUES
	(6, 1, 10),
	(7, 2, 2),
	(3, 2, 3),
	(2, 2, 10),
	(4, 3, 10),
	(5, 4, 4),
	(20, 19, 4),
	(46, 29, 4),
	(49, 30, 4),
	(47, 30, 8);

-- Volcando estructura para tabla micartafacil.menu_restaurant
CREATE TABLE IF NOT EXISTS `menu_restaurant` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `logo` varchar(100) DEFAULT NULL,
  `favicon` varchar(100) NOT NULL,
  `name_url` varchar(100) NOT NULL,
  `time` varchar(100) DEFAULT NULL,
  `whatsapp` varchar(100) DEFAULT NULL,
  `facebook` varchar(100) DEFAULT NULL,
  `instagram` varchar(100) DEFAULT NULL,
  `twitter` varchar(100) DEFAULT NULL,
  `youtube` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menu_restaurant_name_url_13cacce0_uniq` (`name_url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla micartafacil.menu_restaurant: ~0 rows (aproximadamente)
INSERT INTO `menu_restaurant` (`id`, `name`, `address`, `phone`, `email`, `status`, `created_at`, `updated_at`, `logo`, `favicon`, `name_url`, `time`, `whatsapp`, `facebook`, `instagram`, `twitter`, `youtube`) VALUES
	(1, 'Helados Palma', 'Carrer de les Illes Pitiüses, 12, 07007 Palma, Illes Balears', '911619445', 'info@heladeriapalma.com', 1, '2022-08-04 13:40:00.345268', '2022-09-05 16:08:19.133275', 'static/restaurant_logo/logo.png', 'static/restaurants_favicon/heladosPalma.png', 'heladospalma', 'Lunes - Sábado : 06:00 AM - 23:00 PM', '34611619443', 'https://www.facebook.com/heladeria.palma', 'https://www.instagram.com/heladeriapalma', NULL, NULL),
	(2, 'Ejemploa', 'tu direccion', '611000000', 'example@micartafacil.com', 1, '2022-08-04 15:32:44.864319', '2022-09-06 20:24:26.944655', '', 'static/restaurants_favicon/CrystalDiskMark_20220902181801_ObtsF2N.png', 'ejemplo', 'None', 'None', 'None', 'None', 'None', 'None'),
	(13, 'asdas', 'fwqfq', '124', '', 1, '2022-09-06 18:50:42.795980', '2022-09-06 18:53:57.237181', '', 'static/restaurants_favicon/CrystalDiskMark_20220902181801.png', '', '', '41242', '', '', '', '');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
