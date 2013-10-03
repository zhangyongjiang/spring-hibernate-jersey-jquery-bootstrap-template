CREATE TABLE `event` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `event_start_date` datetime default NULL,
    `event_end_date` datetime default NULL,
  `event_organizer` varchar(255) default NULL,
  `contact_person` varchar(255) default NULL,
  `summary` varchar(255) default NULL,
   `notes` varchar(255) default NULL,
    `location_name` varchar(255) default NULL,
  `location_city` varchar(255) default NULL,
  `location_country` varchar(255) default NULL,
  `location_postal` varchar(255) default NULL,
  `location_state` varchar(255) default NULL,
  `location_street_address1` varchar(255) default NULL,
  `location_street_address2` varchar(255) default NULL,
  `location_longitude` double default '0',
  `location_latitude` double default '0',
  `event_code` varchar(64) NOT NULL,
    `category` varchar(64) NOT NULL,
  `subcategory` varchar(64)  NULL,

  `created_by` varchar(64),
  `create_date` date,
  `modified_by` varchar(64),
  `modify_date` date,
  PRIMARY KEY  (`id`)
) ;


#--;

CREATE TABLE `carpool` (
  `id` bigint(20) NOT NULL auto_increment,
  `customer_id` int(11) NULL default NULL,
  `join_mode` int(2) NOT NULL default '0',
  `min_passenger` int(2) NOT NULL default '2',
  `max_passenger` int(2) NOT NULL default '4',
  `origin_name` varchar(255) default NULL,
  `origin_city` varchar(255) default NULL,
  `route_id`  bigint(20),
  `origin_country` varchar(255) default NULL,
  `origin_postal` varchar(255) default NULL,
  `origin_state` varchar(255) default NULL,
  `origin_street_address1` varchar(255) default NULL,
  `origin_street_address2` varchar(255) default NULL,
  `origin_longitude` double default NULL,
  `origin_latitude` double default NULL,
  `destination_name` varchar(255) default NULL,
  `destination_city` varchar(255) default NULL,
  `destination_country` varchar(255) default NULL,
  `destination_postal` varchar(255) default NULL,
  `destination_state` varchar(255) default NULL,
  `destination_street_address1` varchar(255) default NULL,
  `destination_street_address2` varchar(255) default NULL,
  `destination_longitude` double default NULL,
  `destination_latitude` double default NULL,
  `driver_rotation_policy` int(11) default NULL,
  `day_of_week` varchar(255) default NULL,
  `driver` bigint(20) NULL default '0',
  `creater` bigint(20) NULL default '0',
  `start_date` date,
  `end_date` date,
  `created_by` varchar(64),
  `create_date` date,
  `modified_by` varchar(64),
  `modify_date` date,
  `name` varchar(255) default NULL,
  `description` varchar(255) default NULL,
  `status` int(2) NOT NULL default '0',
  `last_ride_date` date NULL,
  `last_driver` bigint(20) NULL,
  PRIMARY KEY  (`id`),
  KEY `customer_id` (`customer_id`),
   KEY `driver` (`driver`),
      KEY `creater` (`creater`)
) ;

#--;

CREATE TABLE `customer` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `customer_admin_first_name` varchar(255) default NULL,
  `customer_admin_home_phone` varchar(255) default NULL,
  `customer_admin_last_name` varchar(255) default NULL,
  `customer_admin_title` varchar(255) default NULL,
  `customer_admin_work_email` varchar(255) default NULL,
  `customer_admin_work_phone` varchar(255) default NULL,
  `customer_admin_cell_phone` varchar(255) default NULL,
  `customer_admin_id` int(11) default '0',
  `created_by` varchar(64),
  `create_date` date,
  `modified_by` varchar(64),
  `modify_date` date,
  PRIMARY KEY  (`id`)
) ;

#--;
create table `company`
(
  `id` bigint(20) NOT NULL auto_increment,
  `company_name` varchar(255) default NULL,
  `company_url` varchar(255) default NULL,
  `company_domain` varchar(255) default NULL,
  `contact_person_name` varchar(100) default NULL,
  `contact_person_phone` varchar(100),
  `contact_person_email` varchar(100),
  `status` int(2) NULL,`created_by` varchar(64),
  `create_date` date,
  `modified_by` varchar(64),
  `modify_date` date,
  PRIMARY KEY  (`id`)
);

#--;
CREATE TABLE `site` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `address_name` varchar(255) default NULL,
  `city` varchar(255) default NULL,
  `country` varchar(255) default NULL,
  `postal` varchar(255) default NULL,
  `state` varchar(255) default NULL,
  `street_address1` varchar(255) default NULL,
  `street_address2` varchar(255) default NULL,
  `longitude` double default NULL,
  `latitude` double default NULL,
  `customer_id` bigint(20) NULL default '0',
  `created_by` varchar(64),
  `create_date` date,
  `modified_by` varchar(64),
  `modify_date` date,
  PRIMARY KEY  (`id`),
  FOREIGN KEY (customer_id) REFERENCES customer (id)
) ;

#--;

#
# Table structure for table `carpool_ride_log`
#

