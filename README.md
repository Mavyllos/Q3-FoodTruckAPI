## Synopsis

An API written in Swift, utilizing Kitura, CloudFoundaryEnv, CouchDB/Cloudant NoSQL DB, and Bluemix.

## API Reference

API Hosted on Bluemix @ https://foodtruckapi-mavyllos.mybluemix.net

### Routes

#### Food Trucks:

**All Food Trucks (GET) -** ../api/v1/trucks

**Single Food Truck by Truck ID (GET) -** ../api/v1/trucks/{truck_id

**Delete Truck by Truck ID (DELETE) -** ../api/v1/trucks/{truck_id}

**New Truck (POST) -** ../api/v1/trucks

**Update Truck by Truck ID (PUT) -** ../api/v1/trucks/{truck_id}

**Total Number Of Trucks (GET) -** ../api/v1/trucks/count


#### Reviews:

**New Review (POST) -** ../api/v1/reviews/{truck_id}

**Reviews by Truck (GET) -** ../api/v1/trucks/reviews/{truck_id}

**Number of Reviews by Truck (GET) -** ../api/v1/reviews/count/{truck_id}

**Total Reviews in Database (GET) -** ../api/v1/reviews/count

**Average Review Rating by Truck (GET) -** ../api/v1/reviews/rating/{truck_id}

**Single Review by Review ID (GET) -** ../api/v1/reviews/{review_id}

**Update Review by Review ID (PUT) -** ../api/v1/reviews/{review_id}

**Delete Review by Review ID (DELETE) -** ../api/v1/reviews/{review_id}
