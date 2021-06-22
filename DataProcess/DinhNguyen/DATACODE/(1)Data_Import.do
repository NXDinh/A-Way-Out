
*===============================================================================
*USA Population by state========================================================
import delimited using "$dataraw/nst-est2019-alldata.csv", clear

drop if name == "Puerto Rico"
destring region division, replace

drop census2010pop estimatesbase2010

reshape long popestimate npopchg_ births deaths naturalinc internationalmig domesticmig  netmig residual rbirth rdeath rnaturalinc rinternationalmig rdomesticmig rnetmig,	///
 i(sumlev region division state) j(year)
 
save "$datatemp/cencus_pop_all", replace
*===============================================================================





*===============================================================================
*USA Population by state, sex, age and race=====================================
import delimited using "$dataraw/sc-est2019-alldata6.csv", clear

drop if name == "Puerto Rico"
destring region division, replace

drop census2010pop estimatesbase2010

reshape long popestimate,	///
 i(sumlev region division state sex origin race age) j(year)
 
save "$datatemp/cencus_pop_demo", replace
*===============================================================================





*===============================================================================
*Real Personal Income by state==================================================
import delimited using "$dataraw/SARPI_STATE_2008_2019.csv", clear

drop in 105/108
drop if linecode == 1
drop tablename linecode industryclassification description unit

drop if geoname == "Puerto Rico"
replace geofips = subinstr(geofips, `"""', "", 2)
destring region geofips, replace



reshape long v, i(region geofips geoname) j(year)
ren v percap_real_inc
replace year = year + 1999
 
save "$datatemp/cencus_pop_demo", replace
*===============================================================================






*===============================================================================
*Real Personal Income by state==================================================
import delimited using "$dataraw/CAEMP25N__ALL_AREAS_2001_2019.csv", clear

drop in 105535/105538
drop if linecode == 1
drop tablename   industryclassification 
 

drop if geoname == "Puerto Rico"
replace geofips = subinstr(geofips, `"""', "", 2)
destring region geofips, replace



reshape long v, i(region geofips geoname linecode description) j(year)
ren v percap_real_inc
replace year = year + 1999
 
save "$datatemp/cencus_pop_demo", replace
*===============================================================================