CREATE TABLE `carpool_ride_log` (
  `id` bigint(20) NOT NULL auto_increment,
  `commuter_id` int(11) NOT NULL default '0',
  `carpool_id` int(11) NOT NULL default '0',
  `rides_generated_date` date default NULL,
  `created_by` varchar(64),
  `create_date` date,
  `modified_by` varchar(64),
  `modify_date` date,
  PRIMARY KEY  (`id`),
  KEY `carpool_id` (`carpool_id`),
  KEY `commuter_id` (`commuter_id`)
) ;

#--;

#
# Table structure for table `commuter`
#

CREATE TABLE `commuter` (
  `id` bigint(20) NOT NULL auto_increment,
  `first_name` varchar(255) default NULL,
  `last_name` varchar(255) default NULL,
  `max_deviation_home` double default NULL,
  `max_deviation_work` double default NULL,
  `personal_phone` varchar(255) default NULL,
   `personal_email` varchar(255) default NULL,
   `dob` varchar(10) default NULL,
  `work_email_address` varchar(255) default NULL,
  `work_phone` varchar(255) default NULL,
  `login_name` varchar(255) default NULL,
  `password` varchar(255) default NULL,
  `employee_id` varchar(255) default NULL,
  `display_name` varchar(255) default NULL,
  `member_since` date default NULL,
  `last_login` datetime default NULL,
  `num_rides_participated_in` int(11) default 0,
  `rating` int(11) default '0',
  `numRidesAsDriver` int(11) default '0',
  `points` double default '0',
  `freepoints` int(11) default '0',
  `customer_id` bigint(20) default '0',
  `show_help` int(1) default '1',
  `home_address_name` varchar(255) default NULL,
  `home_address_city` varchar(255) default NULL,
  `home_address_country` varchar(255) default NULL,
  `home_address_postal` varchar(255) default NULL,
  `home_address_state` varchar(255) default NULL,
  `home_address_street_address1` varchar(255) default NULL,
  `housing_community` varchar(255) default NULL,
  `home_address_street_address2` varchar(255) default NULL,
  `home_longitude` double default NULL,
  `home_latitude` double default NULL,
  `work_address_name` varchar(255) default NULL,
  `work_address_city` varchar(255) default NULL,
  `work_address_country` varchar(255) default NULL,
  `work_address_postal` varchar(255) default NULL,
  `work_address_state` varchar(255) default NULL,
  `bulding_number` varchar(255) default NULL,
  `work_address_street_address1` varchar(255) default NULL,
  `work_address_street_address2` varchar(255) default NULL,
  `work_longitude` double default NULL,
  `work_latitude` double default NULL,
  `is_active` tinyint(1) default NULL,
  `account_status` int(1) default '0',
  `restrict_profile` tinyint(1) default NULL,
  `site_id` bigint(20),
    `company_id` bigint(20),
  `refered_by` bigint(20),
  `created_by` varchar(64),
  `create_date` date,
  `modified_by` varchar(64),
  `modify_date` date,
  `origin_preferred_time` time default NULL,
  `origin_flexibility` int(11) default NULL,
  `destination_preferred_time` time default NULL,
  `destination_flexibility` int(11) default NULL,
  `gender` varchar(255) default NULL,
  `activation_key` varchar(255) default NULL,
  `account_type` int(10) default '1',
  `ride_contact_type` int(2) default '0',
  `home_work_distance` double default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `login_name` (`login_name`),
  UNIQUE KEY `personal_phone` (`personal_phone`),
  UNIQUE KEY `personal_email` (`personal_email`),
  FOREIGN KEY (customer_id) REFERENCES customer (id),
  FOREIGN KEY (site_id) REFERENCES site (id),
    FOREIGN KEY (company_id) REFERENCES company (id),
  FOREIGN KEY (refered_by) REFERENCES commuter (id)
) ;


#--;

#
# Table structure for table `customer_addresses`
#

CREATE TABLE `customer_addresses` (
  `addresses_id` bigint(20) NOT NULL default '0',
  `address_name` varchar(255) default NULL,
  `city` varchar(255) default NULL,
  `country` varchar(255) default NULL,
  `postal` varchar(255) default NULL,
  `state` varchar(255) default NULL,
  `street_address1` varchar(255) default NULL,
  `street_address2` varchar(255) default NULL,
  `id` int(11) default NULL,
  `created_by` varchar(64),
  `create_date` date,
  `modified_by` varchar(64),
  `modify_date` date,
  KEY `addresses_id` (`addresses_id`)
) ;


