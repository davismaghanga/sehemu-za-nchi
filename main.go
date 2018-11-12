package main

import (
	"fmt"
	"net/http"
	"encoding/json"

)
import "database/sql"
import _ "github.com/go-sql-driver/mysql"

type Region struct{
	Id int `json:"id"`
	Region string `json:"name"`
}

type County struct{
	Id int `json:"id"`
	County string `json:"name"`
	RegionId int `json: "region_id"`
}

type SubCounty struct{
	Id int `json:"id"`
	Subcounty string `json:"name"`
	CountyId int `json:"county_id"`
	RegionId int `json:"region_id"`
}

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "Hello, you've requested: %s\n", r.URL.Path)
	})

	http.HandleFunc("/regions",ShowRegions)
	http.HandleFunc("/counties",ShowCounties)
	http.HandleFunc("/subcounties",ShowSubCounties)



	http.ListenAndServe(":8000", nil)
}



func ShowRegions(w http.ResponseWriter, r *http.Request){

	//establish the database connection
	db, err := sql.Open("mysql", "root:adminadmin@/sales")
	if(err!=nil){
		panic("The database connection could not be established")
	}

	// stmSelect, err := db.Prepare("SELECT region FROM regions")

	// var region Region
	// err = stmSelect.QueryRow().Scan(&region.Region)
	// if(err!=nil){
	// 	panic(err.Error())
	// }

	regions := []Region{}

	rows, err := db.Query("SELECT region,id FROM regions")

	if err != nil {
	    panic(err.Error())
	}

	for rows.Next() {
	    var region Region
	    if err := rows.Scan(&region.Region,&region.Id); err != nil {
	        //log.Println(err.Error())
	    }

	    regions = append(regions, region)
	}

	res1B, _ := json.Marshal(regions)
    // fmt.Println(string(res1B))
	fmt.Fprintf(w, "%s", string(res1B))

}





//showCounties

func ShowCounties(w http.ResponseWriter, r *http.Request){

//establish the database connection
	db, err := sql.Open("mysql", "root:adminadmin@/sales")
	if(err!=nil){
		panic("The database connection could not be established")
	}

	// stmSelect, err := db.Prepare("SELECT region FROM regions")

	// var region Region
	// err = stmSelect.QueryRow().Scan(&region.Region)
	// if(err!=nil){
	// 	panic(err.Error()
	// }

	counties := []County{}

	rows, err := db.Query("SELECT id,county,region_id FROM counties")

	if err != nil {
	    panic(err.Error())
	}

	for rows.Next() {
	    var county County
	    if err := rows.Scan(&county.Id,&county.County,&county.RegionId); err != nil {
	        //log.Println(err.Error())
	    }

	    counties = append(counties, county)
	}

	res1B, _ := json.Marshal(counties)
    // fmt.Println(string(res1B))
	fmt.Fprintf(w, "%s", string(res1B))


}

func ShowSubCounties(w http.ResponseWriter, r *http.Request){
	//establish the database connection
	db, err := sql.Open("mysql", "root:adminadmin@/sales")
	if(err!=nil){
		panic("The database connection could not be established")
	}

	// stmSelect, err := db.Prepare("SELECT region FROM regions")

	// var region Region
	// err = stmSelect.QueryRow().Scan(&region.Region)
	// if(err!=nil){
	// 	panic(err.Error()
	// }

	Subcounties := []SubCounty{}

	rows, err := db.Query("SELECT id,subcounty,county_id,region_id FROM sub_counties")

	if err != nil {
	    panic(err.Error())
	}

	for rows.Next() {
	    var SubCountie SubCounty
	    if err := rows.Scan(&SubCountie.Id,&SubCountie.Subcounty,&SubCountie.CountyId,&SubCountie.RegionId); err != nil {
	        //log.Println(err.Error())
	    }

	    Subcounties = append(Subcounties, SubCountie)
	}

	res1B, _ := json.Marshal(Subcounties)
    // fmt.Println(string(res1B))
	fmt.Fprintf(w, "%s", string(res1B))


}


// type SubCounty struct{
// 	Id int `json:"id"`
// 	Subcounty string `json:"name"`
// 	countyId int `json:"county_id"`
// 	regionId int `json:"region_id"`
// }