#--;
#
# Table structure for table `vanpool`
#
CREATE TABLE `vanpool` (
  `id` bigint(20) NOT NULL auto_increment,
  `company_id` bigint(20) NULL default NULL,
  `name` varchar(255) default NULL,
  `creator` bigint(20) NULL default '0',
  `owner` bigint(20) NULL default '0',
  `start_date` date,
  `end_date` date,
  `description` varchar(255) default NULL,
  `public_availability` int(1) NOT NULL default '0',
  `auto_pay` int(1) NOT NULL default '0',
  `status` int(2) NOT NULL default '0',
  `van_name` varchar(255) NULL ,
  `van_company` varchar(255) NULL ,
  `van_details` varchar(255) NULL ,
  `cost_regular` double default NULL,
  `cost_casual` double default NULL,
  `capacity` int(2) NOT NULL default '6',
  `min_members` int(2) NOT NULL default '2',
  `max_members` int(2) NOT NULL default '6',
  `day_of_week` varchar(255) default NULL,
  `last_ride_date` date NULL,
  `origin_name` varchar(255) default NULL,
  `origin_city` varchar(255) default NULL,
  `origin_country` varchar(255) default NULL,
  `origin_postal` varchar(255) default NULL,
  `origin_state` varchar(255) default NULL,
  `origin_street_address1` varchar(255) default NULL,
  `origin_street_address2` varchar(255) default NULL,
  `origin_longitude` double default NULL,
  `origin_latitude` double default NULL,
  `destination_name` varchar(255) default NULL,
  `destination_city` varchar(255) default NULL,
  `destination_country` varchar(255) default NULL,
  `destination_postal` varchar(255) default NULL,
  `destination_state` varchar(255) default NULL,
  `destination_street_address1` varchar(255) default NULL,
  `destination_street_address2` varchar(255) default NULL,
  `destination_longitude` double default NULL,
  `destination_latitude` double default NULL,
  `driver_rotation_policy` int(11) default NULL,
   `origin_preferred_time` time default NULL,
  `origin_flexibility` int(11) default NULL,
  `destination_preferred_time` time default NULL,
  `destination_flexibility` int(11) default NULL,
  `created_by` varchar(64),
  `create_date` date,
  `modified_by` varchar(64),
  `modify_date` date,
   PRIMARY KEY  (`id`),
   FOREIGN KEY (creator) REFERENCES commuter (id),
      FOREIGN KEY (owner) REFERENCES commuter (id),
    FOREIGN KEY (company_id) REFERENCES company (id)

) ;


#--;

#
# Table structure for table `ride`
#

CREATE TABLE `ride` (
  `id` bigint(20) NOT NULL auto_increment,
  `ride_type` varchar(255) NOT NULL default '',
  `origin_deviation` double default NULL,
  `origin_wait_time_in_seconds` int(11) default '0',
  `destination_deviation` double default NULL,
  `destination_departure_time` datetime default NULL,
  `ride_date` datetime default NULL,
  `destiantion_wait_time_in_seconds` int(11) default '0',
  `note` varchar(255) default NULL,
  `type` int(11) default '0',
  `cost_in_points` double default '0',
  `ride_cost` double default '0',
  `escrow_points` double default '0',
  `creator_role` int(11) default '0',
  `min_passengers` int(11) default '0',
  `max_passengers` int(11) default '0',
  `linked_passengers_count` int(11) default '0',
  `status` int(11) default '0',
  `round_trip` tinyint(1) default NULL,
  `women_only` tinyint(1) default NULL,
  `smoking_allowed` tinyint(1) default NULL,
  `commit_time` datetime default NULL,
  `penalty` int(3) default '0',  
  `origin_distance` double default NULL,
  `distance` double default NULL,
  `dest_distance` double default NULL,
  `is_return_ride` int(11) default '0',
  `is_event_ride` int(11) default '0',
  `event_name`  varchar(255) default NULL,
  `event_type` int(11) default  '0',
  `incentive` int(11) default '0',
  `creater` bigint(20) NOT NULL default '0',
  `event` bigint(20) default '0',
  `driver` bigint(20) NULL default '0',
  `origin_name` varchar(255) default NULL,
  `origin_city` varchar(255) default NULL,
  `origin_country` varchar(255) default NULL,
  `origin_postal` varchar(255) default NULL,
  `origin_state` varchar(255) default NULL,
  `origin_street_address1` varchar(255) default NULL,
  `origin_street_address2` varchar(255) default NULL,
  `origin_longitude` double default NULL,
  `origin_latitude` double default NULL,
  `destination_name` varchar(255) default NULL,
  `destination_city` varchar(255) default NULL,
  `destination_country` varchar(255) default NULL,
  `destination_postal` varchar(255) default NULL,
  `destination_state` varchar(255) default NULL,
  `destination_street_address1` varchar(255) default NULL,
  `destination_street_address2` varchar(255) default NULL,
  `destination_longitude` double default NULL,
  `destination_latitude` double default NULL,
  `carpool_id` bigint(20) default NULL,
    `vanpool_id` bigint(20) default NULL,

  `route_id`  bigint(20),
  `return_ride_id`  bigint(20) default NULL,
  `ride_index` int(11) default '0',
  `join_allowed` tinyint(11) default '1',
  `is_auto_pay` tinyint(11) default '1',
  `xml_string` longtext,
  `created_by` varchar(64),
  `create_date` date,
  `modified_by` varchar(64),
  `modify_date` date,
  `name` varchar(255) default NULL,
  `description` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  FOREIGN KEY (carpool_id) REFERENCES carpool (id),
  FOREIGN KEY (creater) REFERENCES commuter (id),
  FOREIGN KEY (event) REFERENCES event (id),
  FOREIGN KEY (driver) REFERENCES commuter (id),
     FOREIGN KEY (return_ride_id) REFERENCES ride (id),
  FOREIGN KEY (vanpool_id) REFERENCES vanpool (id)

) ;

#--;

#
# Table structure for table `location`
#

CREATE TABLE `location` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `type` varchar(255) default NULL,
  `public` tinyint(1) default '0',
   `marked_public` tinyint(1) default '0',  
  `description` varchar(255) default NULL,
  `address_name` varchar(255) default NULL,
  `address_city` varchar(255) default NULL,
  `address_country` varchar(255) default NULL,
  `address_postal` varchar(255) default NULL,
  `address_state` varchar(255) default NULL,
  `address_street_address1` varchar(255) default NULL,
  `address_street_address2` varchar(255) default NULL,
  `longitude` double default NULL,
  `latitude` double default NULL,
  `user_id` bigint(20) default NULL,
  `created_by` varchar(64),
  `create_date` date,
  `modified_by` varchar(64),
  `modify_date` date,
    PRIMARY KEY  (`id`),
    FOREIGN KEY (user_id) REFERENCES commuter (id)
) ;

#--;

#
# Table structure for table `pudo`
#

CREATE TABLE `pudo` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `type` varchar(255) default NULL,
  `rank` int(11) default '0',
  `description` varchar(255) default NULL,
  `distance` double default NULL,
  `address_name` varchar(255) default NULL,
  `address_city` varchar(255) default NULL,
  `address_country` varchar(255) default NULL,
  `address_postal` varchar(255) default NULL,
  `address_state` varchar(255) default NULL,
  `address_street_address1` varchar(255) default NULL,
  `address_street_address2` varchar(255) default NULL,
  `longitude` double default NULL,
  `latitude` double default NULL,
  `public` tinyint(1) default '0',
  `is_default` tinyint(1) default '0',
     `marked_public` tinyint(1) default '0',  
  `origin_carpoolride_id` bigint(20) default NULL,
  `destination_carpoolride_id` bigint(20) default NULL,
  `home_pudos_id` bigint(20) default NULL,
  `work_pudos_id` bigint(20) default NULL,
  `origin_ride_id` bigint(20) default NULL,
  `dest_ride_id` bigint(20) default NULL,
  `location_id` bigint(20) default NULL,
    `user_id` bigint(20) default NULL,

  `created_by` varchar(64),
  `create_date` date,
  `modified_by` varchar(64),
  `modify_date` date,
  PRIMARY KEY  (`id`),
  FOREIGN KEY (home_pudos_id) REFERENCES commuter (id),
  FOREIGN KEY (work_pudos_id) REFERENCES commuter (id),
  FOREIGN KEY (origin_carpoolride_id) REFERENCES carpool (id),
  FOREIGN KEY (destination_carpoolride_id) REFERENCES carpool (id),
  FOREIGN KEY (origin_ride_id) REFERENCES ride (id),
  FOREIGN KEY (dest_ride_id) REFERENCES ride (id),
  FOREIGN KEY (location_id) REFERENCES location (id),
      FOREIGN KEY (user_id) REFERENCES commuter (id)
  
) ;

#--;

#
# Table structure for table `carpool_preferences`
#

CREATE TABLE `carpool_preferences` (
  `id` bigint(20) NOT NULL auto_increment,
  `commuter_id` bigint(20) NOT NULL default '0',
  `pudo_id` bigint(20) NOT NULL default '0',
  `destination_pudo` bigint(20) NOT NULL default '0',
  `status` int(2) NOT NULL default '0',
  `origin_preferred_time` time default NULL,
  `origin_flexibility` int(11) default NULL,
  `destination_preferred_time` time default NULL,
  `destination_flexibility` int(11) default NULL,
  `is_owner` tinyint(1) default NULL,
  `allow_casual_carpoolers` tinyint(1) default NULL,
  `no_casual_carpoolers` int(2) default NULL,
  `carpool_id` bigint(20) default NULL,
  `created_by` varchar(64),
  `create_date` date,
  `modified_by` varchar(64),
  `modify_date` date,
    `day_of_week` varchar(255) default NULL,
  
  PRIMARY KEY  (`id`),
  FOREIGN KEY (carpool_id) REFERENCES carpool (id),
  FOREIGN KEY (commuter_id) REFERENCES commuter (id),
  FOREIGN KEY (pudo_id) REFERENCES pudo (id),
  FOREIGN KEY (destination_pudo) REFERENCES pudo (id)
) ;

#--;

#
# Table structure for table `ride_passenger`
#

CREATE TABLE `ride_passenger` (
  `id` bigint(20) NOT NULL auto_increment,
  `ride_id` bigint(20) NOT NULL default '0',
  `commuter_id` bigint(20),
  `origin_pudo_id` bigint(20),
  `dest_pudo_id` bigint(20),
  `transaction_points` double default '0',
  `status` int(2) NOT NULL default '0',
   `comments` varchar(255),
   `role` int(1) default '1',
  `created_by` varchar(64),
  `create_date` date,
  `modified_by` varchar(64),
  `modify_date` date,
  PRIMARY KEY  (`id`),
  FOREIGN KEY (ride_id) REFERENCES ride (id),
  FOREIGN KEY (commuter_id) REFERENCES commuter (id)
  #FOREIGN KEY (origin_pudo_id) REFERENCES pudo (id),
  #FOREIGN KEY (dest_pudo_id) REFERENCES pudo (id)
) ;

#--;

#
# Table structure for table `ride_comment`
#

CREATE TABLE `ride_comment` (
  `id` bigint(20) NOT NULL auto_increment,
  `ride_id` bigint(20) NOT NULL default '0',
  `creator_id` bigint(20),
  `comment` longtext,
   `rating` int(11) default '0',
    `status` int(2)  NULL,
      `hide_creator` tinyint(1) default NULL,
    
  PRIMARY KEY  (`id`),
  FOREIGN KEY (ride_id) REFERENCES ride (id),
  FOREIGN KEY (creator_id) REFERENCES commuter (id)
) ;

#--;

#
# Table structure for table `shuttle`
#

CREATE TABLE `shuttle` (
  `id` bigint(20) NOT NULL auto_increment,
  `origin_pudo_id` bigint(20) NOT NULL default '0',
  `description` varchar(255) default NULL,
  `destination_pudo_id` bigint(20) NOT NULL default '0',
  `origin_departure_time` int(2) NOT NULL default '0',
  `destination_arrivle_time` int(2) NOT NULL default '0',
  `schedule` int(2) NOT NULL default '0',
  `created_by` varchar(64),
  `create_date` date,
  `modified_by` varchar(64),
  `modify_date` date,
  PRIMARY KEY  (`id`),
  FOREIGN KEY (origin_pudo_id) REFERENCES pudo (id),
  FOREIGN KEY (destination_pudo_id) REFERENCES pudo (id)
) ;
#--;
#
# Table structure for table `train`
#

CREATE TABLE `train` (
  `id` bigint(20) NOT NULL auto_increment,
  `origin_pudo_id` bigint(20) NOT NULL default '0',
  `description` varchar(255) default NULL,
  `destination_pudo_id` bigint(20) NOT NULL default '0',
  `origin_departure_time` int(2) NOT NULL default '0',
  `destination_arrivle_time` int(2) NOT NULL default '0',
  `schedule` int(2) NOT NULL default '0',
  `created_by` varchar(64),
  `create_date` date,
  `modified_by` varchar(64),
  `modify_date` date,
  PRIMARY KEY  (`id`),
  FOREIGN KEY (origin_pudo_id) REFERENCES pudo (id),
  FOREIGN KEY (destination_pudo_id) REFERENCES pudo (id)
) ;
#--;
#
# Table structure for table `tiger_01`
#

CREATE TABLE `tiger_01` (
  `TLID` int(11) NOT NULL default '0',
  `FRLONG` int(11) NOT NULL default '0',
  `FRLAT` int(11) NOT NULL default '0',
  `TOLONG` int(11) NOT NULL default '0',
  `TOLAT` int(11) NOT NULL default '0',
  `FRADDL` int(11) default NULL,
  `TOADDL` int(11) default NULL,
  `FRADDR` int(11) default NULL,
  `TOADDR` int(11) default NULL,
  `ZIP` int(11) default NULL,
  `ZIP3` int(11) default NULL,
  `FENAME` varchar(30) default NULL,
  `FETYPE` varchar(4) default NULL,
  `FEDIRP` char(2) default NULL,
  `FEDIRS` char(2) default NULL,
  `STATE` int(11) default NULL,
  `COUNTY` int(11) default NULL,
  `PLACE` int(11) default NULL,
  `CFCC` char(3) default NULL,
  `created_by` varchar(64),
  `create_date` date,
  `modified_by` varchar(64),
  `modify_date` date,
  KEY `IDX_NAME` (`FENAME`,`ZIP3`,`FETYPE`,`ZIP`,`FEDIRP`,`FEDIRS`),
  KEY `IDX_TOLAT` (`TOLAT`),
  KEY `IDX_FRLAT` (`FRLAT`)
) ;

#--;
#
# Table structure for table `route`
#

create table `route`
(
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(64) default NULL,
  `description` varchar(255) default NULL,
  `origin_pudo_id`  bigint(20) NOT NULL default '0',
  `departure_time` time default NULL,
  `destination_pudo_id`  bigint(20) NOT NULL default '0',
  `arrival_time` time default NULL,
  `created_by` varchar(64),
  `create_date` date,
  `modified_by` varchar(64),
  `modify_date` date,
  PRIMARY KEY  (`id`),
  FOREIGN KEY (origin_pudo_id) REFERENCES pudo (id),
  FOREIGN KEY (destination_pudo_id) REFERENCES pudo (id)
);

#--;
#
# Table structure for table `route_location`
#

create table `route_location`
(
  `id` bigint(20) NOT NULL auto_increment,
  `route_id`  bigint(20) NOT NULL,
  `pudo_id`  bigint(20) NOT NULL,
  `arrival_time` time default NULL,
  `departure_time` time default NULL,
  `order` int(2),
  `created_by` varchar(64),
  `create_date` date,
  `modified_by` varchar(64),
  `modify_date` date,
  PRIMARY KEY  (`id`),
  FOREIGN KEY (route_id) REFERENCES route (id),
  FOREIGN KEY (pudo_id) REFERENCES pudo (id)
);
#--;
#
# Table structure for table `user_roles`
#

create table `user_role`
(
  `id` bigint(20) NOT NULL auto_increment,
  `user_id`  bigint(20),
  `login_name` varchar(255) default NULL,
  `role_name` varchar(15) not null,
  `created_by` varchar(64),
  `create_date` date,
  `modified_by` varchar(64),
  `modify_date` date,
  PRIMARY KEY  (`id`),
  FOREIGN KEY (`user_id`) REFERENCES commuter (id)
);


#--;
#
# Table structure for table `transportation_operator`
#

create table `transportation_operator`
(
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(64) default NULL,
  `description` varchar(255) default NULL,
  `created_by` varchar(64),
  `create_date` date,
  `modified_by` varchar(64),
  `modify_date` date,
  PRIMARY KEY  (`id`)
);

#--;
#
# Table structure for table `transportation`
#

create table `transportation`
(
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(64) default NULL,
  `description` varchar(255) default NULL,
  `route_id`  bigint(20) NOT NULL,
  `type` int(2) NOT NULL,
  `transportation_operator_id`  bigint(20) NOT NULL,
  `created_by` varchar(64),
  `create_date` date,
  `modified_by` varchar(64),
  `modify_date` date,
  PRIMARY KEY  (`id`),
  FOREIGN KEY (route_id) REFERENCES route (id),
  FOREIGN KEY (transportation_operator_id) REFERENCES transportation_operator (id)
);

#--;
#
# Table structure for table `transportation_strategy`
#

create table `transportation_strategy`
(
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(64) default NULL,
  `description` varchar(255) default NULL,
  `trip_type` int(2) NOT NULL,
  `rank` int(2) NOT NULL,
  `created_by` varchar(64),
  `create_date` date,
  `modified_by` varchar(64),
  `modify_date` date,
  PRIMARY KEY  (`id`)
);

#--;
#
# Table structure for table `transportation_segment`
#

create table `transportation_segment`
(
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(64) default NULL,
  `description` varchar(255) default NULL,
  `transportation_type` int(2) NOT NULL,
  `order` int(2) NOT NULL,
  `transportation_strategy_id`  bigint(20) NOT NULL,
  `created_by` varchar(64),
  `create_date` date,
  `modified_by` varchar(64),
  `modify_date` date,
  PRIMARY KEY  (`id`),
  FOREIGN KEY (transportation_strategy_id) REFERENCES transportation_strategy (id)
);

#--;
#
# Table structure for table `contact information`
#

create table `contact_user_detail`
(
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(64) default NULL,
  `contact_detail` varchar(255) NOT NULL,
  `displayed` int(1) NOT NULL default '0',
  `contacted_user`  bigint(20)  NULL,
  `created_by` varchar(64),
  `create_date` date,
  `modified_by` varchar(64),
  `modify_date` date,
  PRIMARY KEY  (`id`),
  FOREIGN KEY (contacted_user) REFERENCES commuter (id)
);
#--;
#
# Table structure for table `commuter_preference`
#

create table `commuter_preference`
(
  `id` bigint(20) NOT NULL auto_increment,
  `communication_mode` int(2) default NULL,
  `communication_type` int(2) default NULL,
  `communication_value` varchar(255) default NULL,
  `nick_name` varchar(255) default NULL,
  `commuter_id` bigint(20) NULL default '0',
  `created_by` varchar(64),
  `create_date` date,
  `modified_by` varchar(64),
  `modify_date` date,
  PRIMARY KEY  (`id`),
 FOREIGN KEY (commuter_id) REFERENCES commuter (id)
);


#--;
#
# Table structure for table `commuter_contact_preference`
#

create table `commuter_contact_preference`
(
  `id` bigint(20) NOT NULL auto_increment,
  `communication_mode` int(2) default NULL,
  `communication_type` int(2) default NULL,
  `communication_value` varchar(255) default NULL,
  `commuter_id` bigint(20) NULL default '0',
  `created_by` varchar(64),
  `create_date` date,
  `modified_by` varchar(64),
  `modify_date` date,
  PRIMARY KEY  (`id`),
 FOREIGN KEY (commuter_id) REFERENCES commuter (id)
);

#--;
#
# Table structure for table `feedback`
#

create table `feedback`
(
  `id` bigint(20) NOT NULL auto_increment,
  `topic` varchar(64) NOT NULL,
  `message` varchar(1000) NOT NULL,
  `email` varchar(255) NULL,
  `employer` varchar(255) NULL, 
  `user`  bigint(20)  NULL,
   `created_on` datetime default NULL,
  `created_by` varchar(64),
  `create_date` date,
  `modified_by` varchar(64),
  `modify_date` date,
  PRIMARY KEY  (`id`),
  FOREIGN KEY (user) REFERENCES commuter (id)
);


#--;
#
# Table structure for table `favorites`
#

create table `commuter_favourites`
(
  `id` bigint(20) NOT NULL auto_increment,
  `favorite` bigint(20) default NULL,
  `commuter_id` bigint(20) default NULL,
  `created_by` varchar(64),
  `create_date` date,
  `modified_by` varchar(64),
  `modify_date` date,
  PRIMARY KEY  (`id`),
  FOREIGN KEY (favorite) REFERENCES commuter (id),
  FOREIGN KEY (commuter_id) REFERENCES commuter (id)
);

#--;
#
# Table structure for table `Blocked Users`
#

create table `commuter_blocked`
(
  `id` bigint(20) NOT NULL auto_increment,
  `block` bigint(20) default NULL,
  `commuter_id` bigint(20) default NULL,
  `created_by` varchar(64),
  `create_date` date,
  `modified_by` varchar(64),
  `modify_date` date,
  PRIMARY KEY  (`id`),
  FOREIGN KEY (block) REFERENCES commuter (id),
  FOREIGN KEY (commuter_id) REFERENCES commuter (id)
);


#--;
#
# Table structure for table `Ride Account`
#
create table `ride_account`
(
  `id` bigint(20) NOT NULL auto_increment,
  `ride_id` bigint(20) default NULL,
  `rider` bigint(20) default NULL,
  `type` int(2) default NULL,
  `role` int(2) default NULL,
  `transaction_point` double default '0',
  `description` varchar(255) default NULL,
  `created_by` varchar(64),
  `create_date` date,
  `modified_by` varchar(64),
  `modify_date` date,
  PRIMARY KEY  (`id`),
  FOREIGN KEY (ride_id) REFERENCES ride (id),
  FOREIGN KEY (rider) REFERENCES commuter (id)
);

#--;
#
# Table structure for table `ride_review`
#

create table `rider_review`
(
  `id` bigint(20) NOT NULL auto_increment,
  `comment` longtext,
  `rating` int(11) default '0',
  `comment_for`  bigint(20)  NULL,
  `status` int(2)  NULL,
  `role` int(2)  NULL,
  `comment_by`  bigint(20)  NULL,
  `hide_creator` tinyint(1) default NULL,
  `ride`  bigint(20)  NULL,
  `created_on` datetime default NULL,
  `created_by` varchar(64),
  `create_date` date,
  `modified_by` varchar(64),
  `modify_date` date,
  PRIMARY KEY  (`id`),
  FOREIGN KEY (comment_for) REFERENCES commuter (id),
  FOREIGN KEY (comment_by) REFERENCES commuter (id),
  FOREIGN KEY (ride) REFERENCES ride (id)  
);

#--;
#
# Table structure for table `purchase_history`
#

create table `purchase_history`
(
  `id` bigint(20) NOT NULL auto_increment,
  `type` varchar(255) default NULL,
  `points` int(11) default NULL,
  `transaction_date` datetime default NULL,
  `commuter_id` bigint(20) NULL default '0',
  `created_by` varchar(64),
  `create_date` date,
  `modified_by` varchar(64),
  `modify_date` date,
  PRIMARY KEY  (`id`),
 FOREIGN KEY (commuter_id) REFERENCES commuter (id)
);

#--;

#
# Table structure for table `notification`
#

CREATE TABLE `notification` (
  `id` bigint(20) NOT NULL auto_increment,
  `type` int(2) NULL default NULL,

  `ride_id` bigint(20)  NULL,
    `carpool_id` bigint(20) NULL,

  `commuter_id` bigint(20),
  `notification_by` bigint(20),
  `message` longtext,
  `user_message` longtext,
  `notification_date` datetime default NULL,
  `displayed` tinyint(1) default NULL,
  `action_required` tinyint(1) default NULL,
  `action_type` int(2) NULL default NULL,  
  PRIMARY KEY  (`id`),
  FOREIGN KEY (ride_id) REFERENCES ride (id),
    FOREIGN KEY (carpool_id) REFERENCES carpool (id),

  FOREIGN KEY (commuter_id) REFERENCES commuter (id),
  FOREIGN KEY (notification_by) REFERENCES commuter (id)   
) ;


#--;
#
# Table structure for table `commuter_ride_preference`
#

create table `commuter_ride_preference`
(
  `id` bigint(20) NOT NULL auto_increment,
  `pref_Type` int(2) default NULL,
  `pref_Value` varchar(255) default NULL,
  `commuter_id` bigint(20) NULL default '0',
  `created_by` varchar(64),
  `create_date` date,
  `modified_by` varchar(64),
  `modify_date` date,
  PRIMARY KEY  (`id`),
 FOREIGN KEY (commuter_id) REFERENCES commuter (id)
);


#--;
#
# Table structure for table `ride_preference`
#

create table `ride_preference`
(
  `id` bigint(20) NOT NULL auto_increment,
  `pref_Type` int(2) default NULL,
  `pref_Value` varchar(255) default NULL,
  `ride_id` bigint(20) NULL default '0',
  `created_by` varchar(64),
  `create_date` date,
  `modified_by` varchar(64),
  `modify_date` date,
  PRIMARY KEY  (`id`),
 FOREIGN KEY (ride_id) REFERENCES ride (id)
);

#--;
#
# Table structure for table `notification_preference`
#

create table `notification_preference`
(
  `id` bigint(20) NOT NULL auto_increment,
  `pref_type` int(2) default NULL,
  `pref_value_email` varchar(255) default NULL,
  `pref_value_onsite` varchar(255) default NULL,
  `pref_value_mobile` varchar(255) default NULL,  
  `email_type` bigint(20) default NULL,
  `mobile_type` bigint(20) default NULL,
  `commuter_id` bigint(20) NULL default '0',
  `created_by` varchar(64),
  `create_date` date,
  `modified_by` varchar(64),
  `modify_date` date,
  PRIMARY KEY  (`id`),
 FOREIGN KEY (commuter_id) REFERENCES commuter (id),
  FOREIGN KEY (email_type) REFERENCES commuter_preference (id),
 FOREIGN KEY (mobile_type) REFERENCES commuter_preference (id)
);



#--;
#
# Table structure for table `notification_preference`
#

create table `car_details`
(
  `id` bigint(20) NOT NULL auto_increment,
  `make` varchar(255) default NULL,
  `model` varchar(255) default NULL,
  `year` varchar(255) default NULL,
  `color` varchar(255) default NULL,
  `mobile_type` bigint(20) default NULL,
  `miles_per_gallon`  double NULL default '0',
  `commuter_id` bigint(20) NULL default '0',
  `created_by` varchar(64),
  `create_date` date,
  `modified_by` varchar(64),
  `modify_date` date,
  PRIMARY KEY  (`id`),
 FOREIGN KEY (commuter_id) REFERENCES commuter (id)
);



#--;
#
# Table structure for table `vanpool_member_preferences`
#
CREATE TABLE `vanpool_member_preferences` (
  `id` bigint(20) NOT NULL auto_increment,
  `commuter_id` bigint(20) NOT NULL default '0',
  `origin_pudo_id` bigint(20) NOT NULL default '0',
  `destination_pudo` bigint(20) NOT NULL default '0',
  `status` int(2) NOT NULL default '0',
  `role` int(2) NOT NULL default '0',
  `type` int(2) NOT NULL default '0', 
  `drive_on` varchar(20) default NULL,
  `vanpool_id` bigint(20) default NULL,
  `created_by` varchar(64),
  `create_date` date,
  `modified_by` varchar(64),
  `modify_date` date,
   `day_of_week` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  FOREIGN KEY (vanpool_id) REFERENCES vanpool (id),
  FOREIGN KEY (commuter_id) REFERENCES commuter (id),
  FOREIGN KEY (origin_pudo_id) REFERENCES pudo (id),
  FOREIGN KEY (destination_pudo) REFERENCES pudo (id)
) ;


#--;
#
# Table structure for table `vanpool_member_preferences`
#
CREATE TABLE `vanpool_wishlist_member_preferences` (
  `id` bigint(20) NOT NULL auto_increment,
  `commuter_id` bigint(20) NOT NULL default '0',
  `origin_pudo_id` bigint(20) NOT NULL default '0',
  `destination_pudo` bigint(20) NOT NULL default '0',
  `status` int(2) NOT NULL default '0',
  `role` int(2) NOT NULL default '0',
  `type` int(2) NOT NULL default '0',
  `vanpool_id` bigint(20) default NULL,
  `created_by` varchar(64),
  `create_date` date,
  `modified_by` varchar(64),
  `modify_date` date,
  PRIMARY KEY  (`id`),
  FOREIGN KEY (vanpool_id) REFERENCES vanpool (id),
  FOREIGN KEY (commuter_id) REFERENCES commuter (id),
  FOREIGN KEY (origin_pudo_id) REFERENCES pudo (id),
  FOREIGN KEY (destination_pudo) REFERENCES pudo (id)
) ;

#--;
#
# Table structure for table `Group`
#

create table `commuter_group`
(
  `id` bigint(20) NOT NULL auto_increment,
  `group_name` varchar(255) default NULL,
  `details` varchar(255) default NULL,
  `max_members` int(11) default '0',
  `created_by` varchar(64),
  `create_date` date,
  `modified_by` varchar(64),
  `modify_date` date,
  `status` int(2) default NULL,
  PRIMARY KEY  (`id`)
);
#--;
#
# Table structure for table `Group_Member`
#
create table `group_member`
(
  `id` bigint(20) NOT NULL auto_increment,
  `group_id` bigint(20) NULL default '0',
  `member_id` bigint(20) NULL default '0',
  `type` int(11) default '0',
  `status` int(11) default '0',
  `created_by` varchar(64),
  `create_date` date,
  `modified_by` varchar(64),
  `modify_date` date,
  PRIMARY KEY  (`id`),
  FOREIGN KEY (group_id) REFERENCES commuter_group (id),
  FOREIGN KEY (member_id) REFERENCES commuter (id)
);


#--;

ALTER TABLE CARPOOL ADD FOREIGN KEY (route_id) REFERENCES route (id);

#--;

ALTER TABLE RIDE ADD FOREIGN KEY (route_id) REFERENCES route (id);

#--;

ALTER TABLE CARPOOL ADD FOREIGN KEY (driver) REFERENCES commuter (id);

#--;

ALTER TABLE CARPOOL ADD FOREIGN KEY (creater) REFERENCES commuter (id);

